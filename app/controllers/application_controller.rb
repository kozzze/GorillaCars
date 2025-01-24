class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_database_connection_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_database_error

  private

  def handle_database_connection_error
    flash[:alert] = 'Произошла ошибка подключения к базе данных. Попробуйте позже.'
    redirect_to root_path # Или укажите страницу, куда вы хотите перенаправить пользователя
  end

  def handle_database_error
    flash[:alert] = 'Произошла ошибка обработки данных. Попробуйте позже.'
    redirect_to root_path
  end
end
