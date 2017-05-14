class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :count_request

  def count_request
    users = User.all
    puts "Correo            Api Key      Num de Requests"
    puts "=============================================="
    users.each                         do         |user|
      puts "#{user.email}   #{user.token}   #{user.counter} "
    end
  end
end
