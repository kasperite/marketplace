class Promotion < ApplicationRecord
  scope :active, -> { where("end_date IS NULL or end_date > ?", DateTime.now) }
end
