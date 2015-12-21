class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_i18n_locale_from_params
  # protect_from_forgery with: :exception
  
	def set_i18n_locale_from_params
		# I18n.locale = :mn
		if params[:locale]
			if I18n.available_locales.include?(params[:locale].to_sym)
				I18n.locale = params[:locale]
			else
				flash.now[:notice] = "#{params[:locale]} translation not available"
				I18n.locale = "en"
				logger.error flash.now[:notice]
			end
		else
			I18n.locale = "en"
		end
	end

	def default_url_options
		{ :locale => I18n.locale }
	end
end
