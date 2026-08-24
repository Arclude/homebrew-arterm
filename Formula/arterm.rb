class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.12/arterm-macos-aarch64.tar.gz"
      sha256 "99a7aad4782c3218b7ab98cee4873246a79c03aae567b436a3e5487281253b93"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.12/arterm-macos-x86_64.tar.gz"
      sha256 "05d1726a2f6e62e43759abccc79d491c2d397f553aaea78acf517eda901b08eb"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.12/arterm-linux-x86_64.tar.gz"
      sha256 "fc78c89649a9abcee1e38650f313648d4f06508a28375cf9ca33976f39796076"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.12/arterm-linux-aarch64.tar.gz"
      sha256 "eae3898e09f11b706097017ad4d9ca336dbca4944f7b102ce0d410c6fb19dac3"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
