class Comment < ApplicationRecord
  belongs_to :lead, optional: true
end
