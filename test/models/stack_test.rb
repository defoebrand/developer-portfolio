require 'test_helper'

class StackTest < ActiveSupport::TestCase
  def setup
    @good_stack = stacks(:good_stack)
    @only_name = stacks(:only_name)
    @only_color = stacks(:only_color)
  end

  test 'new stack with only name' do
    assert @only_name.invalid?
  end

  test 'new stack with only color' do
    assert @only_color.invalid?
  end

  test 'new stack with name and color' do
    assert @good_stack.valid?
  end
end
