require "spec_helper"

describe Node::Lonely do
	subject { Node::Lonely.new }
	it "cannot have children" do
		expect { Node::Lonely.new << Node.new }.to raise_error
	end
end
