require 'formula'

class Sys161 < Formula
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/sys161-1.99.06.tar.gz'
  version '1.99.06'
  sha256 '7cacbadbccb183ce4ca405e73e91d374e00e92fd0606b57617840b381fff37be'
  
  depends_on "os161-binutils"
  depends_on "os161-gcc"
  depends_on "os161-gdb"
  depends_on "bmake"
  
  def install
    system "./configure", "--prefix=#{prefix}", "mipseb"
    system "make"
    system "make install"
  end
  
end
