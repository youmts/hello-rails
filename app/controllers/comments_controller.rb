class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_entry
  before_action :set_comment, only: [:approve, :destroy]

  # POST /blogs/1/entries/1/comments
  def create
    @comment = @entry.comments.new(comment_params)

    if @comment.save
      render :reload_index
    else
      render :show_errors
    end
  end

  # PUT /blogs/1/entries/1/comments/1/approve
  def approve
    @comment.approve

    if @comment.save
      render :reload_index
    else
      render :show_errors
    end
  end

  # DELETE /blogs/1/entries/1/comments/1
  def destroy
    @comment.destroy
    render :reload_index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_entry
      @entry = @blog.entries.find(params[:entry_id])
    end

    def set_comment
      @comment = @entry.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
