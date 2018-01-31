require 'spec_helper'

describe Quoinex::API do
  subject(:ruby_gem) { Quoinex::API.new }

  describe ".new" do
    it "makes a new instance" do
      expect(ruby_gem).to be_a Quoinex::API
    end
  end
end
