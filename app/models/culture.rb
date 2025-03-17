class Culture < ApplicationRecord
  belongs_to :reactor
  belongs_to :microorganism
  has_many :culture_logs
end
