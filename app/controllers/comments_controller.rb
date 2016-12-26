class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @job = current_user.jobs.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = @job.id
    save_comment(@comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
