class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.5/arterm-macos-aarch64.tar.gz"
      sha256 "118f4b0576b2b534b17fef5b6eeabf87dfe027ce3829e7f9ffbe3c249dc30bed"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.5/arterm-macos-x86_64.tar.gz"
      sha256 "fd1d9de23ec5e6c2d95053c0f81ea95095773495bbf8bb30ea9e7b474728cc60"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.5/arterm-linux-x86_64.tar.gz"
      sha256 "7259fef8dddfa201f93805389b0af69a8ddb82547fc83b92ce6061b7b5ebdcb6"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.5/arterm-linux-aarch64.tar.gz"
      sha256 "ec9ff93bf0787d9bd89085bc81dbaf70a170ad23b15e6caefa0441a80d9bb787"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
