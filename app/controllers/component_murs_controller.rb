class ComponentMursController < ApplicationController
  include ComponentMursHelper
  before_action :set_component_mur, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def new
    @component_mur = ComponentMur.new
  end

  def edit
  end

  def create
    components_previs = ComponentMur.where(mur_id: component_mur_params[:mur_id]).order(posicio: :asc)
    ultim_component = components_previs.last
    @component_mur = ComponentMur.create(component_mur_params)
    components = ComponentMur.where(mur_id: @component_mur.mur_id).order(posicio: :asc)
    if components.count > 1
      posicio_ultim_component = ultim_component.posicio
      @component_mur.posicio = posicio_ultim_component + 1
    else
      @component_mur.posicio = 0
    end
    @component_mur.save
    resultat_calcul = resistencia_termica_component(@component_mur.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_mur.nom}
    @mur = Mur.find(@component_mur.mur_id)
    @transmitancia = transmitancia_total(@mur.id, resultat_calcul)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@mur.edifici_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
    dibuixa_mur(@mur.id)
  end

  def update
    @component_mur.update(component_mur_params)
    resultat_calcul = resistencia_termica_component(@component_mur.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_mur.nom}
    @mur = Mur.find(@component_mur.mur_id)
    @transmitancia = transmitancia_total(@mur.id, resultat_calcul)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@mur.edifici_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
    dibuixa_mur(@mur.id)
  end

  def destroy
    @mur = Mur.find(params[:mur_id])
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @component_mur.destroy
    @transmitancia = transmitancia_total(@mur.id, false)
    @zona = zona_climatica_cte(@mur.edifici_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
    dibuixa_mur(@mur.id)
  end

  def canviar_posicio
    reordenar_component(params[:component_id])
    @component_mur = ComponentMur.find(params[:component_id])
    @mur = Mur.find(@component_mur.mur_id)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_mur
      @component_mur = ComponentMur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_mur_params
      params.require(:component_mur).permit(:mur_id, :nom, :conductivitat, :gruix, :resistencia_termica, :posicio, :color)
    end
end
