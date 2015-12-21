class AnalyticsPurchasesController < ApplicationController
  before_action :set_analytics_purchase, only: [:show, :edit, :update, :destroy]

  # GET /analytics_purchases
  # GET /analytics_purchases.json
  def index
    @analytics_purchases = AnalyticsPurchase.all
  end

  # GET /analytics_purchases/1
  # GET /analytics_purchases/1.json
  def show
  end

  # GET /analytics_purchases/new
  def new
    @analytics_purchase = AnalyticsPurchase.new
  end

  # GET /analytics_purchases/1/edit
  def edit
  end

  # POST /analytics_purchases
  # POST /analytics_purchases.json
  def create
    @analytics_purchase = AnalyticsPurchase.new(analytics_purchase_params)

    respond_to do |format|
      if @analytics_purchase.save
        format.html { redirect_to @analytics_purchase, notice: 'Analytics purchase was successfully created.' }
        format.json { render :show, status: :created, location: @analytics_purchase }
      else
        format.html { render :new }
        format.json { render json: @analytics_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analytics_purchases/1
  # PATCH/PUT /analytics_purchases/1.json
  def update
    respond_to do |format|
      if @analytics_purchase.update(analytics_purchase_params)
        format.html { redirect_to @analytics_purchase, notice: 'Analytics purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @analytics_purchase }
      else
        format.html { render :edit }
        format.json { render json: @analytics_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analytics_purchases/1
  # DELETE /analytics_purchases/1.json
  def destroy
    @analytics_purchase.destroy
    respond_to do |format|
      format.html { redirect_to analytics_purchases_url, notice: 'Analytics purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytics_purchase
      @analytics_purchase = AnalyticsPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analytics_purchase_params
      params.require(:analytics_purchase).permit(:user_session, :product_id)
    end
end
