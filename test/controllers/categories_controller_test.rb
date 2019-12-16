require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "test")
    end

    test 'get index' do
        get categories_path
        assert_response :success   
    end

    test 'get new' do
        get new_category_path
        assert_response :success    
    end

    test 'get show' do
        get category_path(@category)
        assert_response :success    
    end

end