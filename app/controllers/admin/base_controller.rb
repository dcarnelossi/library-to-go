# encoding: utf-8

class Admin::BaseController < ApplicationController

  before_filter lambda { require_role('admin') }
  
end
