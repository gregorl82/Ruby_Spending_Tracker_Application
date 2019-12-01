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

end
