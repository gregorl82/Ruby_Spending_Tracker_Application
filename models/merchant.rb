require_relative('../db/sql_runner.rb')

class Merchant

  attr_accessor :merchant_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name) VALUES ($1) RETURNING id"
    values = [@merchant_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map {|merchant| Merchant.new(merchant)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Merchant.new(result)
  end

  def update()
    sql = "UPDATE merchants SET merchant_name = $1 WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#
end
