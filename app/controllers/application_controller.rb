# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_role(role = nil)
    return true if current_user.present? && current_user.role?(role)
    render text: '401', status: 401
  end

end
