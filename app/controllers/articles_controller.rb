class ArticlesController < ApplicationController
  before_action :set_article, only: [:update]

  def create
    @article = Article.new(article_params)

    if @article.save
      notify_third_parties(@article)
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      notify_third_parties(@article)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def notify_third_parties(post)
    WebhookNotifier.new(post).notify
  end
end
