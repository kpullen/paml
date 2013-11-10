module Paml
	class Node
		class Noisy < Node
			def initialize options = {}
				super options
				@tag = Tag::Script.new "echo #{options[:content] || ""};"
				@content = nil
			end
		end
	end
end
