class Tag

  attr_accessor :tag_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @tag_name = options['tag_name'].capitalize()
  end

#
end
