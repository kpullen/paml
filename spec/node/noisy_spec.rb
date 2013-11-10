require "spec_helper"

describe Node::Noisy do
	subject { Node::Noisy.new(Line.new(content: "$thing")).to_s }
	it("echos the content") { should eq "<?php echo $thing; ?>" }
end
