class CaesarsController < ApplicationController
  before_action :set_caesar, only: [:show, :edit, :update, :destroy]

  # GET /caesars
  # GET /caesars.json
  def index
    @caesars = Caesar.all
  end

  # GET /caesars/1
  # GET /caesars/1.json
  def show
    @caesar = Caesar.find(params[:id])
  end

  # GET /caesars/new
  def new
    @caesar = Caesar.new
  end

  # GET /caesars/1/edit
  def edit
  end

  # POST /caesars
  # POST /caesars.json
  def create
    @caesar = Caesar.new(caesar_params)
    @caesar.cipher(params[:caesars][:message], params[:caesars][:key])
      
    if @caesar.save
      redirect_to @caesar
    else
      render :new
    end
  end

  # PATCH/PUT /caesars/1
  # PATCH/PUT /caesars/1.json
  def update
    respond_to do |format|
      if @caesar.update(caesar_params)
        format.html { redirect_to @caesar, notice: 'Caesar was successfully updated.' }
        format.json { render :show, status: :ok, location: @caesar }
      else
        format.html { render :edit }
        format.json { render json: @caesar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caesars/1
  # DELETE /caesars/1.json
  def destroy
    @caesar.destroy
    respond_to do |format|
      format.html { redirect_to caesars_url, notice: 'Caesar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caesar
      @caesar = Caesar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caesar_params
      params.fetch(:caesar, {})
    end
end
