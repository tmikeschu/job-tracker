module CommentsHelper
  def save_comment(comment)
    if comment.save
      flash[:success] = "Comment added!"
      redirect_to company_job_path(comment.job.company, comment.job)
    else
      @errors = @comment.errors.full_messages
      render "jobs/show"
    end
  end
end
