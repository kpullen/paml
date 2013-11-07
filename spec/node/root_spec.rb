require "spec_helper"
include Paml

describe Node::Root do
	let(:pristine) { Node::Root.new }
	let :with_child do
		node = Node::Root.new
		node << Node.new
		node
	end
	
	it("prints its children") { with_child.to_s.should eq "<div></div>" }
end
