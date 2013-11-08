module Paml
	class Node
		class Plain
			def initialize options = {}
				super initialize options
				@tag = Tag.new name: options[:tag] || "div", attributes: options[:attributes]
				@content = (options[:content] || "").strip
			end
		end
	end
end
