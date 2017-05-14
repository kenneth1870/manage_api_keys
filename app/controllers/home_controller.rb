class HomeController < ApplicationController
  require 'digest/md5'
  skip_before_filter :verify_authenticity_token

  def index
    @users = User.all
  end

  def generate_token
    if !params[:email].nil?
      token =  Digest::MD5.hexdigest(params[:email])
      User.create(token: token, email: params[:email])
      redirect_to root_path, notice: 'Token generated'
    else
      redirect_to root_path, notice: 'Fail to token generated'
    end
  end

  def find_duplicates
    @user = User.find_by(token: params[:token])
    lists = params[:data].select{ |e| params[:data].count(e) > 1 }.uniq
    @lists = []
    lists.each do |list, index|
      positions = params[:data].each_index.select { |i| params[:data][i]== "#{list}" }
      @lists << "word: #{list}  #{index} positions: #{positions}"
    end
    if @user
      render json: {code: 200, status: "success", duplicates: @lists}.to_json
      @user.counter += 1
      @user.save!
    else
      render json: {code: 401, status: "unauthorized" }.to_json
    end
  end


end
