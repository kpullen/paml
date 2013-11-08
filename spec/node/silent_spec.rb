require "spec_helper"

describe Silent do
	let(:_other) { Silent.new content: "method()" }
	let(:_if) { Silent.new content: "if(true)" }
	let(:_else_if) { Silent.new content: "else if(true)" }
	let(:_else) { Silent.new content: "else" }
	let(:_foreach) { Silent.new content: "foreach($things as $thing)" }
	let(:_while) { Silent.new content: "while(true)" }

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
