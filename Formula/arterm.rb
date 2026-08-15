class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.3/arterm-macos-aarch64.tar.gz"
      sha256 "5104cf658d7daaf74dcc7c5505caa1af9fa6e5f9caddce1737d2f3abb2391f0b"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.3/arterm-macos-x86_64.tar.gz"
      sha256 "cbc980f2466793188dd1ade63f88da0c62ebfac44fb57c81e0a0e5019d4d654c"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.3/arterm-linux-x86_64.tar.gz"
      sha256 "3fd4e18de3acd34da77846293e7cdcbfbb6f0cea2e174dd8f79d3eb0e5dc9233"

      def install
        libexec.install "arterm-linux-x86_64", "arterm-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"arterm").write <<~SH
#!/bin/sh
exec "#{libexec}/arterm-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.3/arterm-linux-aarch64.tar.gz"
      sha256 "77cd14c046bcc8a9e17107904a91b5222eb4f3e4705e84111271f345cc4ba09a"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
