class ComponentMursController < ApplicationController
  before_action :set_component_mur, only: [:show, :edit, :update, :destroy]

  # GET /component_murs
  # GET /component_murs.json
  def index
    @component_murs = ComponentMur.all
  end

  # GET /component_murs/1
  # GET /component_murs/1.json
  def show
  end

  # GET /component_murs/new
  def new
    @component_mur = ComponentMur.new
  end

  # GET /component_murs/1/edit
  def edit
  end

  # POST /component_murs
  # POST /component_murs.json
  def create
    @component_mur = ComponentMur.new(component_mur_params)

    respond_to do |format|
      if @component_mur.save
        format.html { redirect_to @component_mur, notice: 'Component mur was successfully created.' }
        format.json { render :show, status: :created, location: @component_mur }
      else
        format.html { render :new }
        format.json { render json: @component_mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_murs/1
  # PATCH/PUT /component_murs/1.json
  def update
    respond_to do |format|
      if @component_mur.update(component_mur_params)
        format.html { redirect_to @component_mur, notice: 'Component mur was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_mur }
      else
        format.html { render :edit }
        format.json { render json: @component_mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_murs/1
  # DELETE /component_murs/1.json
  def destroy
    @component_mur.destroy
    respond_to do |format|
      format.html { redirect_to component_murs_url, notice: 'Component mur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_mur
      @component_mur = ComponentMur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_mur_params
      params.require(:component_mur).permit(:mur_id, :nom, :conductivitat, :gruix, :resistencia_termica)
    end
end
