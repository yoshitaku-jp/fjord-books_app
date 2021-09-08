# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    resource, id = request.path.split('/')[1, 2]
    commentable = resource.singularize.classify.constantize.find(id)
    comment = commentable.comments.new(comment_params.merge(user: current_user))

    comment.save!
    redirect_to commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) 
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
