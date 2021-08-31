class PostsController < InheritedResources::Base
  before_action :correct_user , only: [:create,:edit , :update , :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
  end


  def home
  end



  # GET /friends/1 or /friends/1.json
  def show
    # GET /friends/1 or /friends/1.json
    @post = Post.find(params[:id])
    @fav_exists =Fav.where(post: @post, user:current_user)==[] ? false : true
    @comment=Comment.new
    @comments = @post.comments
    
  end

  # GET /friends/new
  def new
    @post = Post.new
  end

  # GET /friends/1/edit
  def edit
  end


 def update
    respond_to do |format|
     if @post.update(post_params)
     #if @friend.update(user_id)
        format.html { redirect_to @post, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end
 

  def create
    #@post = Post.new(post_params.merge(user_id: current_user.id))#created a new object @post of class  Post(P capital in class)
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post Added!'
    else
      redirect_to @post, notice: 'Unable to add post'
    end
  end

#there are multiple way to associate user with post
# @post.user_id = current_user.id
# @post.user = current_user
# @post = current_user.posts.build(params...)

  # def as_json(options = {})
  #   super(options.merge(include: :user))
  # end

  # PATCH/PUT /friends/1 or /friends/1.json
  # def update
  #   respond_to do |format|
  #   if @post.update(post_params)
  #       format.html { redirect_to @post, notice: "post was successfully updated." }
  #       format.json { render :show, status: :ok, location: @post }
  #   else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #   end
    
  # end



  def destroy
    @post  = Post.find(params[:id])
    if @post.present?
      @post.destroy
    end
    redirect_to @post
  end

  def correct_user
    @post = current_user.posts.find_by(id:params[:id])
  end


  #private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :time, :body,:image)
    end

end



# <!--     <main class="container">
#     <div class="col-md-6 px-0">
#       <h1 class="display-4 fst-italic"><%= link_to post.title,post , class: "btn  btn-sm btn-outline-primary"%></h1>
#       <p class="lead my-3"><%= post.body[0..300] %></p>
#       <p class="lead mb-0"><a href="#" class="text-white fw-bold"><%= link_to "Continue reading...",post %> </a></p>
#     </div>
#   </div>
#  -->
