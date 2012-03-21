require 'formula'

class Sys161 < Formula
  url 'http://www.cse.unsw.edu.au/~cs3231/10s1/os161/files/sys161-1.99.04.tar.gz'
  version '1.99.04'
  md5 'e7f72e6f53c018ef7b7ca81a5efbcf50'
  
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
