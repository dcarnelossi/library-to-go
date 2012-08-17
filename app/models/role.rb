# encoding: utf-8

class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  attr_accessible :name, :as => :root

  validates :name, :uniqueness => true
  validates :name , :presence => true

  def name=(str)
    # remove whitespace
    write_attribute(:name, str.strip) if str.present?
  end

end
