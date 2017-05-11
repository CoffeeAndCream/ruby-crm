class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = request.base_url
    if !Company.first.nil?
      company = Company.first
      delivery_options = {
                           user_name: company.company_email,
                           password: company.company_email_password,
                           address: company.smtp_address
                         }
    end
    mail(to: @user.email, subject: 'Welcome to the CRM', delivery_method_options: delivery_options)
  end

  def lead_email(user, lead)
    @user = user
    @lead = lead
    if !Company.first.nil?
      company = Company.first
      delivery_options = {
                           user_name: company.company_email,
                           password: company.company_email_password,
                           address: company.smtp_address
                         }
    end
    mail(to: @user.email, subject: 'Lead Update: ' + lead.fullname, delivery_method_options: delivery_options)
  end
end
