class MursController < ApplicationController
  before_action :set_mur, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  # GET /murs
  # GET /murs.json
  def index
    @murs = Mur.all
  end

  # GET /murs/1
  # GET /murs/1.json
  def show
  end

  # GET /murs/new
  def new
    @mur = Mur.new
  end

  def nou
    @mur = Mur.new
    @mur.edifici_id = params[:edifici_id]
    @mur.entitat_id = params[:entitat_id]
    @mur.ambit = params[:ambit]
    #envolupant = Envolupant.where(edifici_id: params[:edifici_id]).last
    @mur.save
    redirect_to edit_mur_path(id: @mur.id, edifici_id: @mur.edifici_id, entitat_id: @mur.entitat_id)
  end

  # GET /murs/1/edit
  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  # POST /murs
  # POST /murs.json
  def create
    @mur = Mur.new(mur_params)

    respond_to do |format|
      if @mur.save
        envolupant = Envolupant.where(edifici_id: @mur.edifici_id).last
        format.html { redirect_to edit_envolupant_path(id: envolupant.id, edifici_id: @mur.edifici_id) }
        format.json { render :show, status: :created, location: @mur }
      else
        format.html { render :new }
        format.json { render json: @mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /murs/1
  # PATCH/PUT /murs/1.json
  def update
    respond_to do |format|
      if @mur.update(mur_params)
        envolupant = Envolupant.where(edifici_id: @mur.edifici_id).last
        format.html { redirect_to edit_envolupant_path(id: envolupant.id, edifici_id: @mur.edifici_id) }
        format.json { render :show, status: :ok, location: @mur }
      else
        format.html { render :edit }
        format.json { render json: @mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /murs/1
  # DELETE /murs/1.json
  def destroy
    @mur.destroy
    respond_to do |format|
      format.html { redirect_to murs_url, notice: 'Mur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mur
      @mur = Mur.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mur_params
      params.require(:mur).permit(:edifici_id, :entitat_id, :ambit, :nom, :descripcio, :superficie, :tipus_mur, :percentatge)
    end
end
