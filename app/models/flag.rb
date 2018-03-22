class Flag < ActiveRecord::Base
	has_many :flag_sources
	validates_presence_of :name
end
