class PostMailer < ActionMailer::Base
  default from: "mail@myinstagramclone.com"

  def new_post(post, user)
    @post = post
    mail to: user.email, subject: 'New post created'
  end
end
