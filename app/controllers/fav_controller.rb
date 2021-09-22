class FavController < ApplicationController
  def update
    fav=Fav.where(post: Post.find(params[:post]),user:current_user)
    if fav==[]
      #create new fav
      Fav.create(post: Post.find(params[:post]),user:current_user)
      @fav_exists = true
    else
      #delete fav
      fav.destroy_all
      @fav_exists= false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end




#post.index.erb file below
# <h3> Post that you have liked</h3>
# <% current_user.favs.each do |fav| %>
# <%= link_to fav.post.title,fav.post %>
# <% end %>