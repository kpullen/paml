module Paml
	class Node
		class Noisy < Node
			def initialize options = {}
				super options
				@intro = "<?php echo #{options[:content] || ""}; ?>"
				@outro = nil
			end
		end
	end
end
