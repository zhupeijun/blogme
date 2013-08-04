class ArticleTagsController < ApplicationController
  before_action :set_article_tag, only: [:show, :edit, :update, :destroy]

  # GET /article_tags
  # GET /article_tags.json
  def index
    @article_tags = ArticleTag.all
  end

  # GET /article_tags/1
  # GET /article_tags/1.json
  def show
  end

  # GET /article_tags/new
  def new
    @article_tag = ArticleTag.new
  end

  # GET /article_tags/1/edit
  def edit
  end

  # POST /article_tags
  # POST /article_tags.json
  def create
    @article_tag = ArticleTag.new(article_tag_params)

    respond_to do |format|
      if @article_tag.save
        format.html { redirect_to @article_tag, notice: 'Article tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @article_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_tags/1
  # PATCH/PUT /article_tags/1.json
  def update
    respond_to do |format|
      if @article_tag.update(article_tag_params)
        format.html { redirect_to @article_tag, notice: 'Article tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_tags/1
  # DELETE /article_tags/1.json
  def destroy
    @article_tag.destroy
    respond_to do |format|
      format.html { redirect_to article_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_tag
      @article_tag = ArticleTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_tag_params
      params.require(:article_tag).permit(:article_id, :tag)
    end
end
