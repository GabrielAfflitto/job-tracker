require 'rails_helper'

describe "user can create a new category" do
  it "is presented with a new category form" do
    visit new_category_path

    expect(current_path).to eq(new_category_path)
      fill_in "category[title]", with: "Music"
      click_button "Create"

      expect(current_path).to eq(category_path(Category.last.id))
      expect(page).to have_content("Music")
  end

  it "it redirected to the user to the category form page if the category exists" do
    category = Category.create!(title: "Music")
    visit new_category_path
    
    expect(current_path).to eq(new_category_path)
    fill_in "category[title]", with: "Music"
    click_button "Create"
    # save_and_open_page

    expect(page).to have_content("Create a New Category Here!")
  end
end
