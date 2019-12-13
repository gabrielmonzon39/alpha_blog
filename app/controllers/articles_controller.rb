class ArticlesController < ApplicationController

    before_action :find_article, only:[:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(get_params)
        if @article.save
            flash[:notice] = "Article created succesfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(get_params)
            flash[:notice] = "Article updated succesfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show
    end
    
    def destroy
        @article.destroy
        flash[:notice] = "Article deleted succesfully"
        redirect_to articles_path
    end

    private
        def get_params
            params.require(:article).permit(:title, :description)
        end

        def find_article
            @article = Article.find(params[:id])
        end

    
        
end