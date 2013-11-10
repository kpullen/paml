module Paml
	class Node
		class Noisy < Node
			def initialize line = Line.new
				super line
				@tag = Tag::Script.new "echo #{line.content};"
				@content = nil
			end
		end
	end
end
