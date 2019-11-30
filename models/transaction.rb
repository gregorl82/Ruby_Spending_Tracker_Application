require('time')
require_relative('../db/sql_runner.rb')
require_relative('merchant.rb')
require_relative('tag.rb')

class Transaction

  attr_accessor :merchant_id, :tag_id, :amount, :transaction_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @tag_id = options['tag_id'].to_i()
    @amount = options['amount'].to_f()
    @transaction_time = options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, amount, transaction_time) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_id, @tag_id, @amount, @transaction_time]
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

  def update()
    sql = "UPDATE transactions SET (merchant_id, tag_id, amount, transaction_time) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @tag_id, @amount, @transaction_time, @id]
    SqlRunner.run(sql, values)
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

  # class level method to delete a transaction by id
  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  # class level method to find the total of all the transactions
  def self.total()
    sql = "SELECT SUM(amount) FROM transactions"
    result = SqlRunner.run(sql)
    return result[0]['sum'].to_f()
  end

  # method to return the tag via tag_id
  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    result = SqlRunner.run(sql, values).first()
    return Tag.new(result)
  end

  # method to return the merchant via merchant_id
  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values).first()
    return Merchant.new(result)
  end

  # method to display the time part of the transaction_time

  def display_time()
    time = Time.parse(@transaction_time)
    return time.strftime("%H:%M")
  end

  # method to display the date part of the transaction_time

  def display_date()
    date = Time.parse(@transaction_time)
    return date.strftime("%d %b %Y")
  end

  # method to prepopulate the value for datetime-local in edit routes

  def prepopulate_datetime()
    split_string = @transaction_time.split(' ')
    output = split_string[0] + "T" + split_string[1]
    return output
  end

  # method to return transactions ordered by transaction_time
  def self.order_by_time()
    sql = "SELECT * FROM transactions ORDER BY transaction_time"
    transactions = SqlRunner.run(sql)
    return transactions.map {|transaction| Transaction.new(transaction)}
  end

#
end
