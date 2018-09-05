require 'rqrcode'

class QrgeneratorsController < ApplicationController
  before_action :set_qrgenerator, only: [:show, :edit, :update, :destroy]
  # GET /qrgenerators
  # GET /qrgenerators.json
  def index
    @qrgenerators = Qrgenerator.all
  end

  def set_otp(otp_secret)
    rotp_service = RotpService.new()
    rotp_service.generate_otp(otp_secret)
  end

  # GET /qrgenerators/1
  # GET /qrgenerators/1.json
  def show
    rotp_service = RotpService.new()
    # secret = @Qrgenerator.otp_secret
    email_or_mobile = "pravin@example.com"
    @qr_details = rotp_service.get_qr_code_details(email_or_mobile)
    @qr = RQRCode::QRCode.new( @qr_details[:qr], :size => 10, :level => :m )
  end

  # GET /qrgenerators/new
  def new
    @qrgenerator = Qrgenerator.new
  end

  # GET /qrgenerators/1/edit
  def edit
  end

  # POST /qrgenerators
  # POST /qrgenerators.json
  def create
    @qrgenerator = Qrgenerator.new(qrgenerator_params)
    respond_to do |format|
      if @qrgenerator.save
        format.html { redirect_to @qrgenerator, notice: 'Qrgenerator was successfully created.' }
        format.json { render :show, status: :created, location: @qrgenerator }
      else
        format.html { render :new }
        format.json { render json: @qrgenerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrgenerators/1
  # PATCH/PUT /qrgenerators/1.json
  def update
    respond_to do |format|
      if @qrgenerator.update(qrgenerator_params)
        format.html { redirect_to @qrgenerator, notice: 'Qrgenerator was successfully updated.' }
        format.json { render :show, status: :ok, location: @qrgenerator }
      else
        format.html { render :edit }
        format.json { render json: @qrgenerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrgenerators/1
  # DELETE /qrgenerators/1.json
  def destroy
    @qrgenerator.destroy
    respond_to do |format|
      format.html { redirect_to qrgenerators_url, notice: 'Qrgenerator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrgenerator
      @qrgenerator = Qrgenerator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qrgenerator_params
      params.fetch(:qrgenerator, {})
    end
end
