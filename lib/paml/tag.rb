require "paml/tag/script"

module Paml
	class Tag
		def initialize name = "div", attributes = {}
			attribute_string = (attributes || {})
					.map {|k, v| "#{k}='#{v}'"}
					.join(" ")
					.strip
			@intro = "<#{[name, attribute_string].join(" ").strip}>"
			@outro = "</#{name}>"
		end

		def wrap_around content
			[@intro, content, @outro].join
		end
	end
end
