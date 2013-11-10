module Paml
	class Node
		class Root < Node
			def initialize
				@children = []
			end
			def to_s
				@children.map(&:to_s).join
			end
		end
	end
end
