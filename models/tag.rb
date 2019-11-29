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

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map {|tag| Tag.new(tag)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Tag.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#
end
