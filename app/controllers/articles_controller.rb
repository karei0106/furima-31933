class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :day_id,
                                    :price, :image, :genre_id)
  end
end
