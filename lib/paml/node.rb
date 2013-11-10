require "paml/node/root"
require "paml/node/silent"
require "paml/node/noisy"
require "paml/node/lonely"
require "paml/node/compound"

module Paml
	class Node
		class << self
			def from_line line
				ObjectSpace
					.each_object(Class)
					.select {|klass| klass < self }
					.detect(-> {Node}) {|klass| klass.accept? line }
					.new line
			end

			def accept? _
				false
			end
		end

		attr_reader :level, :children

		def initialize line = Line.new
			@children = []
			@level = line.level
			@tag = Tag.new line.tag, line.attributes
			@content = line.content
		end

		def level_up
			@level += 1
		end

		def to_s
			@tag.wrap_around [@content, @children.map(&:to_s)].flatten.join
		end

		def << child
			@children << child
		end
	end
end
