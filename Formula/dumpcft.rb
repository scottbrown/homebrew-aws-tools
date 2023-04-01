# frozen_string_literal: true

VERSION = '0.0.5'
PACKAGE = 'dumpcft'
REPO = "https://github.com/scottbrown/#{PACKAGE}"

# Homebrew formula
class Dumpcft < Formula
  desc 'Dumps the templates of all CloudFormation stacks in one or more regions.'
  homepage REPO
  license 'MIT'
  version VERSION

  def self.prefix
    "#{REPO}/releases/download/v#{VERSION}/#{PACKAGE}_v#{VERSION}"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "#{prefix}_darwin_arm64.tar.gz"
      sha256 '9f92c0ff95fca39ccb367eb51f350cf4486842c277b6c6286c70e19f61c09584'
    else
      url "#{prefix}_darwin_amd64.tar.gz"
      sha256 '0620c13837534b0173d07455cd2ab024d6ce753920e6d721f34641a31b089305'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{prefix}_linux_arm64.tar.gz"
      sha256 'cb50f326f1221d042d563771c72b48c18a49c60244ec812fa44083b1f409ecf5'
    else
      url "#{prefix}_linux_amd64.tar.gz"
      sha256 '44fd4ff37548a9fe95a4a88c7db33841c98b57c634e0c451e34e47355301b055'
    end
  end

  def install
    bin.install PACKAGE
  end

  test do
    system "#{bin}/#{PACKAGE}", '--help'
  end
end
