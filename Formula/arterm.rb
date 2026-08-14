class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.0/arterm-macos-aarch64.tar.gz"
      sha256 "450df5a77085d9bd5e2a0b6efbae1b8a0c5d431b7bdb187b18a4b1e003d28912"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.0/arterm-macos-x86_64.tar.gz"
      sha256 "a2e3fa2be16fd2d02f96166a0f6335e750cd521c5f80eccece21bba710364b02"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.0/arterm-linux-x86_64.tar.gz"
      sha256 "0763b785f676bb0d3d0eaefff82da47e9d97f6dfc8b7daf4a01c4df4480ce387"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.0/arterm-linux-aarch64.tar.gz"
      sha256 "c8c6fa0b4a631efc3aafc0560e2e27b4a17089a12bc8f08c212c16d7c53e75f3"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
