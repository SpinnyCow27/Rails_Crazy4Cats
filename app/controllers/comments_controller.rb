class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user unless comment_params[:anonymous] == '1'

    if @comment.save
      redirect_to @post, notice: 'Comentario hecho exitosamente.'
    else
      redirect_to @post, alert: 'El comentario no ha podido ser realizado.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :anonymous)
  end
end
