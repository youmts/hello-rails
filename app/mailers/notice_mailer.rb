class NoticeMailer < ApplicationMailer

  def create_comment(comment)
    @comment = comment

    mail to: "youmts22@gmail.com", subject: "新しいコメントが投稿されました"
  end
end
