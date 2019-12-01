require_relative('../db/sql_runner.rb')

class Budget

  attr_accessor :budget_name, :budget_amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @budget_name = options['budget_name']
    @budget_amount = options['budget_amount'].to_f()
  end

  def save()
    sql = "INSERT INTO budgets (budget_name, budget_amount) VALUES ($1, $2) RETURNING id"
    values = [@budget_name, @budget_amount]
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
    sql = "UPDATE budgets SET (budget_name, budget_amount) = ($1, $2) WHERE id = $3"
    values = [@budget_name, @budget_amount, @id]
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

end
