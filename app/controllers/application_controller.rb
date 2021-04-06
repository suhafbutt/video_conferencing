class ApplicationController < ActionController::API
	# Prevent CSRF attacks by raising an exception.
	# protect_from_forgery with: :null_session


	private
		def error_response(message, status)
			{status: I18n.t('errors.status'), message: message, status: status}
		end
end
