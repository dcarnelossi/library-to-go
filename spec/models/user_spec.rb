# encoding: utf-8

require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should have_and_belong_to_many(:roles) }
  

  describe "instance method" do
    subject { create(:user) }
    let(:admin) { create(:admin) }
  
    describe "#email" do
      it 'strips whitespace' do
        subject.email = 'test@example.org '
        subject.email.should == 'test@example.org'
      end

      it 'sets errors on invalid formatting' do
        subject.email = 'invalid||||||example.com'
        subject.should have_at_least(1).errors_on(:email)
      end
    end
    
    describe "#first_name" do
      it 'strips whitespace' do
        subject.first_name = 'test '
        subject.first_name.should == 'test'
      end
    end
    
    describe "#last_name" do
      it 'strips whitespace' do
        subject.last_name = 'test '
        subject.last_name.should == 'test'
      end
    end

    describe "#role?" do
      it "detects admins" do
        admin.role?('admin').should be_true
      end
    end

  end

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }

    context "as admin" do
      let(:user) { create(:admin) }

      it{ should be_able_to(:manage, User) }

      it{ should be_able_to(:read, Role) }
      it{ should be_able_to(:create, Role) }
      it{ should be_able_to(:update, Role) }
      it{ should_not be_able_to(:destroy, Role) }
    end

    context "as member" do
      let(:user) { create(:member) }

      it{ should be_able_to(:read, User) }
      it{ should be_able_to(:update, user) }
      it{ should_not be_able_to(:update, User.new) }
      it{ should_not be_able_to(:create, User) }
      it{ should_not be_able_to(:destroy, User.new) }

      it{ should be_able_to(:read, Role) }
      it{ should_not be_able_to(:create, Role) }
      it{ should_not be_able_to(:update, Role) }
      it{ should_not be_able_to(:destroy, Role) }
    end
  end
  
end
