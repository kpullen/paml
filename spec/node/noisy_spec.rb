require "spec_helper"
include Paml

describe Node::Noisy do
	subject { Node::Noisy.new content: "$thing" }
	it("echos everything") { subject.intro.should eq "<?php echo $thing; ?>" }
	it("has no outro") { subject.outro.should eq nil }
end
