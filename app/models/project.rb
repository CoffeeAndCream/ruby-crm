class Project < ApplicationRecord
  has_one :lead, inverse_of: :project
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  scope :finished, -> finished { where(:finished => finished) }

  attr_accessor :name, :details, :completed, :salesperson

end
