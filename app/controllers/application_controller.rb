class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :ensure_user_not_mobile, except: :mobile

  def mobile
    render text: 'You cannot view the requested page from a mobile device.'
  end

  def ensure_user_not_mobile
    if request.user_agent =~ /mobile/
      redirect_to controller: 'application', action: 'mobile'
    end
  end

  def nope
    render text: 'You cannot delete stuff.'
  end

end
