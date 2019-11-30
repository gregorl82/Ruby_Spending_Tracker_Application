class Budget

  attr_accessor :budget_name, :budget_amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @budget_name = options['budget_name']
    @budget_amount = options['budget_amount'].to_f()
  end


end
