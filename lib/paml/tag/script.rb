module Paml
	class Tag
		class Script < Tag
			attr_writer :intro, :outro
			def initialize
				super "", {}
			end
		end
	end
end
