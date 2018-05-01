class Payment < ApplicationRecord
  belongs_to :lead, optional: true
end
