class Arterm < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/Arclude/Arterm-CLI"
  version "0.10.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.9/arterm-macos-aarch64.tar.gz"
      sha256 "1dc82b9a701d40f925d47aaf7fef5ffd10c6f564110ea0de0eb0e5872237e8fa"

      def install
        bin.install "arterm-macos-aarch64" => "arterm"
      end
    end

    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.9/arterm-macos-x86_64.tar.gz"
      sha256 "f334a47037441e3e6accaac366841bb9b4e5ff039197b4128915a6e97555e21c"

      def install
        bin.install "arterm-macos-x86_64" => "arterm"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.9/arterm-linux-x86_64.tar.gz"
      sha256 "43f6fe99550664ca5e8c135cf72b07afbe5bfa7bbc0728cb261217e5e717e72d"

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
      url "https://github.com/Arclude/Arterm-CLI/releases/download/v0.10.9/arterm-linux-aarch64.tar.gz"
      sha256 "fd7478ee5ece296654eaec2fb2ad7c26211322139385ad4e405b2bc192cd63f1"

      def install
        bin.install "arterm-linux-aarch64" => "arterm"
      end
    end
  end

  test do
    assert_match "arterm", shell_output("#{bin}/arterm --version")
  end
end
