require "paml/version"
require "paml/stream"
require "paml/node"
require "paml/tag"

module Paml
	class Generator
		def initialize data
			generate!(Stream.new(data), Node::Root.new).to_s
		end

		def generate! stream, tree
			node = stream.next
			tree << node
			if stream.level > tree.level
				generate! stream, node 
			elsif stream.level == tree.level
				generate! stream, tree
			end
			tree
		end
	end
end
