class Reactor < ApplicationRecord
  has_many :cultures
  has_many :culture_logs, dependent: :destroy
end
