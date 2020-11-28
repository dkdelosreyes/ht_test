class Reservation < ApplicationRecord

  belongs_to :guest

  validates_presence_of :start_date, :end_date, :total_price, :currency, :guests_count

  class << self

    def service_a
      where(source: 'Service A')
    end

    def service_b
      where(source: 'Service B')
    end
  end
end
