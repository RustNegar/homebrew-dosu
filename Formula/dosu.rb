class Dosu < Formula
  desc "Modern, cross-platform bidirectional (Persian/Arabic) terminal wrapper"
  homepage "https://github.com/RustNegar/dosu"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-apple-darwin.tar.gz"
      sha256 "12dbea1670de1a5caab45532e5edee3c2bbea7f97863d53915794f342cdad300"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-apple-darwin.tar.gz"
      sha256 "030edfbb167848b4ebb06cbfadffdda22fee773032f27b347abba68ef9642583"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3e1bb3db71cbe92261177eccf548ba9d1452205b5c8169a3780386d2271d6a7"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8af98404c3f08befe71a5eb254901f6f1ba969c2a1d486afd14dce07e8d58556"
    end
  end

  def install
    bin.install "dosu"
    zsh_completion_dir = etc/"dosu"
    zsh_completion_dir.install "zsh/rustnegar.zsh" if File.exist?("zsh/rustnegar.zsh")
  end

  def caveats
    <<~EOS
      To launch dosu automatically in new zsh sessions, add this to ~/.zshrc:
        cat #{HOMEBREW_PREFIX}/etc/dosu/rustnegar.zsh >> ~/.zshrc
    EOS
  end

  test do
    assert_match "dosu", shell_output("#{bin}/dosu --help")
  end
end
