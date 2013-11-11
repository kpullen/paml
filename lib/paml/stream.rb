module Paml
	class Stream
		class StreamIsEmpty < Exception; end

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
		 	safely { @nodes.shift }
		end

		def level
			safely { @nodes.first.level }
		end

		private
		def safely &block
			raise StreamIsEmpty if @nodes.empty?
			yield
		end
	end
end
