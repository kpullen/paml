module Paml
	class Node
		class Root < Node
			def initialize options = {}
				super options
				@intro = nil
				@content = nil
				@outro = nil
			end
		end
	end
end
