# frozen_string_literal: true

VERSION = '1.0.2'
PACKAGE = 'aws-config-creator'
REPO = "https://github.com/scottbrown/#{PACKAGE}"

# Homebrew formula
class AwsConfigCreator < Formula
  desc 'Command line tool to automatically generate a .aws/config file based on AWS SSO rules in your org.'
  homepage REPO
  license 'MIT'
  version VERSION

  def prefix
    "#{REPO}/releases/download/#{VERSION}/#{PACKAGE}_#{VERSION}"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "#{prefix}_darwin_arm64.tar.gz"
      sha256 '6ada31955cd1b30610b65cbd5194d8880ee40fb03d61a52900c9f7b00290a82b'
    else
      url "#{prefix}_darwin_amd64.tar.gz"
      sha256 '2ab1777f9fc5a68df7598f94772f7e580fea6b0acacc8bafe4104d7c47031567'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{prefix}_linux_arm64.tar.gz"
      sha256 '4875621865a66d7c20b9aa159c9f0b849b18da08b7c543e2f60190843c9a992c'
    else
      url "#{prefix}_linux_amd64.tar.gz"
      sha256 'b29bb51edb6bc61cdebadaf4f8cbd55b197fef0d17c2596816a8043051e193e8'
    end
  end

  def install
    bin.install PACKAGE
  end

  test do
    system "#{bin}/#{PACKAGE}", '--help'
  end
end
