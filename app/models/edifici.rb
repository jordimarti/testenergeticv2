class Edifici < ApplicationRecord

	belongs_to :user
	has_many :entitats
	has_one :identificacio
	has_one :envolupant

end
