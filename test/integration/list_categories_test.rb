require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
        @cat = Category.create(name:"testing")
        @cat2 = Category.create(name:"testing2")
    end

    test "list categories" do
        get categories_path
        assert_template 'categories/index'
        assert_select "a[href=?]", category_path(@cat), text: @cat.name
        assert_select "a[href=?]", category_path(@cat2), text: @cat2.name
    end    
    
end