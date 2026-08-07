class Dosu < Formula
  desc "Modern, cross-platform bidirectional (Persian/Arabic) terminal wrapper"
  homepage "https://github.com/RustNegar/dosu"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-apple-darwin.tar.gz"
      sha256 "c55d4c9486a92cc7b6bf24e8777eea33c2e6eefd4a32572d53625486ceb787ee"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-apple-darwin.tar.gz"
      sha256 "36dd946fc071fff10f234ebe6762690c2b3abfd89694e038a047277193efa218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c0bac9e1503a75171061ec874918cd7c7de5de209c314957e3d02721070fa9d"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "149e0763d7ed9dc706e6bcd315a27041d9e6435f69b3d4caad4c0150830665f6"
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
