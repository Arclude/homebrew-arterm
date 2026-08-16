class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.4/arterm-macos-aarch64.tar.gz"
      sha256 "2df29b0a1bbf5d76f9ea729a330118f991a5bc1923698852db8f56a4da4b7060"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.4/arterm-macos-x86_64.tar.gz"
      sha256 "c5635dbecdfff5ec1d5f73f96c767416586dd08db3697261a999efcb09607e0f"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.4/arterm-linux-x86_64.tar.gz"
      sha256 "97449bd4ccd38180a52947351eb65bde6d3c8cafac7ea1970984820d7b3246ac"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.4/arterm-linux-aarch64.tar.gz"
      sha256 "8db642bccb2b6d3a4da63b0fadf37a573f082ebc9211079fa0def2fd4f795e65"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
