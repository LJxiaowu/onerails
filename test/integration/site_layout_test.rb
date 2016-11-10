require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "lay_out links" do
		get root_path
		assert_template 'static_pages/home'
#		asset_select "a[href=?]",root_path, count: 2
#		asset_select "a[href=?]", help_path
#		asset_select "a[href=?]", about_path
#		asset_select "a[href=?]", contact_path
		get contact_path
#		asset_select "title",full_title("Contact")
	end
end