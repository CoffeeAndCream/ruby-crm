# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'legacy-exteriors.com',
    :port           => 587,
    :user_name      => 'shulse@legacy-exteriors.com',
    :password       => '*****************',
    :authentication => :plain
}
