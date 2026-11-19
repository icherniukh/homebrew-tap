class Brewq < Formula
  include Language::Python::Virtualenv

  desc "Read-only Homebrew query and analytics tool"
  homepage "https://github.com/icherniukh/brewq"
  url "https://github.com/icherniukh/brewq/releases/download/v0.21.0/brewq-0.21.0.tar.gz"
  sha256 "2b10de2da94ed11d9feca63de35f9ccceea7d0762b14d571a4555ffe70432c9f"
  license "MIT"
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Link the `bq` shorthand beside `brewq` when that name is free:
        brewq +setup
      An existing foreign `bq` is left unchanged.
    EOS
  end

  test do
    assert_match "brewq #{version}", shell_output("#{bin}/brewq --version")
  end
end
