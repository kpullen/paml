require "spec_helper"

describe Node::Silent do
	let(:_other) { Node::Silent.new content: "method()" }
	let(:_if) { Node::Silent.new content: "if(true)" }
	let(:_else_if) { Node::Silent.new content: "else if(true)" }
	let(:_else) { Node::Silent.new content: "else" }
	let(:_foreach) { Node::Silent.new content: "foreach($things as $thing)" }
	let(:_while) { Node::Silent.new content: "while(true)" }

	it "handles non control flow stuff" do
		expect(_other.to_s).to eq "<?php method(); ?>"
	end

	it "handles ifs" do
		expect(_if.to_s).to eq "<?php if(true): ?><?php endif; ?>"
	end

	it "handles else ifs" do
		expect(_else_if.to_s).to eq "<?php else if(true): ?>"
	end

	it "handles elses" do
		expect(_else.to_s).to eq "<?php else: ?>"
	end

	it "handles foreaches" do
		expect(_foreach.to_s).to eq "<?php foreach($things as $thing): ?><?php endforeach; ?>"
	end

	it "handles whiles" do
		expect(_while.to_s).to eq "<?php while(true): ?><?php endwhile; ?>"
	end
end
