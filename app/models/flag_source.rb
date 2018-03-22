class FlagSource < ActiveRecord::Base
	belongs_to :flags
	belongs_to :source, polymorphic: true
end
