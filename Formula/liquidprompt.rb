class Liquidprompt < Formula
  desc "Adaptive prompt for bash and zsh shells"
  homepage "https://github.com/nojhan/liquidprompt"
  url "https://github.com/nojhan/liquidprompt/archive/v2.0.0.tar.gz"
  sha256 "ed5ca39b4afb5108b7f0e8580b112559f6c05d440e502c4c9c5e911f9c6ca497"
  license "AGPL-3.0-or-later"
  head "https://github.com/nojhan/liquidprompt.git", branch: "master"

  bottle :unneeded

  def install
    share.install "liquidpromptrc-dist"
    share.install "liquidprompt"
  end

  def caveats
    <<~EOS
      Add the following lines to your bash or zsh config (e.g. ~/.bash_profile):
        if [ -f #{HOMEBREW_PREFIX}/share/liquidprompt ]; then
          . #{HOMEBREW_PREFIX}/share/liquidprompt
        fi

      If you'd like to reconfigure options, you may do so in ~/.liquidpromptrc.
      A sample file you may copy and modify has been installed to
        #{HOMEBREW_PREFIX}/share/liquidpromptrc-dist
    EOS
  end

  test do
    liquidprompt = "#{HOMEBREW_PREFIX}/share/liquidprompt"
    output = shell_output("/bin/sh #{liquidprompt} 2>&1")
    assert_match "add-zsh-hook: command not found", output
  end
end
