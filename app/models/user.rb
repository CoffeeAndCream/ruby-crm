class User < ApplicationRecord
  has_many :leads, inverse_of: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role?(r)
    unless role.nil?
      role.include? r.to_s
    end
  end
  def fullname
    "#{self.first_name} #{self.last_name}"
  end
end
