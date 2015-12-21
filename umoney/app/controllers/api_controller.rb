class ApiController < ApplicationController
# before_action :ensure_json_request 
respond_to :json
  def index
	if params[:unique_id] && params[:money] && params[:secret_key]
		response_msg = check_partner(params[:secret_key])
		if response_msg
			response_msg = check_card(params[:unique_id], params[:money])
		else
			response_msg = {:status => 400, :msg => "Bad request!"}
		end
	else
		response_msg = {:status => 400, :msg => "Bad request!"}
	end
 	render json: response_msg	
  end

private

	# def ensure_json_request  
	#   return if request.format == :json
	#   render :nothing => true, :status => 406  
	# end 

	def check_partner(secret_key)
		partner_key = Partner.find_by(secret_key: secret_key)
	rescue
		response_msg = nil
	end

	def check_card(unique_id, money)
		begin 
			card = Card.find_by(unique_id: params[:unique_id])
			if card.money.to_i >= money.to_i
				card.money = card.money.to_i - money.to_i
				card.save
				response_msg = {:status => 200, :msg => "Success!"}
			else
				response_msg = {:status => 400, :msg => "Not enough money in card!"}
			end
		rescue
			response_msg = {:status => 400, :msg => "Wrong card!"}
		end
		return response_msg
	end
end
