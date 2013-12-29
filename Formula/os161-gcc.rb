require 'formula'

class Os161Gcc < Formula
  homepage ''
  url 'http://www.eecs.harvard.edu/~dholland/os161/download/gcc-4.1.2+os161-2.0.tar.gz'
  sha1 '5229851ab8edddd096887f31011a326f006aa295c34ad3861a742499d0acc782'

  # Dont strip compilers.
  skip_clean :all
  
  depends_on 'os161-binutils'

  def install
    # # brew's build environment is in our way
    # ENV.delete 'CFLAGS'
    # ENV.delete 'CXXFLAGS'
    # ENV.delete 'AS'
    # ENV.delete 'LD'
    # ENV.delete 'NM'
    # ENV.delete 'RANLIB'
    ENV["CFLAGS"] = "-Os -w -pipe -std=gnu89"
    ENV["CXXFLAGS"] = "-Os -w -pipe"

    # if MacOS.lion?
    #   ENV['CC'] = 'clang'
    # end
    args = [
            "--nfp", "--disable-shared", "--disable-werror", "--disable-threads",                         
            "--disable-libmudflap",
            "--disable-libssp",
            "--target=mips-harvard-os161",
            "--prefix=#{prefix}",
#            "--datarootdir=#{share}",
            "--bindir=#{bin}",
            "--with-as=/usr/local/bin/os161-as"
           ]

    Dir.mkdir 'build'
    Dir.chdir 'build' do
      system '../configure', "--enable-languages=c", *args
      system 'make'
      system 'make install'
      system "for i in #{bin}/mips-*; do ln -s $i #{bin}/$(echo $i | cut -d- -f4-); done"
    end

  end

end
