require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/tag.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TagTest < MiniTest::Test

  def test_can_create_tag_and_get_name()
    tag1 = Tag.new(
      {
        'tag_name' => 'entertainment'
      }
    )
    assert_equal('Entertainment', tag1.tag_name)
  end

end
