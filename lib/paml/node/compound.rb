module Paml
	class Node
		class Compound < Node
			def initialize options = {}
				super options
				@content = ""
				options.delete :tag
				@children = [Node.from_hash(options)]
			end

			def << child
				@children.first << child
			end
		end
	end
end
