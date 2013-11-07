module Paml
	class Node
		# I am a node that can have no children.
		# I am bitter about it, so I'll raise an error if you try to give me children.
		class Lonely < Node
			def << _
				raise "Nope"
			end
		end
	end
end
