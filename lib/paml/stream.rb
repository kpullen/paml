module Paml
	class Stream
		def initialize data
			regex = /
				# In HAML, the whitespace between the beginning of a line and an
				# element definition determines the element's depth.
				^(?<whitespace>\s*)
				(?:%(?<tag>\w+))?
				(?:\#(?<id>\w+))?
				# The class of the element
				(?:\.(?<class>\w+))?
				# The element attributes
				(?:\{(?<attributes>.*?)\})?
				# The type of content
				(?<ctype>-|=)?
				# The content
				(?<content>.*?)$
			/x
			data = data.split "\n" if data.is_a? String
			@lines = data.map do |line|
				Node.new regex.match line
			end
		end

		def next
			@lines.shift
		end

		def level
			@lines[0].level
		end
	end
end
