module Paml
	class Node
		class Compound < Node
			def self.accept? line
				!line.tag.empty? &&
				line.content_type != :plain
			end

			def initialize line
				line.content = ""
				super line
				line.tag = ""
				@children = [Node.from_line(line)]
			end

			def << child
				@children.first << child
			end
		end
	end
end
