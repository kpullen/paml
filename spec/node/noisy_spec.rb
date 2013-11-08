require "spec_helper"

describe Node::Noisy do
	subject { Node::Noisy.new(content: "$thing").to_s }
	it { should eq "<?php echo $thing; ?>" }
end
