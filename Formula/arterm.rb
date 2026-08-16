class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.6/arterm-macos-aarch64.tar.gz"
      sha256 "3c4dabefb2dd5d99b283066e826736f897cf26f35cd434fd7a76fb87f636af66"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.6/arterm-macos-x86_64.tar.gz"
      sha256 "ac877d2395314380834ad03e00c1c50de58819175acd25411b74df354ff5d938"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.6/arterm-linux-x86_64.tar.gz"
      sha256 "8e4cf0a1bb301550c5a1a2432a269677b9358dd2c7dd6cf2805ad009f51ca185"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.6/arterm-linux-aarch64.tar.gz"
      sha256 "6a7bf169807230b6e87893b072446eb2348b69a235fdc32988adba86687ac93d"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
