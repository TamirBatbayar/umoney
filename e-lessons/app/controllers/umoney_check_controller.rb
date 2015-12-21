class UmoneyCheckController < ApplicationController
before_action :authenticate_user!
require 'uri'
require 'net/http'
require 'json'

  def index
	uri = URI('http://localhost:9292/api')
	secret_key = "2262dc4e093e5ec380b83504d8661c53" # Erdnee ene secret_key-iig http://localhost:9292/partners?locale=en dotoroos hussen unique_id-aa songood

	response = Net::HTTP.post_form(uri, 'secret_key' => secret_key, 'unique_id' => params[:unique_id], 'money' => params[:money])

	status = response.code.to_i
	response_message = JSON.parse response.body
	transaction_message = response_message["msg"]

	if status == 200
		user = User.find(current_user.id)
		user.approved = 1
		user.save
		flash[:notice] = transaction_message
	else
		flash[:notice] = "Error: "+transaction_message
	end
		redirect_to subscribe_path
  end
end
