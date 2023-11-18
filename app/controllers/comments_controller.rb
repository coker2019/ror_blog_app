class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:comment][:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment successfully created'
    else
      render 'posts/show', alert: 'There was an error creating the comment'
    end
  end

  def destroy
    @commentdel = Comment.includes(:post).find(params[:id])
    @post = @commentdel.post

    if @commentdel.destroy
      flash[:notice] = 'Comment deleted!'
    else
      flash.now[:errors] = 'Unable to delete comment!'
    end
    redirect_to user_post_path(@post.user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
