module Quoinex
  class CreateOrderException < RuntimeError; end
  class CancelOrderException < RuntimeError; end
  class UpdateLeverageLevelException < RuntimeError; end
  class CloseTradeException < RuntimeError; end
  class CloseAllTradeException < RuntimeError; end
  class UpdateTradeException < RuntimeError; end
end
