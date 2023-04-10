require "application_system_test_case"

class DailyUpdatesTest < ApplicationSystemTestCase
  setup do
    @daily_update = daily_updates(:one)
  end

  test "visiting the index" do
    visit daily_updates_url
    assert_selector "h1", text: "Daily updates"
  end

  test "should create daily update" do
    visit daily_updates_url
    click_on "New daily update"

    click_on "Create Daily update"

    assert_text "Daily update was successfully created"
    click_on "Back"
  end

  test "should update Daily update" do
    visit daily_update_url(@daily_update)
    click_on "Edit this daily update", match: :first

    click_on "Update Daily update"

    assert_text "Daily update was successfully updated"
    click_on "Back"
  end

  test "should destroy Daily update" do
    visit daily_update_url(@daily_update)
    click_on "Destroy this daily update", match: :first

    assert_text "Daily update was successfully destroyed"
  end
end
