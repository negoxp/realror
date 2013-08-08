class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale, :get_menu
def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
end

protect_from_forgery

  def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
   end 

  def get_menu
    @categories = Category.roots
    @products = Product.all.limit(4)
  end


end
