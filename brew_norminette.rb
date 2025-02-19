class Norminette < Formula
  include Language::Python::Virtualenv

  desc "Official 42 norminette"
  homepage "https://github.com/42School/norminette"
  url "https://files.pythonhosted.org/packages/32/7d/a7bd0a9eab47b0e23874996d62bc9af39328b7e9e939f29340330d56f4c5/norminette-3.3.55.tar.gz"
  sha256 "66356de519fdd361043ea1473ea5317b6087ce60c9f1f2fb172aaf3f7fcfe98c"
  license "MIT"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"blank.c").write <<~EOF
    EOF
    output = shell_output("#{bin}/norminette #{testpath/"blank.c"}")
    assert_match "blank.c: OK!", output.chomp
  end
end
