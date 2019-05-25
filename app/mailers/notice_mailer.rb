class NoticeMailer < ApplicationMailer

  def create_comment(comment)
    @comment = comment

    mail to: "system@example.org", subject: "新しいコメントが投稿されました"
  end
end
