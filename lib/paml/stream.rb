module Paml
	class Stream
		def initialize data
			data = data.split "\n" if data.is_a? String
			@nodes = data.map do |raw_line|
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
			raise if @nodes.empty?
			@nodes.shift
		end

		def level
			raise if @nodes.empty?
			@nodes.first.level
		end
	end
end
