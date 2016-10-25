Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 193E171AC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:49:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 128so19725431pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=eUme6YOlFFg/LgtJOPeKXLTa8G58ovMSvd2Hlp1JH90=;
	b=TDHKP+gK48z1ydEuhqmspvHMDEvHQoLKiEcA8VoEe4qmFBepdDzrF/KiVa++KbboeB
	uv8W84MrKIwOQrz0ecSqoZE6Eae/dLvTxdgT6L6Bla0KlljpvB/+gxFxrK7T21WHiESZ
	cRGdWFvcM6WHAKBj4wdlRCvQeLWPsufR5qln4upDlgfezmbS0ts/ze8dkLklktwnh3Yg
	In+rFnF/Rh5EU2GVHXgChzrw2K+8WCGQeGiJpqGriTte01whikVbLalDxpTSNRYa64sA
	2XhAwhPRepzTQ7tPU4bW2RoD64B7rUqDMeryP1zSEBOcHrwORcqhX/Ej7IcT+yET/Tsn
	g6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=eUme6YOlFFg/LgtJOPeKXLTa8G58ovMSvd2Hlp1JH90=;
	b=Toq6qjl3aVHXhm2058ymDan3OmjoL5ce0CSD2cebIKVlNo0Nh0EpxuuJXA1/P+kO2l
	76NPbGe8jqtNnsUBzAS5okGbs6XkPmpDxOBynz37UrEgnd/AJWs5Vpf9WH3cFlOMrYko
	jt5xttSGe9GT9QWaeeDqD+5iF5j9ysAlwmXHM5USDXRb6VQKXt7VXTrN0DVF7rmeNbFI
	dzE/gyRl5XZn/J+T8u28xF6s6wo8XWBqFgn8UaR98EGdcwAvP5FX14VCKwryYlCFH8J3
	RQGsvzklNR/hDVKN7A7s9kZJ6uBbdxFtdAY4jfWTcnP9KdEr+D6eDiciNPC1bSuk76+n
	hZoA==
X-Gm-Message-State: ABUngvcu0e2EUQ/zxWuWavjqs6Wr1BcYIJ25pW2URy68FHeUmoYlMiZXiHcdZ0RjaCLkDQ==
X-Received: by 10.99.215.5 with SMTP id d5mr32936689pgg.131.1477403383648;
	Tue, 25 Oct 2016 06:49:43 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 4sm33748502pfg.66.2016.10.25.06.49.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Oct 2016 06:49:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20161025133211.GD2911@jama>
Date: Tue, 25 Oct 2016 06:49:37 -0700
Message-Id: <9BBA4285-E6DE-43C9-A5AA-980FBF17C6E5@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
	<20161025133211.GD2911@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH 01/16] boinc: Add recipe for boinc-client
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Oct 2016 13:49:43 -0000
X-Groupsio-MsgNum: 63600
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C3D0BFAD-373A-43E2-9498-9AE7246D5DDA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C3D0BFAD-373A-43E2-9498-9AE7246D5DDA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 25, 2016, at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Tue, Oct 18, 2016 at 10:38:19PM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> boinc-client-7.6.33: boinc-client rdepends on libxscrnsaver, but it
> isn't a build dependency, missing libxscrnsaver in DEPENDS or
> PACKAGECONFIG? [build-deps]

thanks, drop this one for now. I will send a v2 with feedback addressed.

>=20
>> ---
>> .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch  | 19 +++++
>> .../boinc/boinc-client/cross-compile.patch         | 92 =
++++++++++++++++++++++
>> .../boinc/boinc-client/opengl_m4_check.patch       | 13 +++
>> .../recipes-extended/boinc/boinc-client_7.6.33.bb  | 60 =
++++++++++++++
>> 4 files changed, 184 insertions(+)
>> create mode 100644 =
meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
>> create mode 100644 =
meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
>> create mode 100644 =
meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
>> create mode 100644 =
meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
>>=20
>> diff --git =
a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch =
b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
>> new file mode 100644
>> index 0000000..3ebf7c8
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
>> @@ -0,0 +1,19 @@
>> +--- A/configure.ac
>> ++++ B/configure.ac
>> +@@ -39,6 +39,7 @@ AC_PROG_CC
>> + AC_PROG_CXX
>> + AC_PROG_F77
>> + AC_PROG_CPP
>> ++AC_PROG_OBJCXX
>> + AC_PROG_MAKE_SET
>> + SAH_LINKS
>> + AC_LANG_PUSH(C)
>> +@@ -744,6 +745,8 @@ AM_CONDITIONAL(ENABLE_LIBRARIES, [test "
>> + AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" =3D=
 yes])
>> + AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" =3D yes -a =
-f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
>> +
>> ++PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
>> ++
>> + dnl =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> + dnl some more vodoo required for building portable client-binary =
(client, clientgui)
>> + dnl =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> diff --git =
a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch =
b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
>> new file mode 100644
>> index 0000000..3d29558
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
>> @@ -0,0 +1,92 @@
>> +Index: boinc-client_release-7.6-7.6.33/api/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- boinc-client_release-7.6-7.6.33.orig/api/Makefile.am
>> ++++ boinc-client_release-7.6-7.6.33/api/Makefile.am
>> +@@ -43,18 +43,18 @@ endif
>> +
>> + lib_LTLIBRARIES =3D libboinc_api.la
>> + libboinc_api_la_SOURCES =3D $(api_files)
>> +-libboinc_api_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_api_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
>> +
>> + if BUILD_GRAPHICS_API
>> + lib_LTLIBRARIES +=3D libboinc_graphics2.la
>> + libboinc_graphics2_la_SOURCES =3D $(graphics2_files)
>> + libboinc_graphics2_la_CPPFLAGS =3D -I$(top_srcdir) =
-I$(top_srcdir)/lib -I$(top_srcdir)/samples/image_libs
>> +-libboinc_graphics2_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION) -ljpeg
>> ++libboinc_graphics2_la_LDFLAGS =3D -version-number =
$(LIBBOINC_VERSION) -ljpeg
>> + endif #BUILD_GRAPHICS_API
>> +
>> + lib_LTLIBRARIES +=3D libboinc_opencl.la
>> + libboinc_opencl_la_SOURCES =3D $(opencl_files)
>> +-libboinc_opencl_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_opencl_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
>> +
>> + if INSTALL_HEADERS
>> + ## install only headers that are meant for exporting the API !!
>> +Index: boinc-client_release-7.6-7.6.33/lib/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- boinc-client_release-7.6-7.6.33.orig/lib/Makefile.am
>> ++++ boinc-client_release-7.6-7.6.33/lib/Makefile.am
>> +@@ -173,7 +173,7 @@ lib_LTLIBRARIES =3D libboinc.la
>> + libboinc_la_SOURCES =3D $(generic_sources) $(mac_sources) =
$(win_sources)
>> + libboinc_la_CFLAGS =3D $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
>> + libboinc_la_CXXFLAGS =3D $(AM_CXXFLAGS) $(PICFLAGS) =
$(PTHREAD_CFLAGS)
>> +-libboinc_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -static =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_la_LDFLAGS =3D -static -version-number $(LIBBOINC_VERSION)
>> + libboinc_la_LIBADD =3D
>> +
>> + if ENABLE_BOINCCRYPT
>> +@@ -181,7 +181,7 @@ lib_LTLIBRARIES +=3D libboinc_crypt.la
>> + libboinc_crypt_la_SOURCES =3D crypt.cpp
>> + libboinc_crypt_la_CFLAGS =3D $(AM_CFLAGS) $(PICFLAGS) =
$(PTHREAD_CFLAGS) $(SSL_CFLAGS)
>> + libboinc_crypt_la_CXXFLAGS =3D $(AM_CXXFLAGS) $(PICFLAGS) =
$(PTHREAD_CFLAGS) $(SSL_CXXFLAGS)
>> +-libboinc_crypt_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -static =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_crypt_la_LDFLAGS =3D -static -version-number =
$(LIBBOINC_VERSION)
>> + libboinc_crypt_la_LIBADD =3D
>> + endif
>> +
>> +@@ -190,7 +190,7 @@ lib_LTLIBRARIES +=3D libboinc_fcgi.la
>> + libboinc_fcgi_la_SOURCES =3D $(libfcgi_sources) $(mac_sources) =
$(win_sources)
>> + libboinc_fcgi_la_CFLAGS =3D -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) =
$(PTHREAD_CFLAGS)
>> + libboinc_fcgi_la_CXXFLAGS =3D -D_USING_FCGI_ $(AM_CXXFLAGS) =
$(PICFLAGS) $(PTHREAD_CFLAGS)
>> +-libboinc_fcgi_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_fcgi_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
>> + libboinc_fcgi_la_LIBADD =3D
>> + endif
>> + # end of "if ENABLE_FCGI"
>> +Index: boinc-client_release-7.6-7.6.33/sched/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- boinc-client_release-7.6-7.6.33.orig/sched/Makefile.am
>> ++++ boinc-client_release-7.6-7.6.33/sched/Makefile.am
>> +@@ -26,7 +26,7 @@ lib_LTLIBRARIES =3D libsched.la
>> + libsched_la_SOURCES =3D $(libsched_sources)
>> + libsched_la_CFLAGS =3D $(AM_CPPFLAGS)
>> + libsched_la_CXXFLAGS =3D $(AM_CPPFLAGS)
>> +-libsched_la_LDFLAGS=3D -L$(libdir) -rpath $(libdir) -version-number =
$(LIBBOINC_VERSION)
>> ++libsched_la_LDFLAGS=3D -version-number $(LIBBOINC_VERSION)
>> + libsched_la_LIBADD=3D $(SSL_LIBS)
>> +
>> + ## install only headers that are meant for exporting the API !!
>> +@@ -48,7 +48,7 @@ lib_LTLIBRARIES +=3D libsched_fcgi.la
>> + libsched_fcgi_la_SOURCES =3D $(libsched_sources)
>> + libsched_fcgi_la_CFLAGS =3D -D_USING_FCGI_ $(AM_CPPFLAGS)
>> + libsched_fcgi_la_CXXFLAGS =3D -D_USING_FCGI_ $(AM_CPPFLAGS)
>> +-libsched_fcgi_la_LDFLAGS=3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION)
>> ++libsched_fcgi_la_LDFLAGS=3D -version-number $(LIBBOINC_VERSION)
>> + libsched_fcgi_la_LIBADD=3D
>> +
>> + endif
>> +Index: boinc-client_release-7.6-7.6.33/zip/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- boinc-client_release-7.6-7.6.33.orig/zip/Makefile.am
>> ++++ boinc-client_release-7.6-7.6.33/zip/Makefile.am
>> +@@ -61,7 +61,7 @@ endif
>> +
>> + lib_LTLIBRARIES =3D libboinc_zip.la
>> + libboinc_zip_la_SOURCES =3D $(libboinc_zip_sources)
>> +-libboinc_zip_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) =
-version-number $(LIBBOINC_VERSION)
>> ++libboinc_zip_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
>> + libboinc_zip_la_LIBADD =3D
>> +
>> + # Some OSs may not prefix libraries with lib.
>> diff --git =
a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch =
b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
>> new file mode 100644
>> index 0000000..f7295c1
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
>> @@ -0,0 +1,13 @@
>> +Index: boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- boinc-client_release-7.6-7.6.33.orig/m4/ax_check_gl.m4
>> ++++ boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
>> +@@ -58,7 +58,7 @@ else
>> +     else
>> +       ax_try_lib=3D"${ax_lib}"
>> +     fi
>> +-    LIBS=3D"-L${prefix}/lib ${ax_try_lib} ${GL_LIBS} =
${ax_save_LIBS}"
>> ++    LIBS=3D"${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
>> +     AC_LINK_IFELSE(
>> +     [AC_LANG_PROGRAM([[
>> + # if HAVE_WINDOWS_H && defined(_WIN32)
>> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb =
b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
>> new file mode 100644
>> index 0000000..34472e0
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
>> @@ -0,0 +1,60 @@
>> +# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +SUMMARY =3D "Open-source software for volunteer computing"
>> +DESCRIPTION =3D "The Berkeley Open Infrastructure for Network =
Computing (BOINC) is an open- \
>> +source software platform which supports distributed computing, =
primarily in \
>> +the form of volunteer computing and desktop Grid computing.  It is =
well \
>> +suited for problems which are often described as trivially parallel. =
 BOINC \
>> +is the underlying software used by projects such as SETI@home, =
Einstein@Home, \
>> +ClimatePrediciton.net, the World Community Grid, and many other =
distributed \
>> +computing projects. \
>> +This package installs the BOINC client software, which will allow =
your \
>> +computer to participate in one or more BOINC projects, using your =
spare \
>> +computer time to search for cures for diseases, model protein =
folding, study \
>> +global warming, discover sources of gravitational waves, and many =
other types \
>> +of scientific and mathematical research."
>> +
>> +HOMEPAGE =3D "http://boinc.berkeley.edu/"
>> +LICENSE =3D "LGPLv2+ & GPLv3"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
>> +                    =
file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b19c1d46df6"
>> +SECTION =3D "applications"
>> +DEPENDS =3D "curl jpeg openssl xcb-util sqlite3 virtual/libgl =
libnotify gtk+ nettle"
>> +
>> +SRC_URI =3D =
"https://github.com/BOINC/boinc/archive/client_release/7.6/${PV}.tar.gz =
\
>> +           file://boinc-AM_CONDITIONAL.patch \
>> +           file://opengl_m4_check.patch \
>> +           file://cross-compile.patch \
>> +"
>> +SRC_URI[md5sum] =3D "437b4b98e384b4bda4ef7056e68166ac"
>> +SRC_URI[sha256sum] =3D =
"c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d"
>> +
>> +inherit gettext autotools-brokensep pkgconfig
>> +
>> +S =3D "${WORKDIR}/${BPN}_release-7.6-${PV}"
>> +
>> +EXTRA_OECONF +=3D "\
>> +    --enable-libraries \
>> +    --enable-unicode \
>> +    --enable-shared \
>> +    --enable-dynamic-client-linkage \
>> +    --enable-client \
>> +    --disable-server \
>> +    --disable-static \
>> +    --disable-manager \
>> +    --with-ssl=3D${STAGING_EXECPREFIXDIR} \
>> +    --without-wxdir \
>> +    --without-x \
>> +    --with-boinc-platform=3D${TARGET_SYS} \
>> +"
>> +export PKG_CONFIG =3D "${STAGING_BINDIR_NATIVE}/pkg-config"
>> +
>> +do_compile_prepend () {
>> +	# Disable rpaths
>> +	sed -i -e =
's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=3D""|g' =
${B}/${TARGET_SYS}-libtool
>> +	sed -i -e =
's|^sys_lib_dlsearch_path_spec=3D.*|sys_lib_dlsearch_path_spec=3D""|g' =
${B}/${TARGET_SYS}-libtool
>> +	sed -i -e =
's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' =
${B}/${TARGET_SYS}-libtool
>> +}
>> +
>> +SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
>> --
>> 2.10.0
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C3D0BFAD-373A-43E2-9498-9AE7246D5DDA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgPYvUACgkQuwUzVZGdMxTR1gCePG5JlXutXQG71jU56KUPCS2Q
9pEAoIdyhfqkq17KU8P5JJVhtHURqJmE
=PWNJ
-----END PGP SIGNATURE-----

--Apple-Mail=_C3D0BFAD-373A-43E2-9498-9AE7246D5DDA--
