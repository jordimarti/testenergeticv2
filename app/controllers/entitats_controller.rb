class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  def index
    @subnavigation = true
    @submenu_actiu = 'ambits'
    @entitats = Entitat.where(edifici_id: params[:edifici_id])
  end

  # GET /entitats/1
  # GET /entitats/1.json
  def show
  end

  # GET /entitats/new
  def new
    @subnavigation = true
    @submenu_actiu = 'ambits'
    @entitat = Entitat.new
  end

  # GET /entitats/1/edit
  def edit
    @subnavigation = true
    @submenu_actiu = 'identificacio'
  end

  # POST /entitats
  # POST /entitats.json
  def create
    @entitat = Entitat.new(entitat_params)

    respond_to do |format|
      if @entitat.save
        format.html { redirect_to edifici_entitats_path, notice: 'Entitat was successfully created.' }
        format.json { render :show, status: :created, location: @entitat }
      else
        format.html { render :new }
        format.json { render json: @entitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entitats/1
  # PATCH/PUT /entitats/1.json
  def update
    respond_to do |format|
      if @entitat.update(entitat_params)
        format.html { redirect_to edifici_entitats_path, notice: 'Entitat was successfully updated.' }
        format.json { render :show, status: :ok, location: @entitat }
      else
        format.html { render :edit }
        format.json { render json: @entitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entitats/1
  # DELETE /entitats/1.json
  def destroy
    @entitat.destroy
    respond_to do |format|
      format.html { redirect_to edifici_entitats_url, notice: 'Entitat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entitat
      @entitat = Entitat.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entitat_params
      params.require(:entitat).permit(:edifici_id, :nom, :descripcio, :superficie, :destinacio, :quota, :nom_propietari, :cognoms_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :municipi_propietari)
    end
end
