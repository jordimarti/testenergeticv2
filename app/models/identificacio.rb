class Identificacio < ApplicationRecord

	belongs_to :edifici
	has_one_attached :imatge_edifici

end
