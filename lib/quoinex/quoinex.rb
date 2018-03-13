require 'rest-client'
require 'json'
require 'base64'
require 'byebug'
require 'jwt'

module Quoinex
  class API
    attr_reader :key,
                :secret,
                :url

    def initialize(key:, secret:, url: 'https://api.quoine.com')
      @key = key
      @secret = secret
      @url = url
    end

    def crypto_accounts
      get('/crypto_accounts')
    end

    def balances
      get('/accounts/balance')
    end

    def order(id)
      get("/orders/#{id}")
    end

    def orders
      get('/orders')
    end

    def products
      get('/products')
    end

    def cancel_order(id)
      put("/orders/#{id}/cancel")
    rescue => e
      handle_error(e, Quoinex::CancelOrderException)
    end

    def create_order(side:, size:, price:, product_id:)
      opts = {
        order: {
          order_type: :limit,
          product_id: product_id,
          side: side,
          quantity: size.to_f.to_s,
          price: price.to_f.to_s,
        }
      }
      order = post('/orders', opts)

      if !order['id']
        error ||= order
        raise Quoinex::CreateOrderException, error
      end

      order
    rescue => e
      handle_error(e, Quoinex::CreateOrderException)
    end

    # private

    def handle_error(e, exception)
      error = (JSON.parse(e.http_body) rescue nil) if e.http_body
      error ||= e.message

      raise exception, error
    end

    def signature(path)
      auth_payload = {
        path: path,
        nonce: DateTime.now.strftime('%Q'),
        token_id: @key
      }

      JWT.encode(auth_payload, @secret, 'HS256')
    end

    def get(path, opts = {})
      uri = URI.parse("#{@url}#{path}")
      uri.query = URI.encode_www_form(opts[:params]) if opts[:params]

      response = RestClient.get(uri.to_s, auth_headers(uri.request_uri))

      if !opts[:skip_json]
        JSON.parse(response.body)
      else
        response.body
      end
    end

    def post(path, payload, opts = {})
      data = JSON.unparse(payload)
      response = RestClient.post("#{@url}#{path}", data, auth_headers(path))

      if !opts[:skip_json]
        JSON.parse(response.body)
      else
        response.body
      end
    end

    def put(path, opts = {})
      response = RestClient.put("#{@url}#{path}", nil, auth_headers(path))

      if !opts[:skip_json]
        JSON.parse(response.body)
      else
        response.body
      end
    end

    def delete(path, opts = {})
      response = RestClient.delete("#{@url}#{path}", auth_headers(path))

      if !opts[:skip_json]
        JSON.parse(response.body)
      else
        response.body
      end
    end

    def auth_headers(path)
      sign = signature(path)

      {
        'Content-Type' => 'application/json',
        'X-Quoine-API-Version' => 2,
        'X-Quoine-Auth' => sign,
      }
    end
  end
end
