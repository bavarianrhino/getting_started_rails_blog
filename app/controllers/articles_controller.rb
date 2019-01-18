class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        # Below is used if model has an error handler
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id]) #looks up article to display filled in data
        # render :edit
    end

    def create
        # render plain: params[:article].inspect
        # <ActionController::Parameters {"title"=>"My first Blog article",
        # "text"=>"Lets learn rails....and stuff."} permitted: false>

        # @article = Article.new(params[:article])

        @article = Article.new(article_params)

        # Without Model Validation - Use below
        # @article.save
        # redirect_to @article

        # With Model Validation - Use below
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    # validates :title, presence: true, length: { minimum: 5 }
    # validates :text, presence: true, length: { minimum: 5 }

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
        # use below if no validation is used
        # redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
    def article_params
        # require is normally used for nested parameters
        # {
        #     articles => {
        #         title: "This is a title",
        #         text: "BLAH BLAH"
        #     }
        # }
        # params.permit(:title, :text) /use for non-nesting
        params.require(:article).permit(:title, :text)
    end
end



# Prefix Verb        URI Pattern                              Controller#Action

# welcome_index      GET    /welcome/index(.:format)          welcome#index
# articles           GET    /articles(.:format)               articles#index
#                    POST   /articles(.:format)               articles#create
# new_article        GET    /articles/new(.:format)           articles#new
# edit_article       GET    /articles/:id/edit(.:format)      articles#edit
# article            GET    /articles/:id(.:format)           articles#show
#                    PATCH  /articles/:id(.:format)           articles#update
#                    PUT    /articles/:id(.:format)           articles#update
#                    DELETE /articles/:id(.:format)           articles#destroy
