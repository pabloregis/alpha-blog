class ArticlesController < ApplicationController
  
  #INDEX ------------------------------------------------------------
  def index
    @articles = Article.all
  end
  
  #NEW ------------------------------------------------------------
  def new
    @article = Article.new
  end
  
  #EDIT ------------------------------------------------------------
  def edit
    @article = Article.find(params[:id])
  end
  
  #CREATE ------------------------------------------------------------
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  #UPDATE ------------------------------------------------------------
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  #SHOW ------------------------------------------------------------
  def show
    @article = Article.find(params[:id])
  end
  
  #PRIVATE ------------------------------------------------------------
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end