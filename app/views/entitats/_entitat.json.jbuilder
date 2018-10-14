json.extract! entitat, :id, :edifici_id, :nom, :descripcio, :superficie, :destinacio, :quota, :nom_propietari, :cognoms_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :municipi_propietari, :created_at, :updated_at
json.url entitat_url(entitat, format: :json)
