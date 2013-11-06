module Paml
	# I am a Node in the Paml parse tree.
	# I have an indentation level, a tag, some attributes, and maybe some content
	class Node
		attr_reader :level, :tag, :attributes, :content, :postamble, :children
		def initialize options = {}
			@level = (options[:whitespace] || "").scan(/\t/).size

			tag = options[:tag] || "div"
			@tag = "<#{tag}>"
			@postamble = "</#{tag}>"

			@attributes = Hash[
					*(options[:attributes] || "")
					.split(",")
					.map {|kv| kv.split(":").map {|x| x.strip } }
					.flatten]
			@attributes["id"] = options[:id] if options[:id]
			@attributes["class"] = options[:class] if options[:class]

			@content = (options[:content] || "").strip

			@children = []
		end

		def to_s
			[@tag, @content, @postamble].join
		end

		def << child
			@children << child
		end
	end
end
