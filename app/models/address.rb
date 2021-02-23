class Address < ApplicationRecord
  belongs_to :customer

  def address_option
    postal_code + address + name
  end
end
