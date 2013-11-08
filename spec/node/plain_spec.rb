require "spec_helper"

describe Node::Plain do
	context "when using defaults" do
		it("is a div") { expect(Node.new.to_s).to eq "<div></div>" }
		it("starts at level 0") { expect(Node.new.level).to eq 0 }
		it("has no children") { expect(Node.new.children).to eq [] }
	end
end
