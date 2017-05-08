class Project < ApplicationRecord
  belongs_to :lead, inverse_of: :project
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  attr_accessor :name, :details, :completed, :salesperson

end
