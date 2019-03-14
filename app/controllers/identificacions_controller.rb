class IdentificacionsController < ApplicationController
  before_action :set_identificacio, only: [:edit, :update]
  before_action :set_edifici

  def edit
    @subnavigation = true
    @submenu_actiu = 'identificacio'
    #check_user_edifici(@edifici.id)
  end

  # POST /identificacions
  # POST /identificacions.json
  def create
    @identificacio = Identificacio.new(identificacio_params)

    respond_to do |format|
      if @identificacio.save
        format.html { redirect_to @identificacio, notice: 'Identificacio was successfully created.' }
        format.json { render :show, status: :created, location: @identificacio }
      else
        format.html { render :new }
        format.json { render json: @identificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identificacions/1
  # PATCH/PUT /identificacions/1.json
  def update
    respond_to do |format|
      if @identificacio.update(identificacio_params)
        format.html { redirect_to edit_identificacio_path(@identificacio.edifici_id), notice: 'Identificacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @identificacio }
      else
        format.html { render :edit }
        format.json { render json: @identificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identificacions/1
  # DELETE /identificacions/1.json
  def destroy
    @identificacio.destroy
    respond_to do |format|
      format.html { redirect_to identificacions_url, notice: 'Identificacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identificacio
      @identificacio = Identificacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(@identificacio.edifici_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identificacio_params
      params.require(:identificacio).permit(:edifici_id, :tipus_via, :nom_via, :numero_via, :bloc, :codi_postal, :poblacio, :provincia, :any_construccio, :superficie_util, :nom_propietari, :cognoms_propietari, :tipus_document_identitat_propietari, :numero_document_identitat_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :municipi_propietari, :imatge_edifici, :altitud_municipi)
    end
end
