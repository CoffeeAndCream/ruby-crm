class Lead < ApplicationRecord
  scope :user, -> user { where(:user => user) }
  scope :city, -> city { where(:city => city) }
  scope :zip, -> zip { where(:zip => zip) }
  scope :fullname, -> fullname { where('(first_name || last_name) LIKE ?', "%#{fullname}%")}
  scope :first_name, -> first_name { where(first_name: first_name.titleize)}
  scope :last_name, -> last_name { where(last_name: last_name.titleize)}
  scope :address, -> address { where('(address || city) LIKE ?', "%#{address}%")}
  scope :city, -> city { where('(city) LIKE ?', "%#{city}%") }
  scope :customer, -> customer { where(customer: customer) }
  #scope :by_period, -> created_at, ended_at { where("created_at = ? AND created_at = ?", created_at, ended_at) }

  belongs_to :user, inverse_of: :leads
  validates :first_name, :last_name, :presence => true
  validates :address, uniqueness: { scope: [:first_name, :last_name],
      :message => "Someone already exists with this name and address." }

  has_many :payments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :service_orders, dependent: :destroy
  has_one :project, inverse_of: :lead, dependent: :destroy
  has_one :job_site, inverse_of: :lead, dependent: :destroy

  def fullname
    "#{first_name} #{last_name}"
  end
  def phonenumber
    phone.tr('^A-Za-z0-9', '')
  end
  def self.search(search)
    if search
      where('(first_name || last_name || address) LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
