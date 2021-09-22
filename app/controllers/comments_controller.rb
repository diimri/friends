class CommentsController < InheritedResources::Base
  before_action :set_post
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment =@post.comments.new(comment_params)
    @comment.user= current_user
    if @comment.save
      redirect_to @post, notice: 'Thanks for your comment'
    else
      redirect_to @post, notice: 'Unable to add comment'
    end
  end

  private

    # def set_post
    #   params.require(:comment).permit(:body, :post_id)
    # end

    def comment_params
      params.require(:comment).permit(:body, :user_id,:post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

end




#wayss to write path
#<%= link_to 'Comments', new_post_comment_path(@post, @comment) %>

# <%= form_with model: [@post,@comment] do |f| %>
# <%= f.text_field :body %>
# <%= f.submit "Comment" %>
# <% end %>
