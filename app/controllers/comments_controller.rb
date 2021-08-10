class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:name, :time, :body, :post_id)
    end

end
