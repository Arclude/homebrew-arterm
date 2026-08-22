class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.10/arterm-macos-aarch64.tar.gz"
      sha256 "1ff0d7b45caa32becca7dd11d793bb4e1b556401d90cc765ce73f6fdfea4f93a"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.10/arterm-macos-x86_64.tar.gz"
      sha256 "45a12e11be3b43bd7bbafa94900309ca65def479dbdfed14c549ecd4b7d88a5a"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.10/arterm-linux-x86_64.tar.gz"
      sha256 "0de8076b8634adacef6f59f82a2b2969ea6f7eb2fdd1121155f2b59a4ef8e847"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.10/arterm-linux-aarch64.tar.gz"
      sha256 "d143acc52335692b0aead2becb9bdc04d04e12308ad6b707083e473311ac9fd0"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
