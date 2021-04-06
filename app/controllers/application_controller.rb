class ApplicationController < ActionController::API
	# Prevent CSRF attacks by raising an exception.
	# protect_from_forgery with: :null_session


	private
		def error_response(obj)
			{status: I18n.t('errors.status'), message: obj.errors.full_messages.to_sentence}
		end
end
