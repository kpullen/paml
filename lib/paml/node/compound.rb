module Paml
	class Node
		# I am a node that has a tag AND a content type other than plain.
		# All my children will be adopted by my first child, the node created from my content.
		class Compound < Node
			def initialize options = {}
				super options
				@content = ""
				options[:tag] = ""
				only_child = Node.from_hash options
				@children = [only_child]
			end

			def << child
				@children.first << child
			end
		end
	end
end
