# encoding: utf-8

require 'requests/request_helper'

describe "Admin/Roles" do

  context "as admin" do

    before(:each) do
      @user = @user ||= create(:admin)
      sign_in_as @user
    end

    describe "GET /admin/roles" do
      it "works! (now write some real specs)" do
        visit admin_roles_path
        page.should have_content 'Role'
      end
    end
    
  end

end
