class ArticlesController < ApplicationController

	before_action :find_article, except: [:new, :create, :index]
	
	def new
		@article = Article.new
	end
	def create
		@article = Article.create(title: params[:article][:title],status: params[:article][:status],
		content: params[:article][:content])
		render json: @article
	end
	def show
	end
	def edit
	end
	def update
		@article.update(title: params[:article][:title],status: params[:article][:status],
		content: params[:article][:content])
		
		redirect_to @article
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end
	
	def index
		@articles = Article.all		
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
