require_relative('../db/sql_runner.rb')

class Transaction

  attr_accessor :merchant_id, :tag_id, :amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @tag_id = options['tag_id'].to_i()
    @amount = options['amount'].to_f()
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, amount) VALUES ($1, $2, $3) RETURNING id"
    values = [@merchant_id, @tag_id, @amount]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map {|transaction| Transaction.new(transaction)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Transaction.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#
end
