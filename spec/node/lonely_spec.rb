require "spec_helper"

describe Node::Lonely do
	subject { Node::Lonely.new }
	it("has no children") { expect { subject << Node.new }.to raise_error }
end
