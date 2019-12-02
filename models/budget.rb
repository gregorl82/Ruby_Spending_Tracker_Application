require_relative('../db/sql_runner.rb')
require_relative('transaction.rb')

class Budget

  attr_accessor :budget_name, :budget_amount, :warning_limit
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @budget_name = options['budget_name']
    @budget_amount = options['budget_amount'].to_f()
    @warning_limit = options['warning_limit'].to_f()
  end

  def save()
    sql = "INSERT INTO budgets (budget_name, budget_amount, warning_limit) VALUES ($1, $2, $3) RETURNING id"
    values = [@budget_name, @budget_amount, @warning_limit]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    budgets = SqlRunner.run(sql)
    return budgets.map {|budget| Budget.new(budget)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Budget.new(result)
  end

  def update()
    sql = "UPDATE budgets SET (budget_name, budget_amount, warning_limit) = ($1, $2, $3) WHERE id = $4"
    values = [@budget_name, @budget_amount, @warning_limit, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  # method to get all the transactions for a budget

  def transactions()
    sql = "SELECT transactions.*
      FROM transactions
      INNER JOIN budgets
      ON budgets.id = budget_id
      WHERE budget_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map {|transaction| Transaction.new(transaction)}
  end

  # method to get the total spent for a budget

  def total_spent()
    sql = "SELECT SUM(amount)
      FROM transactions
      INNER JOIN budgets
      ON budgets.id = budget_id
      WHERE budget_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result[0]['sum'].to_f()
  end

end
