namespace :my_mailer do
  desc "sends daily reports to people"
  task email_sender: :environment do
    User.find_each do |user|
      UserMailer.daily_mail(user).deliver if !user.authenticate_active_admin_user!
    end
  end
end
