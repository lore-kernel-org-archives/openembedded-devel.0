Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHxsU-0004dJ-6D for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 09:19:18 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id BFF944014D4; Mon, 28 Aug 2006 23:57:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829065731.BFF944014D4@tinman.treke.net>
Date: Mon, 28 Aug 2006 23:57:31 -0700 (PDT)
Subject: [Bug 366] ImageMagick package bb file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 07:19:18 -0000

http://bugs.openembedded.org/show_bug.cgi?id=366





------- Comment #3 from openembedded@hrw.one.pl  2006-08-28 23:57 -------
Are you sure that everything is properly packaged?

NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/art.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/art.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/art.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avi.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avi.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avi.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avs.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avs.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/avs.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/bmp.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/bmp.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/bmp.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/caption.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/caption.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/caption.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cin.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cin.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cin.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cip.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cip.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cip.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/clip.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/clip.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/clip.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cmyk.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cmyk.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cmyk.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cut.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cut.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/cut.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dcm.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dcm.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dcm.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dib.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dib.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dib.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dot.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dot.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dot.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dps.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dps.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dps.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dpx.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dpx.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/dpx.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fax.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fax.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fax.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fits.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fits.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/fits.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gif.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gif.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gif.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gradient.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gradient.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gradient.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gray.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gray.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/gray.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/histogram.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/histogram.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/histogram.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/html.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/html.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/html.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/icon.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/icon.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/icon.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/info.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/info.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/info.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/label.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/label.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/label.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/magick.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/magick.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/magick.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/map.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/map.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/map.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mat.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mat.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mat.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/matte.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/matte.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/matte.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/meta.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/meta.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/meta.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/miff.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/miff.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/miff.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mono.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mono.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mono.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mpc.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mpc.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mpc.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/mpeg.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/preview.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tile.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tile.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tim.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tim.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tim.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ttf.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ttf.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ttf.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/txt.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/txt.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/txt.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uil.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uil.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uil.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/url.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/url.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/url.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uyvy.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uyvy.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/uyvy.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vicar.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vicar.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vicar.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vid.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vid.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/vid.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/viff.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/viff.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/viff.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wbmp.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wbmp.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wbmp.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wmf.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wmf.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wmf.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wpg.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wpg.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/wpg.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xbm.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xbm.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xbm.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xc.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xc.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xc.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xcf.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xcf.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xcf.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xpm.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xpm.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/xpm.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ycbcr.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ycbcr.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ycbcr.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/yuv.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/yuv.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/yuv.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/jpeg.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/jpeg.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/jpeg.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/png.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/png.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/png.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ept.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ept.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/ept.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tiff.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tiff.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/coders/tiff.a
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/filters/analyze.so
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/filters/analyze.la
NOTE:   /usr/lib/ImageMagick-6.2.9/modules-Q16/filters/analyze.a
NOTE:   /usr/lib/ImageMagick-6.2.9/config/colors.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/configure.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/delegates.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/english.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/locale.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/type.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/type-ghostscript.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/type-solaris.xml
NOTE:   /usr/lib/ImageMagick-6.2.9/config/type-windows.xml
NOTE:   /usr/share/ImageMagick-6.2.9/LICENSE
NOTE:   /usr/share/ImageMagick-6.2.9/ChangeLog
NOTE:   /usr/share/ImageMagick-6.2.9/NEWS
NOTE:   /usr/share/ImageMagick-6.2.9/config/coder.xml
NOTE:   /usr/share/ImageMagick-6.2.9/config/log.xml
NOTE:   /usr/share/ImageMagick-6.2.9/config/magic.xml
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/lib/perl5/site_perl/5.8.7/i686-linux-thread-multi/auto/Image/Magick/Magick.so
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/lib/perl5/site_perl/5.8.7/i686-linux-thread-multi/auto/Image/Magick/Magick.bs
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/lib/perl5/site_perl/5.8.7/i686-linux-thread-multi/auto/Image/Magick/autosplit.ix
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/lib/perl5/site_perl/5.8.7/i686-linux-thread-multi/auto/Image/Magick/.packlist
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/lib/perl5/site_perl/5.8.7/i686-linux-thread-multi/Image/Magick.pm
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/local/man/man3/Image::Magick.3perl
NOTE:  
/home/hrw/devel/build/3541-feed/tmp/staging/i686-linux/lib/perl5/5.8.7/i686-linux-thread-multi/perllocal.pod
Packaged contents of imagemagick into
/home/hrw/devel/build/3541-feed/tmp/deploy/ipk/imagemagick_6.2.9-r0_arm.ipk
Packaged contents of imagemagick-doc into
/home/hrw/devel/build/3541-feed/tmp/deploy/ipk/imagemagick-doc_6.2.9-r0_arm.ipk
Packaged contents of imagemagick-dev into
/home/hrw/devel/build/3541-feed/tmp/deploy/ipk/imagemagick-dev_6.2.9-r0_arm.ipk


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


