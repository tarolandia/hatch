require 'test/unit'

class Address
  include Val
  @@attributes = [:city, :street, :number]
  attr_reader *@@attributes
end

class PolymorphismTest < Test::Unit::TestCase
  def test_polymorphism
    address = Address.create(street: "Fake St", number: 1234, city: "Buenos Aires")
    assert address.is_a?(Address)
    assert_equal address.street, "Fake St"
    assert_equal address.number, 1234
    assert_equal address.city,   "Buenos Aires"

    address = Address.create(street: "Fake St", number: -1, city: "Buenos Aires")
    assert address.is_a?(Address::InvalidAddress)
    assert_equal address.street, "Fake St"
    assert_equal address.number, -1
    assert_equal address.city,   "Buenos Aires"
  end
end
