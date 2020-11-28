class Phone < ApplicationRecord

  belongs_to :guest

  validates :phone_number, presence: true, uniqueness: true
end
