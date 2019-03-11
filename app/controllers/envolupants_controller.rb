class EnvolupantsController < ApplicationController
  before_action :set_envolupant, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  # GET /envolupants
  # GET /envolupants.json
  def index
    @envolupants = Envolupant.all
  end

  # GET /envolupants/1
  # GET /envolupants/1.json
  def show
  end

  # GET /envolupants/new
  def new
    @envolupant = Envolupant.new
  end

  # GET /envolupants/1/edit
  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @murs = Mur.where(edifici_id: params[:edifici_id])
  end

  # POST /envolupants
  # POST /envolupants.json
  def create
    @envolupant = Envolupant.new(envolupant_params)

    respond_to do |format|
      if @envolupant.save
        format.html { redirect_to @envolupant, notice: 'Envolupant was successfully created.' }
        format.json { render :show, status: :created, location: @envolupant }
      else
        format.html { render :new }
        format.json { render json: @envolupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envolupants/1
  # PATCH/PUT /envolupants/1.json
  def update
    respond_to do |format|
      if @envolupant.update(envolupant_params)
        format.html { redirect_to @envolupant, notice: 'Envolupant was successfully updated.' }
        format.json { render :show, status: :ok, location: @envolupant }
      else
        format.html { render :edit }
        format.json { render json: @envolupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envolupants/1
  # DELETE /envolupants/1.json
  def destroy
    @envolupant.destroy
    respond_to do |format|
      format.html { redirect_to envolupants_url, notice: 'Envolupant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envolupant
      @envolupant = Envolupant.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def envolupant_params
      params.require(:envolupant).permit(:edifici_id, :entitat_id, :ambit, :nom, :descripcio, :superficie, :percentatge)
    end
end
