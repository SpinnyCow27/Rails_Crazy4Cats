class ReactionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @reaction = @post.reactions.find_or_initialize_by(user: current_user)

    if @reaction.kind == params[:kind]
      redirect_to @post, alert: 'You have already reacted with this option.'
    else
      update_reaction_counts(@reaction, params[:kind])
      @reaction.update(kind: params[:kind])
      redirect_to @post, notice: 'Reaction updated successfully.'
    end
  end

  private

  def update_reaction_counts(reaction, new_kind)
    if reaction.kind == 'like'
      @post.decrement!(:likes_count)
    elsif reaction.kind == 'dislike'
      @post.decrement!(:dislikes_count)
    end

    if new_kind == 'like'
      @post.increment!(:likes_count)
    elsif new_kind == 'dislike'
      @post.increment!(:dislikes_count)
    end
  end

end
