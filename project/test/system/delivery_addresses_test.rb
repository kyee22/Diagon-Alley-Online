require "application_system_test_case"

class DeliveryAddressesTest < ApplicationSystemTestCase
  setup do
    @delivery_address = delivery_addresses(:one)
  end

  test "visiting the index" do
    visit delivery_addresses_url
    assert_selector "h1", text: "Delivery addresses"
  end

  test "should create delivery address" do
    visit delivery_addresses_url
    click_on "New delivery address"

    fill_in "Address", with: @delivery_address.address
    fill_in "Phone", with: @delivery_address.phone
    fill_in "Postal code", with: @delivery_address.postal_code
    fill_in "User", with: @delivery_address.user_id
    click_on "Create Delivery address"

    assert_text "Delivery address was successfully created"
    click_on "Back"
  end

  test "should update Delivery address" do
    visit delivery_address_url(@delivery_address)
    click_on "Edit this delivery address", match: :first

    fill_in "Address", with: @delivery_address.address
    fill_in "Phone", with: @delivery_address.phone
    fill_in "Postal code", with: @delivery_address.postal_code
    fill_in "User", with: @delivery_address.user_id
    click_on "Update Delivery address"

    assert_text "Delivery address was successfully updated"
    click_on "Back"
  end

  test "should destroy Delivery address" do
    visit delivery_address_url(@delivery_address)
    click_on "Destroy this delivery address", match: :first

    assert_text "Delivery address was successfully destroyed"
  end
end
