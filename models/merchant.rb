class Merchant

  attr_accessor :merchant_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_name = options['merchant_name']
  end

#
end
