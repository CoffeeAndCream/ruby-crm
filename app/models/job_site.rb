class JobSite < ApplicationRecord
  belongs_to :lead, optional: true
end
