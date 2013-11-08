module Paml
	class Silent < Node
		def initialize options = {}
			super options
			terminator = ?;
			@outro = ""
			@content.scan /^(if|foreach|while)/ do |match|
				@outro = "<?php end#{match.first}; ?>"
				terminator = ?:
			end
			terminator = ?: if /^(else(?:\s+if)?)/.match @content
			@intro = "<?php #{@content}#{terminator} ?>"
			@content = nil
		end
	end
end
