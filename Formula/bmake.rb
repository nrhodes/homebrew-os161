require 'formula'

class BmakeMK < Formula
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/mk-20100612.tar.gz'
  version '1'
  md5 '333b2cb2eb7087fc874584b58522efe4'
  
end

class Bmake < Formula
  homepage ''
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/bmake-20101215.tar.gz'
  md5 'a64e489368f0bc80de326832dcc436c5'
  version '1'

  def install
    d = Dir.pwd
    BmakeMK.new.brew { mkdir "#{d}/mk"; cp Dir['*'], "#{d}/mk/" }
    system "./configure", "--prefix=#{prefix}"

    system "make -f makefile.boot"
    system "make -f makefile.boot install"

  end
end
