class UserMailer < ActionMailer::Base
  default from: 'contact@washed.fr'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Bienvenue sur Washed')
    # This will render a view in `app/views/user_mailer`!
  end
end
