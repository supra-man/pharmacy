require "application_system_test_case"

class PrescriptionsTest < ApplicationSystemTestCase
  setup do
    @prescription = prescriptions(:one)
  end

  test "visiting the index" do
    visit prescriptions_url
    assert_selector "h1", text: "Prescriptions"
  end

  test "should create prescription" do
    visit prescriptions_url
    click_on "New prescription"

    fill_in "Customer", with: @prescription.customer_id
    fill_in "Medicine name", with: @prescription.medicine_name
    fill_in "Next delivery date", with: @prescription.next_delivery_date
    fill_in "Notes", with: @prescription.notes
    click_on "Create Prescription"

    assert_text "Prescription was successfully created"
    click_on "Back"
  end

  test "should update Prescription" do
    visit prescription_url(@prescription)
    click_on "Edit this prescription", match: :first

    fill_in "Customer", with: @prescription.customer_id
    fill_in "Medicine name", with: @prescription.medicine_name
    fill_in "Next delivery date", with: @prescription.next_delivery_date
    fill_in "Notes", with: @prescription.notes
    click_on "Update Prescription"

    assert_text "Prescription was successfully updated"
    click_on "Back"
  end

  test "should destroy Prescription" do
    visit prescription_url(@prescription)
    accept_confirm { click_on "Destroy this prescription", match: :first }

    assert_text "Prescription was successfully destroyed"
  end
end
