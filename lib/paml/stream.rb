module Paml
	class Stream
		def initialize data
			data = data.split "\n" if data.is_a? String
			@lines = data.map do |line|
				Node.new HAML_PATTERN.match line
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
