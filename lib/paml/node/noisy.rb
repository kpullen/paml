module Paml
	class Node
		# I pretend that any content passed to me is PHP, and I echo it.
		class Noisy < Lonely
			def initialize options = {}
				super options
				@tag = Tag::Script.new
				@tag.intro = "<?php echo #{options[:content] || ""}; ?>"
				@tag.outro = ""
				@content = nil
			end
		end
	end
end
