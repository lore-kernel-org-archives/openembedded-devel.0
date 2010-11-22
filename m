Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKQK2-0002tL-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:56:20 +0100
Received: by iwn38 with SMTP id 38so2899381iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qlKzrMfmEAX0OCxYfnodJiYnj/Mhz13jscpAbfVruiA=;
	b=q7LN+gjiqSGeCO9goQ18HpuJHmgWYijLAYFyff3BeZe4YaWjKfSYANhP3xL6ON80gH
	WutLdWl4YFGNq6duMjSgOFza8mdYZI6w+AKMv5JEEdDGGmGumKa0VngvMJY0MViWZ2gR
	4kVx4FYlP+EsPm/nYbAMJsj+mC6Y+AYoPqk5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BRmLRTgOnF/DnwxAA9o34QBBFX70TAVT4m7U2b6BwM58wW6UH4hhnBpFEZ0malD1jF
	1j9ZvUqSZWbt2WLNSKKkCoGG2xMJ8IiHTgO19ZGzI1+jc1Y8TgwCT7KV4MJ5DmNlVEGb
	wKLr2DS+XgLREnY2bqXCIK4/uZ+nwwP2U5NT8=
MIME-Version: 1.0
Received: by 10.231.15.136 with SMTP id k8mr6483679iba.51.1290408904413; Sun,
	21 Nov 2010 22:55:04 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sun, 21 Nov 2010 22:55:04 -0800 (PST)
In-Reply-To: <AANLkTimfa1paBBCP4+1rgkmn+Z60oQHm_nHxrHVhug=G@mail.gmail.com>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
	<1290383951-6683-3-git-send-email-obi@opendreambox.org>
	<AANLkTimfa1paBBCP4+1rgkmn+Z60oQHm_nHxrHVhug=G@mail.gmail.com>
Date: Mon, 22 Nov 2010 07:55:04 +0100
Message-ID: <AANLkTikOsFSGGG_Arnj_g7TQ_2fsEOKM_3qPopQNXa9U@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Mon, 22 Nov 2010 06:56:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/22 Khem Raj <raj.khem@gmail.com>:
> On Sun, Nov 21, 2010 at 3:59 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/swfdec/swfdec-mozilla_0.7.2.bb =A0 =A0 =A0| =A0 21 ----------=
-
>> =A0recipes/swfdec/swfdec-mozilla_0.7.4.bb =A0 =A0 =A0| =A0 21 ----------=
-
>> =A0recipes/swfdec/swfdec-mozilla_0.8.2.bb =A0 =A0 =A0| =A0 24 ----------=
--
>> =A0recipes/swfdec/swfdec/arm/jsautocfg.h =A0 =A0 =A0 | =A0 52 ----------=
-----------------
>> =A0recipes/swfdec/swfdec/fix-cross-build.patch | =A0 14 -------
>> =A0recipes/swfdec/swfdec_0.4.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 20 --=
--------
>> =A0recipes/swfdec/swfdec_0.7.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 27 --=
------------
>> =A0recipes/swfdec/swfdec_0.7.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 25 --=
-----------
>> =A0recipes/swfdec/swfdec_0.8.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 23 --=
----------
>> =A09 files changed, 0 insertions(+), 227 deletions(-)
>> =A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.2.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.4.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec-mozilla_0.8.2.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec/arm/jsautocfg.h
>> =A0delete mode 100644 recipes/swfdec/swfdec/fix-cross-build.patch
>> =A0delete mode 100644 recipes/swfdec/swfdec_0.4.0.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec_0.7.2.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec_0.7.4.bb
>> =A0delete mode 100644 recipes/swfdec/swfdec_0.8.2.bb
>>
>> diff --git a/recipes/swfdec/swfdec-mozilla_0.7.2.bb b/recipes/swfdec/swf=
dec-mozilla_0.7.2.bb
>> deleted file mode 100644
>> index 0f453aa..0000000
>> --- a/recipes/swfdec/swfdec-mozilla_0.7.2.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a de=
coder/renderer for Macromedia Flash animations."
>> -LICENSE =3D "LGPL"
>> -
>> -PR =3D "r3"
>> -
>> -DEPENDS =3D "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil=
 zlib gtk+ alsa-lib \
>> - =A0 =A0 =A0 =A0 =A0 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', =
'libmad', d)}"
>> -RDEPENDS_${PN} =3D "gst-ffmpeg"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/=
${P}.tar.gz \
>> -"
>> -
>> -inherit autotools pkgconfig
>> -
>> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
>> -FILES_${PN}-dev +=3D "${libdir}/mozilla/plugins/*a"
>> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
>> -
>> -
>> -SRC_URI[md5sum] =3D "3bc6a49357b4b8b478ce3dfb4f007f18"
>> -SRC_URI[sha256sum] =3D "84962251e647fdcdcf111bef0c478f7d3679ae104267ba7=
2e59ad749c6955cc2"
>> diff --git a/recipes/swfdec/swfdec-mozilla_0.7.4.bb b/recipes/swfdec/swf=
dec-mozilla_0.7.4.bb
>> deleted file mode 100644
>> index 4eb3ebb..0000000
>> --- a/recipes/swfdec/swfdec-mozilla_0.7.4.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a de=
coder/renderer for Macromedia Flash animations."
>> -LICENSE =3D "LGPL"
>> -
>> -PR =3D "r2"
>> -
>> -DEPENDS =3D "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil=
 zlib gtk+ alsa-lib \
>> - =A0 =A0 =A0 =A0 =A0 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', =
'libmad', d)}"
>> -RDEPENDS_${PN} =3D "gst-ffmpeg"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/=
${P}.tar.gz \
>> -"
>> -
>> -inherit autotools pkgconfig
>> -
>> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
>> -FILES_${PN}-dev +=3D "${libdir}/mozilla/plugins/*a"
>> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
>> -
>> -
>> -SRC_URI[md5sum] =3D "c5958f3b003190b21977495021ac2b28"
>> -SRC_URI[sha256sum] =3D "0d7927f2e791321b2867c120eb4140d9017c59b77925eb9=
09b2a03f3ef2a8fe4"
>> diff --git a/recipes/swfdec/swfdec-mozilla_0.8.2.bb b/recipes/swfdec/swf=
dec-mozilla_0.8.2.bb
>> deleted file mode 100644
>> index 5710b93..0000000
>> --- a/recipes/swfdec/swfdec-mozilla_0.8.2.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -DESCRIPTION =3D "Swfdec plugin for browsers using NPAPI. Swfdec is a de=
coder/renderer for Macromedia Flash animations."
>> -LICENSE =3D "LGPL"
>> -
>> -DEPENDS =3D "swfdec glib-2.0"
>> -RDEPENDS_${PN} =3D "gst-ffmpeg"
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.8/=
${P}.tar.gz \
>> -"
>> -
>> -inherit autotools pkgconfig gtk-icon-cache
>> -
>> -EXTRA_OECONF =3D "--disable-static"
>> -
>> -do_install_append() {
>> - =A0 =A0 =A0 rm ${D}${libdir}/mozilla/plugins/*.la
>> -}
>> -
>> -FILES_${PN} +=3D "${libdir}/mozilla/plugins/*.so"
>> -FILES_${PN}-dbg +=3D "${libdir}/mozilla/plugins/.debug"
>> -
>> -
>> -SRC_URI[md5sum] =3D "716632e0d35b3c1582c180569ba30346"
>> -SRC_URI[sha256sum] =3D "49fd905f41b67832e7b2cfa2cf664657ab08f8fef4a2324=
e74202fc951396cd5"
>> diff --git a/recipes/swfdec/swfdec/arm/jsautocfg.h b/recipes/swfdec/swfd=
ec/arm/jsautocfg.h
>> deleted file mode 100644
>> index 7e8171f..0000000
>> --- a/recipes/swfdec/swfdec/arm/jsautocfg.h
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -#ifndef js_cpucfg___
>> -#define js_cpucfg___
>> -
>> -/* AUTOMATICALLY GENERATED - DO NOT EDIT */
>> -
>> -#define IS_LITTLE_ENDIAN 1
>> -#undef =A0IS_BIG_ENDIAN
>> -
>> -#define JS_BYTES_PER_BYTE =A0 1L
>> -#define JS_BYTES_PER_SHORT =A02L
>> -#define JS_BYTES_PER_INT =A0 =A04L
>> -#define JS_BYTES_PER_INT64 =A08L
>> -#define JS_BYTES_PER_LONG =A0 4L
>> -#define JS_BYTES_PER_FLOAT =A04L
>> -#define JS_BYTES_PER_DOUBLE 8L
>> -#define JS_BYTES_PER_WORD =A0 4L
>> -#define JS_BYTES_PER_DWORD =A08L
>> -
>> -#define JS_BITS_PER_BYTE =A0 =A08L
>> -#define JS_BITS_PER_SHORT =A0 16L
>> -#define JS_BITS_PER_INT =A0 =A0 32L
>> -#define JS_BITS_PER_INT64 =A0 64L
>> -#define JS_BITS_PER_LONG =A0 =A032L
>> -#define JS_BITS_PER_FLOAT =A0 32L
>> -#define JS_BITS_PER_DOUBLE =A064L
>> -#define JS_BITS_PER_WORD =A0 =A032L
>> -
>> -#define JS_BITS_PER_BYTE_LOG2 =A0 3L
>> -#define JS_BITS_PER_SHORT_LOG2 =A04L
>> -#define JS_BITS_PER_INT_LOG2 =A0 =A05L
>> -#define JS_BITS_PER_INT64_LOG2 =A06L
>> -#define JS_BITS_PER_LONG_LOG2 =A0 5L
>> -#define JS_BITS_PER_FLOAT_LOG2 =A05L
>> -#define JS_BITS_PER_DOUBLE_LOG2 6L
>> -#define JS_BITS_PER_WORD_LOG2 =A0 5L
>> -
>> -#define JS_ALIGN_OF_SHORT =A0 2L
>> -#define JS_ALIGN_OF_INT =A0 =A0 4L
>> -#define JS_ALIGN_OF_LONG =A0 =A04L
>> -#define JS_ALIGN_OF_INT64 =A0 8L
>> -#define JS_ALIGN_OF_FLOAT =A0 4L
>> -#define JS_ALIGN_OF_DOUBLE =A08L
>> -#define JS_ALIGN_OF_POINTER 4L
>> -#define JS_ALIGN_OF_WORD =A0 =A04L
>> -
>> -#define JS_BYTES_PER_WORD_LOG2 =A0 2L
>> -#define JS_BYTES_PER_DWORD_LOG2 =A03L
>> -#define JS_WORDS_PER_DWORD_LOG2 =A01L
>> -
>> -#define JS_STACK_GROWTH_DIRECTION (-1)
>> -
>> -#endif /* js_cpucfg___ */
>> diff --git a/recipes/swfdec/swfdec/fix-cross-build.patch b/recipes/swfde=
c/swfdec/fix-cross-build.patch
>> deleted file mode 100644
>> index d83e66a..0000000
>> --- a/recipes/swfdec/swfdec/fix-cross-build.patch
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> ---- /tmp/Makefile.am =A0 2006-12-29 18:42:25.000000000 +0100
>> -+++ swfdec-0.4.0/libswfdec/js/Makefile.am =A0 =A0 =A02006-12-29 18:42:4=
7.522227000 +0100
>> -@@ -93,11 +93,4 @@
>> - =A0 =A0 =A0 -DXP_UNIX -DDEBUG -fno-strict-aliasing
>> - libjs_la_LDFLAGS =3D -lm
>> -
>> --CLEANFILES =3D jsautocfg.h
>> --
>> --jsapi.c: jsautocfg.h
>> --
>> --jsautocfg.h: jscpucfg
>> -- =A0 =A0 =A0./jscpucfg >jsautocfg.h
>> --
>> -
>> diff --git a/recipes/swfdec/swfdec_0.4.0.bb b/recipes/swfdec/swfdec_0.4.=
0.bb
>> deleted file mode 100644
>> index 570ac57..0000000
>> --- a/recipes/swfdec/swfdec_0.4.0.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anim=
ations."
>> -LICENSE =3D "LGPL"
>> -
>> -DEPENDS =3D "pango cairo liboil zlib gtk+ alsa-lib \
>> - =A0 =A0 =A0 =A0 =A0 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', =
'libmad', d)}"
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.4/${P}.tar=
.gz \
>> - =A0 =A0 =A0 =A0 =A0 file://jsautocfg.h \
>> - =A0 =A0 =A0 =A0 =A0file://fix-cross-build.patch"
>> -
>> -inherit autotools pkgconfig lib_package
>> -
>> -do_configure_append() {
>> - =A0 =A0 =A0 cp -f ${WORKDIR}/jsautocfg.h ${S}/libswfdec/js
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "157d31c9dc02aa22b5f27323e5a203fc"
>> -SRC_URI[sha256sum] =3D "c31d3bbee984c7971d2b24cddc279d8ad65edff8216778d=
617484c147ba3ae3d"
>> diff --git a/recipes/swfdec/swfdec_0.7.2.bb b/recipes/swfdec/swfdec_0.7.=
2.bb
>> deleted file mode 100644
>> index 3fcfa2f..0000000
>> --- a/recipes/swfdec/swfdec_0.7.2.bb
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anim=
ations."
>> -LICENSE =3D "LGPL"
>> -
>> -DEPENDS =3D "gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-li=
b \
>> - =A0 =A0 =A0 =A0 =A0 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', =
'libmad', d)}"
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar=
.gz \
>> -"
>> -
>> -inherit autotools pkgconfig
>> -
>> -do_install_append() {
>> - =A0 =A0 =A0 install -d ${D}/${bindir}
>> - =A0 =A0 =A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
>> -}
>> -
>> -PACKAGES =3D+ "libswfdecgtk libswfdec"
>> -
>> -FILES_${PN} +=3D "${datadir}/icons"
>> -FILES_libswfdec =3D "${libdir}/libswfdec-0.7.so.*"
>> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.7.so*"
>> -
>> -
>> -
>> -SRC_URI[md5sum] =3D "7624b5642c947fb054273f091a1d970c"
>> -SRC_URI[sha256sum] =3D "c6b2ee967ae04776fd60a47dc283570917e387dbcffc907=
a0dfc91f567c139f7"
>> diff --git a/recipes/swfdec/swfdec_0.7.4.bb b/recipes/swfdec/swfdec_0.7.=
4.bb
>> deleted file mode 100644
>> index 874bb11..0000000
>> --- a/recipes/swfdec/swfdec_0.7.4.bb
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anim=
ations."
>> -LICENSE =3D "LGPL"
>> -
>> -DEPENDS =3D "gstreamer libsoup-2.4 pango cairo liboil zlib libmad gtk+ =
alsa-lib"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar=
.gz \
>> -"
>> -
>> -inherit autotools pkgconfig
>> -
>> -do_install_append() {
>> - =A0 =A0 =A0 install -d ${D}/${bindir}
>> - =A0 =A0 =A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
>> -}
>> -
>> -PACKAGES =3D+ "libswfdecgtk libswfdec"
>> -
>> -FILES_${PN} +=3D "${datadir}/icons"
>> -FILES_libswfdec =3D "${libdir}/libswfdec-0.7.so.*"
>> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.7.so*"
>> -
>> -
>> -
>> -SRC_URI[md5sum] =3D "08fcda4a46454bfc66b97fba2d385f8c"
>> -SRC_URI[sha256sum] =3D "4345da2a4790125bd7205bd10a3326bf94e36f97229850b=
99ec9e8f050a9ab4a"
>> diff --git a/recipes/swfdec/swfdec_0.8.2.bb b/recipes/swfdec/swfdec_0.8.=
2.bb
>> deleted file mode 100644
>> index 9c65dba..0000000
>> --- a/recipes/swfdec/swfdec_0.8.2.bb
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -DESCRIPTION =3D "Swfdec is a decoder/renderer for Macromedia Flash anim=
ations."
>> -LICENSE =3D "LGPL"
>> -
>> -DEPENDS =3D "gstreamer gst-plugins-base libsoup-2.4 pango cairo liboil =
zlib gtk+ alsa-lib"
>> -
>> -SRC_URI =3D "http://swfdec.freedesktop.org/download/swfdec/0.8/${P}.tar=
.gz \
>> -"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--disable-static"
>> -
>> -do_install_append() {
>> - =A0 =A0 =A0 install -d ${D}/${bindir}
>> - =A0 =A0 =A0 install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
>> -}
>> -
>> -PACKAGES =3D+ "libswfdecgtk libswfdec"
>> -FILES_libswfdec =3D "${libdir}/libswfdec-0.8.so.*"
>> -FILES_libswfdecgtk =3D "${libdir}/libswfdec-gtk-0.8.so.*"
>> -
>> -SRC_URI[md5sum] =3D "2fb20b04c0e426a1e894a4c4bf22cf87"
>> -SRC_URI[sha256sum] =3D "10fd6f07264d3fbd92c03858a99637cd4b9d98ab00fb4d3=
1720adce0c1ed7af4"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


