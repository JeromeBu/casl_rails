class ArticlesController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    @activity = @article.activity
    if @article.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :activity_id)
  end
end
