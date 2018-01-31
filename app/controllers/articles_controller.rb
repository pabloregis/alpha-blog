class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
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
    
  end
  
  #CREATE ------------------------------------------------------------
  def 
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  #UPDATE ------------------------------------------------------------
  def update
    
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  #SHOW ------------------------------------------------------------
  def show
    
  end
  
  #DESTROY ------------------------------------------------------------
  def destroy
    
    @article.destroy
    
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  #PRIVATE ------------------------------------------------------------
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end