module Paml
	class Tag
		def initialize options = {}
			name = options[:name]
			attributes = options[:attributes] || {}
			spacer = " " unless attributes.empty?
			formatted_attributes = attributes
					.map {|k, v| "#{k}='#{v}'"}
					.join(" ")
					.strip

			@intro = "<#{name}#{spacer}#{formatted_attributes}>"
			@outro = "</#{name}>"
		end

		def wrap_around content
			[@intro, content, @outro].join ""
		end
	end
end

