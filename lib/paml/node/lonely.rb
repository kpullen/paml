module Paml
	class Node
		class Lonely < Node
			def << _
				raise "Nope"
			end
		end
	end
end
