class ArticlesController < ApplicationController
	#gem devise for authentica user admin is log in
	before_action :authenticate_admin!, only: [:new, :create, :edit, :destroy]	

	before_action :find_article, except: [:new, :create, :index, :from_author]
	def new
		@article = Article.new
		@categories = Category.all
	end
	def create
		@article = current_admin.articles.create(strong_article_params)
		@article.save_categories
		redirect_to @article
		#redirect_to articles_path
		#render json: @article
	end
	def show
	end
	def edit
		@categories = Category.all
	end
	def update
		@article.update(strong_article_params)
		@article.save_categories
		
		redirect_to @article
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end
	
	def index
		@articles = Article.all		
	end

	def from_author
		@user_admin = Admin.find(params[:admin_id])	
	end

	def find_article
		@article = Article.find(params[:id])
	end
	# Strong params (Buenas Practicas) Refactor code and security params
	def strong_article_params
		params.require(:article).permit(:title,:status,:content,category_elements: [])
	end
end
