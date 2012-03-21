require 'formula'

class BmakeMK < Formula
  url 'http://www.cse.unsw.edu.au/~cs3231/10s1/os161/files/mk.tar.gz'
  version '1'
  md5 'c5d840ebe6e337e617bb756953dcad14'
  
end

class Bmake < Formula
  homepage ''
  url 'http://www.cse.unsw.edu.au/~cs3231/10s1/os161/files/bmake.tar.gz'
  md5 '5960a18d5bf01da17fc60378cb2bfc3b'
  version '1'

  def install
    d = Dir.pwd
    BmakeMK.new.brew { mkdir "#{d}/mk"; cp Dir['*'], "#{d}/mk/" }
    system "./configure", "--prefix=#{prefix}"

    system "make -f makefile.boot"
    system "make -f makefile.boot install"

  end
end
