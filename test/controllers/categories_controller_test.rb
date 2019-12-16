require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "test")
        @user = User.create(user:"gabriel", email:"123@123.com", password:"123", admin:true)
    end

    test 'get index' do
        get categories_path
        assert_response :success   
    end

    test 'get new' do
        sign_in_as(@user, "123")
        get new_category_path
        assert_response :success    
    end

    test 'get show' do
        get category_path(@category)
        assert_response :success    
    end

    test "should redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do
          post categories_path, params: { category: { name: "sports" } }
        end
        assert_redirected_to categories_path
    end
    
end