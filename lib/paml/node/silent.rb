module Paml
	class Node
		class Silent < Node
			def initialize options = {}
				super options
				terminator = ?;
				outro = nil
				@content.scan /^(if|foreach|while)/ do |match|
					outro = "end#{match.first};"
					terminator = ?:
				end
				terminator = ?: if /^(else(?:\s+if)?)/.match @content
				@tag = Tag::Script.new "#{@content}#{terminator}", outro
				@content = nil
			end
		end
	end
end
