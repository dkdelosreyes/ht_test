class Guest < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :phones, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def create_phones(phone_number)

    if phone_number.is_a? Array
      phone_number.each do |number|
        phones.create phone_number: number
      end

    elsif phone_number.is_a? String
      phones.create phone_number: phone_number
    end
  end
end
