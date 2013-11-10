module Paml
	class Stream
		def initialize data
			data = data.split "\n" if data.is_a? String
			@lines = data.map do |raw_line|
				match = PATTERN.match raw_line
				data = Hash[
					match
					.names
					.map(&:to_sym)
					.zip(match.captures)
				].reject { |_, v| v.nil? }
				Node.from_line Line.new data
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
