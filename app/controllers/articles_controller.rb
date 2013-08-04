class ArticlesController < ApplicationController
	skip_before_filter :authorize, only: [:show, :index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]


	def submit_comment
	end

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order(date: :desc).page params[:page]
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
		@comment = Comment.new
		@comment.article_id = @article.id
		@comment_list = Comment.where("article_id = #{@article.id}")
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
		
  end

  # POST /articles
  # POST /articles.json
  def create

		@user = User.find_by_id(session[:user_id])
    @article = Article.new(article_params)
		@article.date = Time.now
		@article.author = @user.name
		
		@article.tags.split(/,/).each do |t|
			@article.add_article_tag(t)
		end
		

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

		ArticleTag.delete_all("article_id = #{@article.id}")
		article_params[:tags].split(/,/).each do |t|
			@article.add_article_tag(t)
		end
		
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :date, :author, :tags)
    end
end
