require 'spec_helper'

describe "volunteer_ops/new" do
  let (:organization) { double :organization, id: 3 } 
  let (:user) { double :user, organization: organization } 
  before(:each) do
    assign(:volunteer_op, stub_model(VolunteerOp,
      :title => "MyString",
      :description => "MyText",
      :organization => nil
    ).as_new_record)
    view.stub current_user: user
  end

  it "renders new volunteer_op form" do
    render

    rendered.should have_selector("form", :action => volunteer_ops_path, :method => "post") do |form|
      form.should have_selector("input#volunteer_op_title", :name => "volunteer_op[title]")
      form.should have_selector("textarea#volunteer_op_description", :name => "volunteer_op[description]")
    end
  end
  it "should have a Create Volunteer Opportunity button" do
    render
    debugger
    rendered.should have_link "Create Volunteer Opportunity", :method => :post, :href => volunteer_ops_path(current_user.organization)
  end
end
