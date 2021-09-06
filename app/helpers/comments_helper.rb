# frozen_string_literal: true

module CommentsHelper
  def name_or_email(user)
    if user.name.present?
      user.name
    else
      user.email
    end
  end
end
