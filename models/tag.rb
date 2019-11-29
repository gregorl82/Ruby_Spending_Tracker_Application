require_relative('../db/sql_runner.rb')

class Tag

  attr_accessor :tag_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @tag_name = options['tag_name'].capitalize()
  end

  def save()
    sql = "INSERT INTO tags (tag_name) VALUES ($1) RETURNING id"
    values = [@tag_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

#
end
