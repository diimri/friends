class PostsController < InheritedResources::Base
  #before_action :correct_user , only: [:create,:edit , :update , :destroy]

  def index
    @posts = Post.all
    #@posts = post.all.where("id NOT IN (user_id)", current_user.id)
    #@friends = Friend.all.where("id != user_id",current_user.id)
  end

  # GET /friends/1 or /friends/1.json
  def show
        
  end

  # GET /friends/new
  def new
    @post = Post.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    byebug
    @post = Post.new(post_params)
   

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
     if @post.update(post_params)
     #if @friend.update(user_id)
        format.html { redirect_to @post, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.posts.find_by(id:params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :time, :body,:user_id)
    end

end
