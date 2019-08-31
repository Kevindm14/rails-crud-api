class CommentsController < ApplicationController
  before_action :set_comments, only: [:edit, :destroy, :update]
  before_action :set_article
  before_action :set_article_comments, only: [:update, :destroy]

  def index
    json_response(@article.comments)
  end

  def create
    @comment = @article.comments.new(comments_params)
    if @comment.save
      json_response(@comment, :created)
    else
      json_response(@comment.errors, :unprocessable_entity)
    end
  end

  def update
    @comment.update
    json_response(@comment, :ok)
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comments_params
    params.require(:comments).permit(:description)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_article_comments
    @comment = @article.comments.find_by!(id: params[:id]) if @article
  end
end
