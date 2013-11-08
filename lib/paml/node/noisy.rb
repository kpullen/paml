module Paml
	class Node
		# I pretend that any content passed to me is PHP, and I echo it.
		class Noisy < Lonely
			def initialize options = {}
				super options
				@intro = "<?php echo #{options[:content] || ""}; ?>"
				@outro = nil
				@content = nil
			end
		end
	end
end
