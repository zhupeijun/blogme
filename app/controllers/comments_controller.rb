class CommentsController < ApplicationController
  skip_before_filter :authorize, only: [:create, :new]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.order("id desc").first(3)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
		
    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(id: @comment.article_id),
					notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
				#format.html { render :template => "articles/show" }
        format.html { redirect_to article_path(id: @comment.article_id),
					alert: "Please fill in the required field!", comment: @comment }
				#format.html { redirect_to article_path(id: @comment.article_id),
				#	comment_error: @comment.errors}

        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    puts "------------------------"
    puts params[:article_id]
     puts "------------------------"

    respond_to do |format|
      format.html { redirect_to article_path(params[:article_id]) }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:article_id, :nick, :email, :content, :ifnotify, :user_id, :reply_id)
    end
end
