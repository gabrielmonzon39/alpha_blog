class ArticlesController < ApplicationController

    before_action :find_article, only:[:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.paginate(page: params[:page], per_page:5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(get_params)
        @article.user = User.find(session[:user_id])
        if @article.save
            flash[:success] = "Article created succesfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(get_params)
            flash[:success] = "Article updated succesfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show
    end
    
    def destroy
        @article.destroy
        flash[:success] = "Article deleted succesfully"
        redirect_to articles_path
    end

    private
        def get_params
            params.require(:article).permit(:title, :description, category_ids:[])
        end

        def find_article
            @article = Article.find(params[:id])
        end

    
        
end