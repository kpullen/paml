require "spec_helper"
include Paml

describe Silent do
	let(:_other) { Silent.new content: "method()" }
	let(:_if) { Silent.new content: "if(true)" }
	let(:_else_if) { Silent.new content: "else if(true)" }
	let(:_else) { Silent.new content: "else" }
	let(:_foreach) { Silent.new content: "foreach($things as $thing)" }
	let(:_while) { Silent.new content: "while(true)" }

	it("handles non control flow stuff") { _other.intro.should eq "<?php method(); ?>" }
	it("doesn't close non control flow stuff") { _other.outro.should eq "" }

	it("handles ifs") { _if.intro.should eq "<?php if(true): ?>" }
	it("closes ifs")  { _if.outro.should eq "<?php endif; ?>" }

	it("handles else ifs") { _else_if.intro.should eq "<?php else if(true): ?>" }
	it("doesn't close else ifs") { _else_if.outro.should eq "" }

	it("handles elses") { _else.intro.should eq "<?php else: ?>" }
	it("doesn't close elses") { _else.outro.should eq "" }

	it("handles foreaches") { _foreach.intro.should eq "<?php foreach($things as $thing): ?>" }
	it("closes foreaches") { _foreach.outro.should eq "<?php endforeach; ?>" }

	it("handles whiles") { _while.intro.should eq "<?php while(true): ?>" }
	it("closes whiles") { _while.outro.should eq "<?php endwhile; ?>" }
end
