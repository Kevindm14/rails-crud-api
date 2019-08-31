class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  
  def index
    @articles = Article.all
    json_response(@articles)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      json_response(@article, :created)
    else
      json_response(@article.errors, :unprocessable_entity)
    end
  end

  def update
    @article.update
    json_response(@article, :ok)
  end

  def destroy
    @article.destroy
    head :no_content
  end

  def show
    render json: @article, include: 'comments'
  end

  private

  def article_params
    params.require(:article).permit(:name, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
