module Paml
	class Node
		class Root < Node
			def initialize options = {}
				super options
				@intro = nil
				@content = nil
				@outro = nil
			end
			def to_s
				@children.map(&:to_s).join
			end
		end
	end
end
