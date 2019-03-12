class ComponentMursController < ApplicationController
  before_action :set_component_mur, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def new
    @component_mur = ComponentMur.new
  end

  def edit
  end

  def create
    @component_mur = ComponentMur.create(component_mur_params)
    @mur = Mur.find(@component_mur.mur_id)
    @component_murs = ComponentMur.where(mur_id: @mur.id)
  end

  def update
    @component_mur.update(component_mur_params)
    @mur = Mur.find(@component_mur.mur_id)
    @component_murs = ComponentMur.where(mur_id: @mur.id)

    resistencia_total = 0.0
    @component_murs.each do |component|
      if component.gruix != nil && component.conductivitat != nil
        resistencia_parcial = component.gruix/component.conductivitat
      else
        resistencia_parcial = 100
      end
      resistencia_total += resistencia_parcial
    end
    @transmitancia = 0.04 + resistencia_total + 0.13
  end

  def destroy
    @mur = Mur.find(params[:mur_id])
    @component_murs = ComponentMur.where(mur_id: @mur.id)
    @component_mur.destroy
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
