require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "test")
    end

    test "Create new categories" do
        assert @category.valid?
    end

    test "Category should be unique" do
        @category.save
        cat = Category.new(name: "test")
        assert_not cat.valid?
    end

    test "Name should not be too short" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "Name should not be too long" do
        @category.name = "a" * 21
        assert_not @category.valid?
    end

    
end