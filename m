Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKQ7j-0001pB-D1
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:43:38 +0100
Received: by gwaa11 with SMTP id a11so4093988gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=e8C0FRvNrOq+8tqPzP1kRygCAiy7I3CIWsYr7okKomw=;
	b=nbetuf1vu+S8gZuyLMYTy1dU89xHghjn3FldMNI6MgdEW0A+4XMMfkWoEYxgIt8vAT
	8OrMPwTjbRKOsERwuk+YUxAPHketAFgTAwW4OODmJBHOwJW8bjjbaoUMG6LIletJcuj7
	0YfW/PKA8fipL0wkn11ItbZ6sgXGklVKgygHU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=WWyz8q6GeAHOl2om6jebLAQOFnGXqX4y93xv225chp8QTAY0zqUgOuScTn18xItfmU
	p0eymMsEXALhtHK5sODLbxP64/w3QlLJFjgGMq54A3kTn5Wino7WYLlT9j6HTrw5/beA
	1ympVakcIkoLz/hiMm+RBRxB/7CcHtLP1MsEg=
Received: by 10.90.99.8 with SMTP id w8mr6826942agb.0.1290408142981; Sun, 21
	Nov 2010 22:42:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 22:42:02 -0800 (PST)
In-Reply-To: <1290383951-6683-3-git-send-email-obi@opendreambox.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
	<1290383951-6683-3-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 22:42:02 -0800
Message-ID: <AANLkTimfa1paBBCP4+1rgkmn+Z60oQHm_nHxrHVhug=G@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] swfdec: remove unused old recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Nov 2010 06:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2010 at 3:59 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/swfdec/swfdec-mozilla_0.7.2.bb =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 21 -----------
> =C2=A0recipes/swfdec/swfdec-mozilla_0.7.4.bb =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 21 -----------
> =C2=A0recipes/swfdec/swfdec-mozilla_0.8.2.bb =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 24 ------------
> =C2=A0recipes/swfdec/swfdec/arm/jsautocfg.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 52 ---------------------------
> =C2=A0recipes/swfdec/swfdec/fix-cross-build.patch | =C2=A0 14 -------
> =C2=A0recipes/swfdec/swfdec_0.4.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 20 ----------
> =C2=A0recipes/swfdec/swfdec_0.7.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 27 --------------
> =C2=A0recipes/swfdec/swfdec_0.7.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 25 -------------
> =C2=A0recipes/swfdec/swfdec_0.8.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 23 ------------
> =C2=A09 files changed, 0 insertions(+), 227 deletions(-)
> =C2=A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.2.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.4.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.8.2.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec/arm/jsautocfg.h
> =C2=A0delete mode 100644 recipes/swfdec/swfdec/fix-cross-build.patch
> =C2=A0delete mode 100644 recipes/swfdec/swfdec_0.4.0.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec_0.7.2.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec_0.7.4.bb
> =C2=A0delete mode 100644 recipes/swfdec/swfdec_0.8.2.bb
>
> diff --git a/recipes/swfdec/swfdec-mozilla_0.7.2.bb b/recipes/swfdec/swfd=
ec-mozilla_0.7.2.bb
> deleted file mode 100644
> index 0f453aa..0000000
> --- a/recipes/swfdec/swfdec-mozilla_0.7.2.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a dec=
oder/renderer for Macromedia Flash animations."
> -LICENSE =3D "LGPL"
> -
> -PR =3D "r3"
> -
> -DEPENDS =3D "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil =
zlib gtk+ alsa-lib \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_conditional('ENTERPRISE_DIST=
RO', '1', '', 'libmad', d)}"
> -RDEPENDS_${PN} =3D "gst-ffmpeg"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/$=
{P}.tar.gz \
> -"
> -
> -inherit autotools pkgconfig
> -
> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
> -FILES_${PN}-dev +=3D "${libdir}/mozilla/plugins/*a"
> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
> -
> -
> -SRC_URI[md5sum] =3D "3bc6a49357b4b8b478ce3dfb4f007f18"
> -SRC_URI[sha256sum] =3D "84962251e647fdcdcf111bef0c478f7d3679ae104267ba72=
e59ad749c6955cc2"
> diff --git a/recipes/swfdec/swfdec-mozilla_0.7.4.bb b/recipes/swfdec/swfd=
ec-mozilla_0.7.4.bb
> deleted file mode 100644
> index 4eb3ebb..0000000
> --- a/recipes/swfdec/swfdec-mozilla_0.7.4.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a dec=
oder/renderer for Macromedia Flash animations."
> -LICENSE =3D "LGPL"
> -
> -PR =3D "r2"
> -
> -DEPENDS =3D "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil =
zlib gtk+ alsa-lib \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_conditional('ENTERPRISE_DIST=
RO', '1', '', 'libmad', d)}"
> -RDEPENDS_${PN} =3D "gst-ffmpeg"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/$=
{P}.tar.gz \
> -"
> -
> -inherit autotools pkgconfig
> -
> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
> -FILES_${PN}-dev +=3D "${libdir}/mozilla/plugins/*a"
> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
> -
> -
> -SRC_URI[md5sum] =3D "c5958f3b003190b21977495021ac2b28"
> -SRC_URI[sha256sum] =3D "0d7927f2e791321b2867c120eb4140d9017c59b77925eb90=
9b2a03f3ef2a8fe4"
> diff --git a/recipes/swfdec/swfdec-mozilla_0.8.2.bb b/recipes/swfdec/swfd=
ec-mozilla_0.8.2.bb
> deleted file mode 100644
> index 5710b93..0000000
> --- a/recipes/swfdec/swfdec-mozilla_0.8.2.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a dec=
oder/renderer for Macromedia Flash animations."
> -LICENSE =3D "LGPL"
> -
> -DEPENDS =3D "swfdec glib-2.0"
> -RDEPENDS_${PN} =3D "gst-ffmpeg"
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.8/$=
{P}.tar.gz \
> -"
> -
> -inherit autotools pkgconfig gtk-icon-cache
> -
> -EXTRA_OECONF =3D "--disable-static"
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 rm ${D}${libdir}/mozilla/plugins/*.la
> -}
> -
> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
> -
> -
> -SRC_URI[md5sum] =3D "716632e0d35b3c1582c180569ba30346"
> -SRC_URI[sha256sum] =3D "49fd905f41b67832e7b2cfa2cf664657ab08f8fef4a2324e=
74202fc951396cd5"
> diff --git a/recipes/swfdec/swfdec/arm/jsautocfg.h b/recipes/swfdec/swfde=
c/arm/jsautocfg.h
> deleted file mode 100644
> index 7e8171f..0000000
> --- a/recipes/swfdec/swfdec/arm/jsautocfg.h
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -#ifndef js_cpucfg___
> -#define js_cpucfg___
> -
> -/* AUTOMATICALLY GENERATED - DO NOT EDIT */
> -
> -#define IS_LITTLE_ENDIAN 1
> -#undef =C2=A0IS_BIG_ENDIAN
> -
> -#define JS_BYTES_PER_BYTE =C2=A0 1L
> -#define JS_BYTES_PER_SHORT =C2=A02L
> -#define JS_BYTES_PER_INT =C2=A0 =C2=A04L
> -#define JS_BYTES_PER_INT64 =C2=A08L
> -#define JS_BYTES_PER_LONG =C2=A0 4L
> -#define JS_BYTES_PER_FLOAT =C2=A04L
> -#define JS_BYTES_PER_DOUBLE 8L
> -#define JS_BYTES_PER_WORD =C2=A0 4L
> -#define JS_BYTES_PER_DWORD =C2=A08L
> -
> -#define JS_BITS_PER_BYTE =C2=A0 =C2=A08L
> -#define JS_BITS_PER_SHORT =C2=A0 16L
> -#define JS_BITS_PER_INT =C2=A0 =C2=A0 32L
> -#define JS_BITS_PER_INT64 =C2=A0 64L
> -#define JS_BITS_PER_LONG =C2=A0 =C2=A032L
> -#define JS_BITS_PER_FLOAT =C2=A0 32L
> -#define JS_BITS_PER_DOUBLE =C2=A064L
> -#define JS_BITS_PER_WORD =C2=A0 =C2=A032L
> -
> -#define JS_BITS_PER_BYTE_LOG2 =C2=A0 3L
> -#define JS_BITS_PER_SHORT_LOG2 =C2=A04L
> -#define JS_BITS_PER_INT_LOG2 =C2=A0 =C2=A05L
> -#define JS_BITS_PER_INT64_LOG2 =C2=A06L
> -#define JS_BITS_PER_LONG_LOG2 =C2=A0 5L
> -#define JS_BITS_PER_FLOAT_LOG2 =C2=A05L
> -#define JS_BITS_PER_DOUBLE_LOG2 6L
> -#define JS_BITS_PER_WORD_LOG2 =C2=A0 5L
> -
> -#define JS_ALIGN_OF_SHORT =C2=A0 2L
> -#define JS_ALIGN_OF_INT =C2=A0 =C2=A0 4L
> -#define JS_ALIGN_OF_LONG =C2=A0 =C2=A04L
> -#define JS_ALIGN_OF_INT64 =C2=A0 8L
> -#define JS_ALIGN_OF_FLOAT =C2=A0 4L
> -#define JS_ALIGN_OF_DOUBLE =C2=A08L
> -#define JS_ALIGN_OF_POINTER 4L
> -#define JS_ALIGN_OF_WORD =C2=A0 =C2=A04L
> -
> -#define JS_BYTES_PER_WORD_LOG2 =C2=A0 2L
> -#define JS_BYTES_PER_DWORD_LOG2 =C2=A03L
> -#define JS_WORDS_PER_DWORD_LOG2 =C2=A01L
> -
> -#define JS_STACK_GROWTH_DIRECTION (-1)
> -
> -#endif /* js_cpucfg___ */
> diff --git a/recipes/swfdec/swfdec/fix-cross-build.patch b/recipes/swfdec=
/swfdec/fix-cross-build.patch
> deleted file mode 100644
> index d83e66a..0000000
> --- a/recipes/swfdec/swfdec/fix-cross-build.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> ---- /tmp/Makefile.am =C2=A0 2006-12-29 18:42:25.000000000 +0100
> -+++ swfdec-0.4.0/libswfdec/js/Makefile.am =C2=A0 =C2=A0 =C2=A02006-12-29=
 18:42:47.522227000 +0100
> -@@ -93,11 +93,4 @@
> - =C2=A0 =C2=A0 =C2=A0 -DXP_UNIX -DDEBUG -fno-strict-aliasing
> - libjs_la_LDFLAGS =3D -lm
> -
> --CLEANFILES =3D jsautocfg.h
> --
> --jsapi.c: jsautocfg.h
> --
> --jsautocfg.h: jscpucfg
> -- =C2=A0 =C2=A0 =C2=A0./jscpucfg >jsautocfg.h
> --
> -
> diff --git a/recipes/swfdec/swfdec_0.4.0.bb b/recipes/swfdec/swfdec_0.4.0=
.bb
> deleted file mode 100644
> index 570ac57..0000000
> --- a/recipes/swfdec/swfdec_0.4.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anima=
tions."
> -LICENSE =3D "LGPL"
> -
> -DEPENDS =3D "pango cairo liboil zlib gtk+ alsa-lib \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_conditional('ENTERPRISE_DIST=
RO', '1', '', 'libmad', d)}"
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.4/${P}.tar.=
gz \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://jsautocfg.h \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-cross-build.patch"
> -
> -inherit autotools pkgconfig lib_package
> -
> -do_configure_append() {
> - =C2=A0 =C2=A0 =C2=A0 cp -f ${WORKDIR}/jsautocfg.h ${S}/libswfdec/js
> -}
> -
> -
> -SRC_URI[md5sum] =3D "157d31c9dc02aa22b5f27323e5a203fc"
> -SRC_URI[sha256sum] =3D "c31d3bbee984c7971d2b24cddc279d8ad65edff8216778d6=
17484c147ba3ae3d"
> diff --git a/recipes/swfdec/swfdec_0.7.2.bb b/recipes/swfdec/swfdec_0.7.2=
.bb
> deleted file mode 100644
> index 3fcfa2f..0000000
> --- a/recipes/swfdec/swfdec_0.7.2.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anima=
tions."
> -LICENSE =3D "LGPL"
> -
> -DEPENDS =3D "gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib=
 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_conditional('ENTERPRISE_DIST=
RO', '1', '', 'libmad', d)}"
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar.=
gz \
> -"
> -
> -inherit autotools pkgconfig
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${bindir}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${b=
indir}
> -}
> -
> -PACKAGES =3D+ "libswfdecgtk libswfdec"
> -
> -FILES_${PN} +=3D "${datadir}/icons"
> -FILES_libswfdec =3D "${libdir}/libswfdec-0.7.so.*"
> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.7.so*"
> -
> -
> -
> -SRC_URI[md5sum] =3D "7624b5642c947fb054273f091a1d970c"
> -SRC_URI[sha256sum] =3D "c6b2ee967ae04776fd60a47dc283570917e387dbcffc907a=
0dfc91f567c139f7"
> diff --git a/recipes/swfdec/swfdec_0.7.4.bb b/recipes/swfdec/swfdec_0.7.4=
.bb
> deleted file mode 100644
> index 874bb11..0000000
> --- a/recipes/swfdec/swfdec_0.7.4.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anima=
tions."
> -LICENSE =3D "LGPL"
> -
> -DEPENDS =3D "gstreamer libsoup-2.4 pango cairo liboil zlib libmad gtk+ a=
lsa-lib"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar.=
gz \
> -"
> -
> -inherit autotools pkgconfig
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${bindir}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${b=
indir}
> -}
> -
> -PACKAGES =3D+ "libswfdecgtk libswfdec"
> -
> -FILES_${PN} +=3D "${datadir}/icons"
> -FILES_libswfdec =3D "${libdir}/libswfdec-0.7.so.*"
> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.7.so*"
> -
> -
> -
> -SRC_URI[md5sum] =3D "08fcda4a46454bfc66b97fba2d385f8c"
> -SRC_URI[sha256sum] =3D "4345da2a4790125bd7205bd10a3326bf94e36f97229850b9=
9ec9e8f050a9ab4a"
> diff --git a/recipes/swfdec/swfdec_0.8.2.bb b/recipes/swfdec/swfdec_0.8.2=
.bb
> deleted file mode 100644
> index 9c65dba..0000000
> --- a/recipes/swfdec/swfdec_0.8.2.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anima=
tions."
> -LICENSE =3D "LGPL"
> -
> -DEPENDS =3D "gstreamer gst-plugins-base libsoup-2.4 pango cairo liboil z=
lib gtk+ alsa-lib"
> -
> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.8/${P}.tar.=
gz \
> -"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF =3D "--disable-static"
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${bindir}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${b=
indir}
> -}
> -
> -PACKAGES =3D+ "libswfdecgtk libswfdec"
> -FILES_libswfdec =3D "${libdir}/libswfdec-0.8.so.*"
> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.8.so.*"
> -
> -SRC_URI[md5sum] =3D "2fb20b04c0e426a1e894a4c4bf22cf87"
> -SRC_URI[sha256sum] =3D "10fd6f07264d3fbd92c03858a99637cd4b9d98ab00fb4d31=
720adce0c1ed7af4"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


