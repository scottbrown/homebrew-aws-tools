# frozen_string_literal: true

VERSION = '0.0.6'
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
      sha256 'd64943a79140035a42e48d9cb60fd541503e611f54f874383706a37e10bd8547'
    else
      url "#{prefix}_darwin_amd64.tar.gz"
      sha256 'cfb4c20af529c72ce0f7ebe37749c07ab633ffeb7bfd7c4693740f30cb835903'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{prefix}_linux_arm64.tar.gz"
      sha256 'a0d594baca8c3e1f5da1c79bd80e3aa96eb926ae9ff7a76bc65f96b89d3df8ae'
    else
      url "#{prefix}_linux_amd64.tar.gz"
      sha256 'bb03a8ce77fc6ef18883c682d7b091b5669deb3e899b82f33d55bc6424c2cd0d'
    end
  end

  def install
    bin.install PACKAGE
  end

  test do
    system "#{bin}/#{PACKAGE}", '--help'
  end
end
