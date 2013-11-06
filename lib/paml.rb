require "paml/version"

require "paml/node"
require "paml/node/silent"
require "paml/node/noisy"

module Paml
	class Stream
		def initialize data
			regex = /^(?<whitespace>\s*)(?:%(?<tag>\w+))?(?:#(?<id>\w+))?(?:\.(?<class>\w+))?(?:\{(?<attributes>.*?)\})?(?<ctype>-|=)?(?<content>.*?)$/
			data = data.split "\n" if data.is_a? String
			@lines = data.map do |line|
				Node.new regex.match line
			end
		end

		def next
			@lines.shift
		end

		def level
			@lines[0].level
		end
	end

	class Paml
		def initialize data
			generate!(Stream.new(data), Node.new).to_s
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
