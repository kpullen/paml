module Paml
	class Tag
		class Script < Tag
			def initialize intro, outro = nil
				@intro = "<?php #{intro} ?>"
				@outro = "<?php #{outro} ?>" unless outro.nil?
			end
		end
	end
end
