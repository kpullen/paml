require "spec_helper"

describe Node::Compound do
	subject { Node::Compound.new Line.new(content_type: "-") }
	it("creates a child node") { subject.children.size.should eq 1 }
	it "passes children on" do
		subject << Node.new
		subject.children.size.should eq 1
	end
end
