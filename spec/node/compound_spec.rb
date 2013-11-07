require "spec_helper"
include Paml

describe Node::Compound do
	subject { Node::Compound.new ctype: "-" }
	it("creates a child node") { subject.children.size.should eq 1 }
	it("passes children on") { subject << Node.new; subject.children.size.should eq 1 }
end
