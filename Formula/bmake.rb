require 'formula'

resource 'mk' do
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/mk-20100612.tar.gz'
  sha256 '37abd0c420f9caec56af27909b8cdda7e81fd4c4eac6a15e4583511693050e7b'
end

class Bmake < Formula
  homepage ''
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/bmake-20101215.tar.gz'
  sha256 'aea63d5de54540445e9cd3f4b6f603bdabaebabff8e0567ad6d420b8078cd11f'
  version '1'

  def install
    d = Dir.pwd
    resource('mk').stage { mv ../mk d }
    system "./configure", "--prefix=#{prefix}"

    system "make -f makefile.boot"
    system "make -f makefile.boot install"

  end
end
