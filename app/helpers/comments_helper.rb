# frozen_string_literal: true

module CommentsHelper
    def name_or_email(comment)
        if comment.user.name? 
            comment.user.name
        else
            comment.user.email
        end
    end
end
