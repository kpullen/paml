require "spec_helper"

describe Node::Root do
	let(:pristine) { Node::Root.new.to_s }
	let :with_child do
		node = Node::Root.new
		node << Node.new
		node.to_s
	end

	it "has no tag" do
		expect(pristine).to eq ""
	end
	
	it "may have children" do
		expect(with_child).to eq "<div></div>"
	end
end
