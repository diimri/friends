class CommentsController < InheritedResources::Base

  #respond_to :html, :xml, :json

  def index
    @comments = Comment.all
  end

  # GET /friends/1 or /friends/1.json
  def show
    # GET /friends/1 or /friends/1.json
  end

  # GET /friends/new
  def new
    @comment = Comment.new
  end

  # GET /friends/1/edit
  def edit
  end

 

  def create
    @comment = Comment.new(comment_params.merge(post_id: current_user.id))
    # here we used this method to create a comment object 
    # as inn migrations we have post id linked to comments
    #@comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: 'Thanks for your comment'
    else

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
    end
  end

 
  def destroy
    @post  = Post.find(params[:id])
    if @post.present?
      @post.destroy
    end
    redirect_to @post
  end


  private

    def comment_params
      params.require(:comment).permit(:name, :time, :body,:post )
    end

end
