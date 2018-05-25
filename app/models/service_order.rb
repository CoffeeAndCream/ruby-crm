class ServiceOrder < ApplicationRecord
  belongs_to :lead, optional: true
end
