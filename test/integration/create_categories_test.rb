require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create(user:"gabriel", email:"123@123.com", password:"123", admin:true)
    end

    test "get new form and create category" do
        sign_in_as(@user, "123")
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do
            post categories_path, params:{category:{name:"testingCat"}}
            follow_redirect!
        end
        assert_template 'categories/index'
        assert_match 'testingCat', response.body
    end    
    
    test "wont create invalid category" do
        sign_in_as(@user, "123")
        get new_category_path
        assert_template 'categories/new'
        assert_no_difference 'Category.count' do
            post categories_path, params:{category:{name:"te"}}
        end
        assert_template 'categories/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end
end