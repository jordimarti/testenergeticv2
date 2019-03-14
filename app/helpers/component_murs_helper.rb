module ComponentMursHelper
	
	def resistencia_termica_component(id)
		component = ComponentMur.find(id.to_i)
		#Si s'han omplert els paràmetres gruix i conductivitat calculem la resistència tèrmica del component
		if component.gruix != nil && component.conductivitat != nil
      component.resistencia_termica = component.gruix/component.conductivitat
      component.save
      falten_dades = false
    elsif component.resistencia_termica != nil
    	falten_dades = false
    else
    	falten_dades = true
    end
    return falten_dades
	end

	def transmitancia_total(mur_id, falten_dades)
	  puts "Comprovacions --------------"
	  puts "Mur: " + mur_id.to_s
	  puts "Falten dades: " + falten_dades.to_s
	  if falten_dades == false
		  resistencia_total = 0.0
	    components = ComponentMur.where(mur_id: mur_id)
	    components.each do |component|
	    	puts "Resistencia termica"
	    	puts component.resistencia_termica
	      resistencia_total += component.resistencia_termica
	    end
	    resistencia = 0.04 + resistencia_total + 0.13
	    transmitancia = 1/resistencia
	    return transmitancia
	  else
	  	transmitancia = nil
	  	return transmitancia
	  end
	end

	def reordenar_component(id)
		component = ComponentMur.find(id)
		
		#Ordenem els components per posició i creem array
		components = ComponentMur.where(mur_id: component.mur_id).order(posicio: :asc)
		llistat = []
		components.each do |comp|
			llistat.push(comp.id)
		end
		#Seleccionem el component superior al seleccionat
		nova_posicio = component.posicio - 1
		#Reescrivim la posició segons el nou ordre
		llistat = llistat.insert(nova_posicio, llistat.delete_at(component.posicio))
		valor_final = llistat.length - 1
		posicio = 0
		for i in 0..valor_final
			component = ComponentMur.find(llistat[i])
			component.posicio = posicio
			component.save
			posicio += 1
		end
	end

	def zona_climatica_cte(edifici_id)
		dades_edifici = Identificacio.where(edifici_id: edifici_id).last
		if dades_edifici.provincia == 'Barcelona'
			if dades_edifici.altitud_municipi < 250
				zona_climatica = 'c2'
			elsif dades_edifici.altitud_municipi >249 && dades_edifici.altitud_municipi < 450
				zona_climatica = 'd2'
			elsif dades_edifici.altitud_municipi > 449 && dades_edifici.altitud_municipi < 750
				zona_climatica = 'd1'
			elsif dades_edifici.altitud_municipi > 749
				zona_climatica = 'e1'
			end
		elsif dades_edifici.provincia == 'Girona'

		end
		return zona_climatica
	end

	def transmitancia_limit_murs_cte(zona_climatica)
		zona_climatica_hivern = zona_climatica.chars.first
		case zona_climatica_hivern
		when 'c'
			valor_limit = 0.75
		when 'd'
			valor_limit = 0.60
		when 'e'
			valor_limit = 0.55
		end
		return valor_limit
	end

	def dibuixa_mur(mur_id)
		@components_grafics = ComponentMur.where(mur_id: mur_id).order(posicio: :asc)
	end

end
