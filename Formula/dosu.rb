class Dosu < Formula
  desc "Modern, cross-platform bidirectional (Persian/Arabic) terminal wrapper"
  homepage "https://github.com/RustNegar/dosu"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-apple-darwin.tar.gz"
      sha256 "c37cd95a44bc119009f8788382919dbb674815800fa0b4e12a62d5072c119007"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-apple-darwin.tar.gz"
      sha256 "b94844708261fdbc5a3ae7f8fe4fc40774bdc2a083cf37c780aa55d29d31aa4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad9183c517be7a0842d7dfc2ca0890ebee8d044e69ebec0562f8cbcd7aa3f191"
    end
    on_intel do
      url "https://github.com/RustNegar/dosu/releases/download/v#{version}/dosu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b7461a1d4f180730e58f1ca52893d276dd1f50ba74d0361a376bb8d41a467be"
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
