Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id ECE1E77E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:01:22 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id l24so15785039uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y6DPuGawluUB5kTWxYSRgi85HUeB3ZnIAYUUTg/k4FU=;
	b=LR/xCbLwaaO/v5hGBOoRxzU1l1+y2pbaYPNN95tCFjT5oEOZykGIOZMpySDmQ/Q6G0
	uhIIKrxMl+CP1Ho1kVgW2TOzkr3A4siNJMINrjIrAP3Ll48SMTlrUDPfYbKTMfWnugVG
	VUOWHHOhvAiZueUWqjOp9jpeoEbJKH+nyikeGbzTEC8Ay46mCRh4DvhXxng29aipT1Wg
	IS4YZdf+qrHErnFgV+Stevzd6Bvei3Stj/T04LGDx1XroEAckv6KzlFtECz1s+TK2Kil
	etDcH3C0Rrpyorp4+qAMfyeb2ya6ybStvGTSViZ2Rti7nQhbYFbN0OtSCal0VwPUPsSg
	vRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y6DPuGawluUB5kTWxYSRgi85HUeB3ZnIAYUUTg/k4FU=;
	b=W17bH/ztRu7xZJm+YrWON9JsDRgYwaBXmHPYz5eMkiMlPKjjfpR4nQ/QJcpr/8YCgY
	JajhP977CGSPZnSnwuR23m9AE64hSAYWW1BhswWOxAQzlCGVvQPwmD63d31ylW1QCoj2
	OPp+WRF4Qf/wH/yr/jpW92+0wzt8OLU1APmp5H0R0gTvZsmw9jjRC5QC/9PB082Qkptq
	hhzTl0E3YwRXOvQxpl+ERBinLav2vAT2W8VGRxA2RqI8fu52IKFIcUUi41mVzky9AEPJ
	zQjOxgWIa9qvS1zgO4CkoUSUHDgU7TCFOOmOGhiKyvKTdAaZ3lB+uLE8WppodAdGcrBI
	ymxQ==
X-Gm-Message-State: AHPjjUjsaAsVvzDnBkaHL9iJ724dTpmr5CwMzm9TbKXwZw/LucXzpWxO
	AdlQcs5SVYTsY36EQkByrLdX1NuPrw==
X-Google-Smtp-Source: ADKCNb5HdCHN3vYGroyHY58n0L3A3q3psESXQbGxaYEcN6KbO7MzNA5arUbvUAwtcgr/oUZnCo/EfrAUHTcA69fPEjY=
X-Received: by 10.176.4.65 with SMTP id 59mr197194uav.195.1504728082075; Wed,
	06 Sep 2017 13:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 13:01:21 -0700 (PDT)
In-Reply-To: <1504725809-12825-32-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-32-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 22:01:21 +0200
Message-ID: <CALbNGRQFLdHDvhc0-BnmM8wVAwfxvmE0xC0qK-JzPrJiYLYvPw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 31/31] gstreamer-0.10: Remove as all users are gone and it is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 20:01:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../gst-ffmpeg-0.10.13/lower-rank.diff             |  16 -
>  .../gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb      |  14 -
>  .../gst-fluendo-mpegdemux_0.10.85.bb               |  12 -
>  .../gstreamer-0.10/gst-fluendo.inc                 |  14 -
>  .../gstreamer-0.10/gst-meta-base_0.10.bb           |  73 ---
>  .../gstreamer-0.10/gst-openmax/gcc_4.6.patch       |  18 -
>  .../gstreamer-0.10/gst-openmax/ptr-array.patch     |  46 --
>  .../gstreamer-0.10/gst-openmax_0.10.1.bb           |  35 --
>  .../gst-plugins-bad/buffer-overflow-mp4.patch      |  36 --
>  .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb      |  61 ---
>  ...l.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
>  ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |  37 --
>  .../configure.ac-fix-subparse-plugin.patch         |  27 --
>  .../gst-plugins-base-tremor.patch                  |  20 -
>  .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |  44 --
>  ...-conditional-gl-framebuffer-undefined-use.patch |  35 --
>  .../gst-plugins-gl/rpi-egl-gles2-dep.patch         |  22 -
>  .../gstreamer-0.10/gst-plugins-gl_0.10.3.bb        |  29 --
>  ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |  33 --
>  ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |  45 --
>  .../0407-mulawdec-fix-integer-overrun.patch        |  47 --
>  .../gstreamer-0.10/gst-plugins-good_0.10.31.bb     |  47 --
>  ...sate-for-libcdio-s-recent-cd-text-api-cha.patch | 193 --------
>  .../0002-Fix-opencore-include-paths.patch          |  58 ---
>  .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |  35 --
>  .../gstreamer-0.10/gst-plugins.inc                 |  29 --
>  ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |  34 --
>  .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |  18 -
>  ...ix-self-comparison-always-evaluates-to-tr.patch |  32 --
>  ...01-parse-make-grammar.y-work-with-Bison-3.patch |  35 --
>  ...2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
>  .../gstreamer-0.10.36/check_fix.patch              |  19 -
>  .../gst-inspect-check-error.patch                  |  16 -
>  .../gstreamer-0.10.36/gstregistrybinary.c          | 487 ---------------=
------
>  .../gstreamer-0.10.36/gstregistrybinary.h          | 194 --------
>  .../gstreamer-0.10/gstreamer_0.10.36.bb            |  53 ---
>  36 files changed, 1978 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-ffmpeg-0.10.13/lower-rank.diff
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-fluendo-mp3_0.10.31.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-fluendo-mpegdemux_0.10.85.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-fluendo.inc
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-meta-base_0.10.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-openmax/gcc_4.6.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-openmax/ptr-array.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-openmax_0.10.1.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-bad/buffer-overflow-mp4.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-bad_0.10.23.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.=
patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.=
patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-base-0.10.36/gst-plugins-base-tremor.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-base_0.10.36.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-gl/rpi-egl-gles2-dep.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-gl_0.10.3.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buff=
er-i.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_=
VCEN.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-good_0.10.31.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.pat=
ch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-ugly/0002-Fix-opencore-include-paths.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins-ugly_0.10.19.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-plugins.inc
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
-rtsp_0.10.8.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.pa=
tch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/check_fix.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/gst-inspect-check-error.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/gstregistrybinary.c
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/gstregistrybinary.h
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer_0.10.36.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg=
-0.10.13/lower-rank.diff b/meta-multimedia/recipes-multimedia/gstreamer-0.1=
0/gst-ffmpeg-0.10.13/lower-rank.diff
> deleted file mode 100644
> index 5f08afe..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.1=
3/lower-rank.diff
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Lower the rank of ffmpeg plugin so codecs that hook into accelerated pie=
ces (e.g. dsp or hw engines) can get picked over this
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> ---- /tmp/gstffmpegdec.c        2009-03-05 09:31:15.000000000 +0100
> -+++ gst-ffmpeg-0.10.6/ext/ffmpeg/gstffmpegdec.c        2009-03-05 09:33:=
09.000000000 +0100
> -@@ -2588,7 +2588,7 @@
> -       case CODEC_ID_MSMPEG4V3:
> -       case CODEC_ID_H264:
> -       case CODEC_ID_COOK:
> --        rank =3D GST_RANK_PRIMARY;
> -+        rank =3D GST_RANK_SECONDARY;
> -         break;
> -       case CODEC_ID_DVVIDEO:
> -         /* we have a good dv decoder, fast on both ppc as well as x86. =
they say
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluend=
o-mp3_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fl=
uendo-mp3_0.10.31.bb
> deleted file mode 100644
> index 1e2cd2a..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0=
.10.31.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require gst-fluendo.inc
> -
> -SUMMARY =3D "Fluendo closed-format mp3 GStreamer plug-in"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D259a43dd1c9854b71fc396f74699f=
4d2"
> -LICENSE_FLAGS =3D "commercial"
> -
> -GSTREAMER_DEBUG ?=3D "--disable-debug"
> -EXTRA_OECONF +=3D "${GSTREAMER_DEBUG} --with-gstreamer-api=3D0.10"
> -
> -acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> -
> -SRC_URI[md5sum] =3D "adf0390f3416bb72f91c358528be0c38"
> -SRC_URI[sha256sum] =3D "dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7d=
e4ca6393f7d55c7d"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluend=
o-mpegdemux_0.10.85.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/=
gst-fluendo-mpegdemux_0.10.85.bb
> deleted file mode 100644
> index 7bba41a..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegd=
emux_0.10.85.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require gst-fluendo.inc
> -
> -SUMMARY =3D "Fluendo MPEG Transport Stream and Program Stream demuxer fo=
r GStreamer"
> -LICENSE =3D "MPLv1.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbe282f1c3cc9a98cc0dc5c2b25dfc=
510 \
> -                    file://src/gstmpegdemux.h;beginline=3D1;endline=3D19=
;md5=3Da9e90033f59897b91664d9f2a2ff01dd"
> -LICENSE_FLAGS =3D "commercial"
> -
> -acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> -
> -SRC_URI[md5sum] =3D "7c4fb993f80b9ae631b11897733f0970"
> -SRC_URI[sha256sum] =3D "df04c91cc8e5d9a892c2492ed989974b4547beaa2a364764=
9e85113317897424"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluend=
o.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
> deleted file mode 100644
> index 7a77d62..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "Fluendo closed-format GStreamer plug-in"
> -SECTION =3D "multimedia"
> -HOMEPAGE =3D "https://core.fluendo.com/gstreamer/trac/wiki"
> -DEPENDS =3D "gstreamer gst-plugins-base zlib"
> -
> -inherit autotools pkgconfig
> -
> -SRC_URI =3D "http://core.fluendo.com/gstreamer/src/${BPN}/${BPN}-${PV}.t=
ar.bz2"
> -
> -FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
> -FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-=
0.10/*.a"
> -
> -EXTRA_OECONF =3D "--disable-valgrind"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-b=
ase_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-ba=
se_0.10.bb
> deleted file mode 100644
> index 039abe1..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.1=
0.bb
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -SUMMARY =3D "GStreamer package groups"
> -LICENSE =3D "MIT"
> -
> -COMMERCIAL_PLUGINS =3D "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_P=
LUGINS}"
> -DEPENDS_UGLY=3D"${@'gst-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.sp=
lit('-') else ''}"
> -DEPENDS_BAD=3D"${@'gst-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split=
('-') else ''}"
> -DEPENDS =3D "gstreamer gst-plugins-base gst-plugins-good ${DEPENDS_UGLY}=
 ${DEPENDS_BAD}"
> -
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690 \
> -                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
> -
> -
> -PR =3D "r13"
> -
> -PACKAGES =3D "\
> -    gst-meta-base \
> -    gst-meta-x11-base \
> -    gst-meta-audio \
> -    gst-meta-debug \
> -    gst-meta-video"
> -
> -ALLOW_EMPTY_gst-meta-base =3D "1"
> -ALLOW_EMPTY_gst-meta-x11-base =3D "1"
> -ALLOW_EMPTY_gst-meta-audio =3D "1"
> -ALLOW_EMPTY_gst-meta-debug =3D "1"
> -ALLOW_EMPTY_gst-meta-video =3D "1"
> -
> -RDEPENDS_gst-meta-base =3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', =
'', d)} \
> -    gstreamer \
> -    gst-plugins-base-playbin \
> -    gst-plugins-base-decodebin \
> -    gst-plugins-base-decodebin2 \
> -    gst-plugins-base-gio \
> -    gst-plugins-base-alsa \
> -    gst-plugins-base-volume \
> -    gst-plugins-base-audioconvert \
> -    gst-plugins-base-audioresample \
> -    gst-plugins-base-typefindfunctions \
> -    gst-plugins-base-videoscale \
> -    gst-plugins-base-ffmpegcolorspace \
> -    gst-plugins-good-autodetect \
> -    gst-plugins-good-souphttpsrc"
> -
> -RRECOMMENDS_gst-meta-x11-base =3D "\
> -    gst-plugins-base-ximagesink \
> -    gst-plugins-base-xvimagesink"
> -
> -RDEPENDS_gst-meta-audio =3D "\
> -    gst-meta-base \
> -    gst-plugins-base-vorbis \
> -    gst-plugins-base-ogg \
> -    gst-plugins-good-wavparse \
> -    gst-plugins-good-flac \
> -    ${COMMERCIAL_AUDIO_PLUGINS}"
> -
> -
> -RDEPENDS_gst-meta-debug =3D "\
> -    gst-meta-base \
> -    gst-plugins-good-debug \
> -    gst-plugins-base-audiotestsrc \
> -    gst-plugins-base-videotestsrc"
> -
> -
> -RDEPENDS_gst-meta-video =3D "\
> -    gst-meta-base \
> -    gst-plugins-good-avi \
> -    gst-plugins-good-matroska \
> -    gst-plugins-base-theora \
> -    ${COMMERCIAL_VIDEO_PLUGINS}"
> -
> -RRECOMMENDS_gst-meta-video =3D "\
> -    gst-meta-audio"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openma=
x/gcc_4.6.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ope=
nmax/gcc_4.6.patch
> deleted file mode 100644
> index 57a63b5..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4=
.6.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Pending
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: gst-openmax-0.10.1/omx/gstomx.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gst-openmax-0.10.1.orig/omx/gstomx.c       2010-09-30 18:00:24.00000=
0000 -0700
> -+++ gst-openmax-0.10.1/omx/gstomx.c    2011-05-17 23:08:08.794535872 -07=
00
> -@@ -238,7 +238,8 @@
> -     const gchar *element_name =3D gst_structure_nth_field_name (element=
_table, i);
> -     GstStructure *element =3D get_element_entry (element_name);
> -     const gchar *type_name, *parent_type_name;
> --    const gchar *component_name, *component_role, *library_name;
> -+    const gchar *component_name, *library_name;
> -+    const gchar __attribute__((__unused__)) *component_role;
> -     GType type;
> -     gint rank;
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openma=
x/ptr-array.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-o=
penmax/ptr-array.patch
> deleted file mode 100644
> index 5965bba..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-a=
rray.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Rename static functions that use GLib naming conventions as one of them
> -(g_ptr_array_insert) has now been added to GLib.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/omx/gstomx_util.c b/omx/gstomx_util.c
> -index 423e441..579dbf5 100644
> ---- a/omx/gstomx_util.c
> -+++ b/omx/gstomx_util.c
> -@@ -85,7 +85,7 @@ static gboolean initialized;
> -  */
> -
> - static void
> --g_ptr_array_clear (GPtrArray * array)
> -+omx_g_ptr_array_clear (GPtrArray * array)
> - {
> -   guint index;
> -   for (index =3D 0; index < array->len; index++)
> -@@ -93,7 +93,7 @@ g_ptr_array_clear (GPtrArray * array)
> - }
> -
> - static void
> --g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
> -+omx_g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
> - {
> -   if (index + 1 > array->len) {
> -     g_ptr_array_set_size (array, index + 1);
> -@@ -394,7 +394,7 @@ g_omx_core_unload (GOmxCore * core)
> -   }
> -
> -   core_for_each_port (core, g_omx_port_free);
> --  g_ptr_array_clear (core->ports);
> -+  omx_g_ptr_array_clear (core->ports);
> - }
> -
> - static inline GOmxPort *
> -@@ -418,7 +418,7 @@ g_omx_core_new_port (GOmxCore * core, guint index)
> -   }
> -
> -   port =3D g_omx_port_new (core, index);
> --  g_ptr_array_insert (core->ports, index, port);
> -+  omx_g_ptr_array_insert (core->ports, index, port);
> -
> -   return port;
> - }
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openma=
x_0.10.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax=
_0.10.1.bb
> deleted file mode 100644
> index 2e01579..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.=
1.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY =3D "GStreamer plug-in for communication with OpenMAX IL compone=
nts"
> -DESCRIPTION =3D "GstOpenMAX is a GStreamer plug-in that allows \
> -communication with OpenMAX Integration Layer (IL) components. OpenMAX \
> -IL is an industry standard that provides an abstraction layer for \
> -computer graphics, video, and sound routines."
> -HOMEPAGE =3D "http://freedesktop.org/wiki/GstOpenMAX"
> -DEPENDS =3D "gstreamer"
> -RDEPENDS_${PN} =3D "libomxil"
> -LICENSE =3D "LGPLv2.1"
> -LICENSE_FLAGS =3D "commercial"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24 \
> -                    file://util/sem.h;beginline=3D1;endline=3D20;md5=3Da=
ccce5550d5583b839b441a0623f09fc"
> -
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openma=
x-${PV}.tar.bz2 \
> -           file://gcc_4.6.patch \
> -           file://ptr-array.patch \
> -           "
> -
> -inherit autotools pkgconfig
> -
> -# Tell configure that this isn't a development snapshot so we don't want
> -# -Werror (hopefully fixed in 0.10.2)
> -export GST_CVS=3D"no"
> -
> -EXTRA_OECONF +=3D "--disable-valgrind"
> -
> -PR =3D "r4"
> -
> -FILES_${PN} +=3D "${libdir}/gstreamer-0.10/libgstomx.so"
> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/libgstomx.la"
> -FILES_${PN}-staticdev +=3D "${libdir}/gstreamer-0.10/libgstomx.a"
> -FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug/"
> -
> -SRC_URI[md5sum] =3D "4d0370bfe99dea20918c84347abadb4e"
> -SRC_URI[sha256sum] =3D "9074d5a0591995133d19cfb15144f19664f902c1623f9965=
95695cf2c2070e1f"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-bad/buffer-overflow-mp4.patch b/meta-multimedia/recipes-multimedia/gstrea=
mer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
> deleted file mode 100644
> index 235acda..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/b=
uffer-overflow-mp4.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Description: Fix buffer overflow in mp4 parsing
> -Author: Ralph Giles <giles@mozilla.com>
> ----
> -Backport patch from debian to fix CVE-2015-0797.
> -https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+d=
eb7u2/debian/patches/buffer-overflow-mp4.patch
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> ---- gst-plugins-bad0.10-0.10.23.orig/gst/videoparsers/gsth264parse.c
> -+++ gst-plugins-bad0.10-0.10.23/gst/videoparsers/gsth264parse.c
> -@@ -384,6 +384,11 @@ gst_h264_parse_wrap_nal (GstH264Parse *
> -
> -   GST_DEBUG_OBJECT (h264parse, "nal length %d", size);
> -
> -+  if (size > G_MAXUINT32 - nl) {
> -+    GST_ELEMENT_ERROR (h264parse, STREAM, FAILED, (NULL),
> -+        ("overflow in nal size"));
> -+    return NULL;
> -+  }
> -   buf =3D gst_buffer_new_and_alloc (size + nl + 4);
> -   if (format =3D=3D GST_H264_PARSE_FORMAT_AVC) {
> -     GST_WRITE_UINT32_BE (GST_BUFFER_DATA (buf), size << (32 - 8 * nl));
> -@@ -452,6 +457,11 @@ gst_h264_parse_process_nal (GstH264Parse
> -     GST_DEBUG_OBJECT (h264parse, "not processing nal size %u", nalu->si=
ze);
> -     return;
> -   }
> -+  if (G_UNLIKELY (nalu->size > 20 * 1024 * 1024)) {
> -+    GST_DEBUG_OBJECT (h264parse, "not processing nal size %u (too big)"=
,
> -+        nalu->size);
> -+    return;
> -+  }
> -
> -   /* we have a peek as well */
> -   nal_type =3D nalu->type;
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-pl=
ugins-bad_0.10.23.bb
> deleted file mode 100644
> index 38fccc8..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0=
.10.23.bb
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -require gst-plugins.inc
> -
> -LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> -                    file://gst/tta/filters.h;beginline=3D12;endline=3D29=
;md5=3D629b0c7a665d155a6677778f4460ec06 \
> -                    file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605 \
> -                    file://gst/tta/crc32.h;beginline=3D12;endline=3D29;m=
d5=3D71a904d99ce7ae0c1cf129891b98145c"
> -
> -DEPENDS +=3D "gst-plugins-base"
> -
> -PR =3D "r4"
> -
> -SRC_URI +=3D "file://buffer-overflow-mp4.patch"
> -
> -inherit gettext gsettings
> -
> -EXTRA_OECONF +=3D "--disable-experimental \
> -                 --disable-sdl --disable-cdaudio --disable-directfb \
> -                 --disable-vdpau --disable-apexsink"
> -
> -PACKAGECONFIG ??=3D "bzip curl \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'rsvg'=
, '', d)}"
> -
> -PACKAGECONFIG[bzip] =3D "--enable-bz2,--disable-bz2,bzip2"
> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> -PACKAGECONFIG[rsvg] =3D "--enable-rsvg,--disable-rsvg,librsvg,"
> -PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> -PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon,neon"
> -PACKAGECONFIG[mms] =3D "--enable-libmms,--disable-libmms,libmms"
> -PACKAGECONFIG[cog] =3D "--enable-cog,--disable-cog,libpng"
> -PACKAGECONFIG[faad] =3D "--enable-faad,--disable-faad,faad2"
> -PACKAGECONFIG[jp2k] =3D "--enable-jp2k,--disable-jp2k,jasper"
> -PACKAGECONFIG[modplug] =3D "--enable-modplug,--disable-modplug,libmodplu=
g"
> -PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus"
> -PACKAGECONFIG[sndfile] =3D "--enable-sndfile,--disable-sndfile,libsndfil=
e1"
> -PACKAGECONFIG[vp8] =3D "--enable-vp8,--disable-vp8,libvpx"
> -PACKAGECONFIG[ass] =3D "--enable-assrender,--disable-assrender,libass"
> -PACKAGECONFIG[openal] =3D "--enable-openal,--disable-openal,openal-soft"
> -PACKAGECONFIG[schro] =3D "--enable-schro,--disable-schro,schroedinger"
> -PACKAGECONFIG[dc1394] =3D "--enable-dc1394,--disable-dc1394,libdc1394"
> -PACKAGECONFIG[faac] =3D "--enable-faac,--disable-faac,faac"
> -PACKAGECONFIG[rtmp] =3D "--enable-rtmp,--disable-rtmp,rtmpdump"
> -PACKAGECONFIG[voamrwbenc] =3D "--enable-voamrwbenc,--disable-voamrwbenc,=
vo-amrwbenc"
> -PACKAGECONFIG[voaacenc] =3D "--enable-voaacenc,--disable-voaacenc,vo-aac=
enc"
> -PACKAGECONFIG[resindvd] =3D "--enable-resindvd,--disable-resindvd,libdvd=
nav libdvdread"
> -PACKAGECONFIG[zbar] =3D "--enable-zbar,--disable-zbar,zbar jpeg"
> -
> -ARM_INSTRUCTION_SET =3D "arm"
> -
> -PACKAGES =3D+ "${PN}-resindvd"
> -FILES_${PN}-resindvd =3D "${libdir}/gstreamer-${LIBV}/libresindvd.so"
> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/libresindvd.la"
> -FILES_${PN}-voamrwbenc +=3D "${datadir}/gstreamer-${LIBV}/presets/GstVoA=
mrwbEnc.prs"
> -
> -do_configure_prepend() {
> -    # This m4 file contains nastiness which conflicts with libtool 2.2.2
> -    rm ${S}/m4/lib-link.m4 || true
> -}
> -
> -SRC_URI[md5sum] =3D "fcb09798114461955260e4d940db5987"
> -SRC_URI[sha256sum] =3D "0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336=
e2ef9ada42e11491"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b=
/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36=
/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> deleted file mode 100644
> index 29fbec5..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-=
0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 5478eafecf618cd8e742cc1b96d688a2c7ce5a79 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Sun, 2 Oct 2016 21:49:33 +0200
> -Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -we are definitely not one of those poor souls mentioned
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - common/m4/gst-glib2.m4 | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
> -index b01f02f..4569ae5 100644
> ---- a/common/m4/gst-glib2.m4
> -+++ b/common/m4/gst-glib2.m4
> -@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
> -   fi
> -
> -   dnl for the poor souls who for example have glib in /usr/local
> --  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
> -
> -   AC_SUBST(GLIB_EXTRA_CFLAGS)
> - ])
> ---
> -2.5.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch b=
/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36=
/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
> deleted file mode 100644
> index 5214256..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-=
0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -audioresample: Fix build on x86 if emmintrin.h is available but can't be=
 used
> -
> -On x86, EMMINTRIN is defined but not usable without SSE so check for
> -__SSE__ and __SSE2__ as well.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D670690
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - gst/audioresample/resample.c |    4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
> -index 98d006c..481fa01 100644
> ---- a/gst/audioresample/resample.c
> -+++ b/gst/audioresample/resample.c
> -@@ -77,13 +77,13 @@
> - #define EXPORT G_GNUC_INTERNAL
> -
> - #ifdef _USE_SSE
> --#ifndef HAVE_XMMINTRIN_H
> -+#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
> - #undef _USE_SSE
> - #endif
> - #endif
> -
> - #ifdef _USE_SSE2
> --#ifndef HAVE_EMMINTRIN_H
> -+#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
> - #undef _USE_SSE2
> - #endif
> - #endif
> ---
> -1.7.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-base-0.10.36/configure.ac-fix-subparse-plugin.patch b/meta-multimedia/rec=
ipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-su=
bparse-plugin.patch
> deleted file mode 100644
> index b8602c8..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-=
0.10.36/configure.ac-fix-subparse-plugin.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Submitted [similar patch by other author, bugzilla]
> -Bugtracker-URL: https://bugzilla.gnome.org/show_bug.cgi?id=3D663600
> -
> -Prepend PKG_CONFIG_SYSROOT to includedir, so configure doesn't
> -search for gstconfig.h in /usr/include.
> -
> -Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ----
> - configure.ac |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1901bcf..460fb0a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -435,7 +435,7 @@ AG_GST_CHECK_PLUGIN(volume)
> - dnl check for gstreamer core features (subsystems)
> - dnl FIXME: this assumes srcdir =3D=3D builddir for uninstalled setups
> - GST_CONFIGPATH=3D`$PKG_CONFIG --variable=3Dincludedir gstreamer-0.10`"/=
gst/gstconfig.h"
> --AG_GST_PARSE_SUBSYSTEM_DISABLES($GST_CONFIGPATH)
> -+AG_GST_PARSE_SUBSYSTEM_DISABLES($PKG_CONFIG_SYSROOT_DIR$GST_CONFIGPATH)
> - AM_CONDITIONAL(USE_XML, test $GST_DISABLE_XML !=3D "1")
> -
> - dnl disable plug-ins that require libxml2's HTML support if it is not a=
vailable
> ---
> -1.7.5.4
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-base-0.10.36/gst-plugins-base-tremor.patch b/meta-multimedia/recipes-mult=
imedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patc=
h
> deleted file mode 100644
> index 99dbc9d..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-=
0.10.36/gst-plugins-base-tremor.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Remove -DTREMOR option since Tremor has dropped its internal
> -libogg2, and gst-plugins-base has dependency on that.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> -Signed-off-by: Shane Wang <shane.wang@intel.com>
> -
> -diff -r 70065fb4e085 ext/vorbis/Makefile.am
> ---- a/ext/vorbis/Makefile.am   Tue Mar 13 16:36:56 2012 +0800
> -+++ b/ext/vorbis/Makefile.am   Tue Mar 13 16:38:53 2012 +0800
> -@@ -30,7 +30,7 @@
> -       gstvorbisdec.c gstvorbisdeclib.c gstvorbiscommon.c
> - libgstivorbisdec_la_CFLAGS =3D \
> -       $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
> --      -DTREMOR $(IVORBIS_CFLAGS)
> -+      $(IVORBIS_CFLAGS)
> - libgstivorbisdec_la_LIBADD =3D \
> -       $(top_builddir)/gst-libs/gst/tag/libgsttag-@GST_MAJORMINOR@.la \
> -       $(top_builddir)/gst-libs/gst/audio/libgstaudio-@GST_MAJORMINOR@.l=
a \
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-p=
lugins-base_0.10.36.bb
> deleted file mode 100644
> index a3bfa5f..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_=
0.10.36.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -require gst-plugins.inc
> -
> -LICENSE =3D "GPLv2+ & LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> -                    file://common/coverage/coverage-report.pl;beginline=
=3D2;endline=3D17;md5=3D622921ffad8cb18ab906c56052788a3f \
> -                    file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605 \
> -                    file://gst/ffmpegcolorspace/utils.c;beginline=3D1;en=
dline=3D20;md5=3D9c83a200b8e597b26ca29df20fc6ecd0"
> -
> -DEPENDS +=3D "alsa-lib libogg libvorbis libtheora util-linux tremor glib=
-2.0-native"
> -
> -SRC_URI +=3D "file://gst-plugins-base-tremor.patch \
> -            file://configure.ac-fix-subparse-plugin.patch \
> -            file://audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.=
patch \
> -            file://0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.=
patch \
> -"
> -
> -SRC_URI[md5sum] =3D "776c73883e567f67b9c4a2847d8d041a"
> -SRC_URI[sha256sum] =3D "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f=
8c9b609321f49976"
> -
> -PR =3D "r8"
> -
> -inherit gettext
> -
> -EXTRA_OECONF +=3D "--disable-freetypetest"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -
> -PACKAGECONFIG[gnomevfs] =3D "--enable-gnome_vfs,--disable-gnome_vfs,gnom=
e-vfs"
> -PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> -PACKAGECONFIG[pango] =3D "--enable-pango,--disable-pango,pango"
> -PACKAGECONFIG[x11] =3D "--enable-x --enable-xvideo,--disable-x --disable=
-xvideo,virtual/libx11 libxv libsm libice"
> -PACKAGECONFIG[cdparanoia] =3D "--enable-cdparanoia,--disable-cdparanoia,=
cdparanoia"
> -
> -do_configure_prepend() {
> -    # This m4 file contains nastiness which conflicts with libtool 2.2.2
> -    rm -f ${S}/m4/lib-link.m4
> -}
> -
> -FILES_${PN} +=3D "${datadir}/${BPN}"
> -
> -CACHED_CONFIGUREVARS_append_x86 =3D " ac_cv_header_emmintrin_h=3Dno ac_c=
v_header_xmmintrin_h=3Dno"
> -
> -# /usr/bin/gst-visualise-0.10 is a perl script.
> -RDEPENDS_${PN}-apps +=3D "perl"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-gl/0001-conditional-gl-framebuffer-undefined-use.patch b/meta-multimedia/=
recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-frameb=
uffer-undefined-use.patch
> deleted file mode 100644
> index bc2f88b..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/00=
01-conditional-gl-framebuffer-undefined-use.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 14d51cbefef19737e7ab2b6818ee1d3bdb248d12 Mon Sep 17 00:00:00 2001
> -From: Jeremy Stashluk <jstashluk@dekaresearch.com>
> -Date: Wed, 6 Feb 2013 09:59:48 -0500
> -Subject: [PATCH] conditional gl framebuffer undefined use
> -
> -The OpenGL extension GL_ARB_framebuffer_object defines the macro
> -GL_FRAMEBUFFER_UNDEFINED. The macro will only need to map to an error
> -string if the extension provides functions that might return the macro.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
> ----
> - gst-libs/gst/gl/gstgldisplay.c |    2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldispl=
ay.c
> -index 3ed0b71..64c6c2c 100644
> ---- a/gst-libs/gst/gl/gstgldisplay.c
> -+++ b/gst-libs/gst/gl/gstgldisplay.c
> -@@ -2177,9 +2177,11 @@ gst_gl_display_check_framebuffer_status (void)
> -       GST_ERROR ("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
> -       break;
> -
> -+#if defined(GL_ARB_framebuffer_object)
> -     case GL_FRAMEBUFFER_UNDEFINED:
> -       GST_ERROR ("GL_FRAMEBUFFER_UNDEFINED");
> -       break;
> -+#endif
> -
> -     default:
> -       GST_ERROR ("General FBO error");
> ---
> -1.7.9.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-gl/rpi-egl-gles2-dep.patch b/meta-multimedia/recipes-multimedia/gstreamer=
-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
> deleted file mode 100644
> index 7db1c5a..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rp=
i-egl-gles2-dep.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Check for header and library separately and check for GLESv2 before egl
> -this is to overcome an annoying issue with rpi/userland where egl depend=
s
> -on sysmbols from libGLESv2
> -
> --Khem
> -Index: gst-plugins-gl-0.10.3/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gst-plugins-gl-0.10.3.orig/configure.ac
> -+++ gst-plugins-gl-0.10.3/configure.ac
> -@@ -183,8 +183,10 @@ case $host in
> -     else
> -       AC_CHECK_HEADERS([EGL/egl.h], [HAVE_EGL=3Dyes], [HAVE_EGL=3Dno])
> -       if test "x$HAVE_EGL" =3D "xyes"; then
> --        AG_GST_CHECK_LIBHEADER(EGL, EGL, eglGetError,, EGL/egl.h,, AC_M=
SG_ERROR([EGL is required]))
> --        AG_GST_CHECK_LIBHEADER(GLES2, GLESv2, glTexImage2D,, GLES2/gl2.=
h,, AC_MSG_ERROR([OpenGLES2 is required]))
> -+        AC_CHECK_HEADERS([GLES2/gl2.h],, AC_MSG_ERROR([OpenGLES2 is req=
uired]))
> -+        AC_CHECK_LIB(GLESv2,[glTexImage2D],, AC_MSG_ERROR([OpenGLES2 is=
 required]))
> -+        AC_CHECK_HEADERS([EGL/egl.h],, AC_MSG_ERROR([EGL is required]))
> -+        AC_CHECK_LIB(EGL,[eglGetError],, AC_MSG_ERROR([EGL is required]=
))
> -         GL_LIBS=3D"$LIBS $X_LIBS -lEGL -lGLESv2"
> -         GL_BACKEND=3Dx11ES2
> -         GL_TYPE=3Dgles
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plug=
ins-gl_0.10.3.bb
> deleted file mode 100644
> index f3eaf30..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.=
10.3.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -require gst-plugins.inc
> -
> -LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> -
> -SRC_URI[md5sum] =3D "ac70ede13f79978d56eaed8abaa3c938"
> -SRC_URI[sha256sum] =3D "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342c=
df2f941c429bf210"
> -
> -SRC_URI +=3D " file://0001-conditional-gl-framebuffer-undefined-use.patc=
h \
> -             file://rpi-egl-gles2-dep.patch \
> -"
> -
> -DEPENDS +=3D "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng =
glew"
> -
> -PR =3D "r4"
> -
> -inherit gettext distro_features_check
> -
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> -
> -# This package doesn't have a configure switch for EGL or GL, so forcibl=
y tell
> -# configure that it can't find gl.h so it always uses EGL.  If/when we h=
ave some
> -# way for machines to specify their preferred GL flavour this can be
> -# automatically adapted.
> -EXTRA_OECONF +=3D "ac_cv_header_GL_gl_h=3Dno"
> -
> -ALLOW_EMPTY_${PN} =3D "1"
> -ALLOW_EMPTY_${PN}-apps =3D "1"
> -ALLOW_EMPTY_${PN}-glib =3D "1"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.pa=
tch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.=
10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> deleted file mode 100644
> index 6456d3c..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-=
0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Wed, 5 Sep 2012 18:54:42 +0200
> -Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffer in=
put
> - field was removed
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Backport
> -
> -[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=3D=
9f2aa8d47f835ea155aaf635f618c0fc1ca87012
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - sys/v4l2/gstv4l2bufferpool.c |    1 -
> - 1 files changed, 0 insertions(+), 1 deletions(-)
> -
> -diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
> -index b81c6a4..51cc0ce 100644
> ---- a/sys/v4l2/gstv4l2bufferpool.c
> -+++ b/sys/v4l2/gstv4l2bufferpool.c
> -@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint=
 index, GstCaps * caps)
> -     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
> -         ret->vbuffer.m.offset);
> -   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.lengt=
h);
> --  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input=
);
> -
> -   data =3D (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
> -       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
> ---
> -1.7.6.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.pa=
tch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.=
10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> deleted file mode 100644
> index bd0de58..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-=
0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Thu, 22 Aug 2013 12:15:54 -0400
> -Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and V4L2_CID_VCENTE=
R
> -
> -kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering =
controls]
> -removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after t=
hree
> -years of depreciation.
> -
> -The ioctl values are still free, and the case statement which processess=
 them
> -in v4l2 userspace falls through to the proper replacement. So in the sho=
rt
> -term, we can explicitly define them using the old absolute values, and e=
verything
> -will work.
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - sys/v4l2/v4l2_calls.c |    9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
> -index 309bfb6..3c64544 100644
> ---- a/sys/v4l2/v4l2_calls.c
> -+++ b/sys/v4l2/v4l2_calls.c
> -@@ -54,11 +54,16 @@
> - #include "gst/gst-i18n-plugin.h"
> -
> - /* Those are ioctl calls */
> -+
> -+/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
> -+   the ioctl space is still present. Since these values fall through
> -+   to their replacement, it is safe (in the short term) to re-use the
> -+    old values explictily */
> - #ifndef V4L2_CID_HCENTER
> --#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
> -+#define V4L2_CID_HCENTER V4L2_CID_BASE+22
> - #endif
> - #ifndef V4L2_CID_VCENTER
> --#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
> -+#define V4L2_CID_VCENTER V4L2_CID_BASE+23
> - #endif
> -
> - GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
> ---
> -1.7.10.4
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch b/meta-multimedia/re=
cipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-=
integer-overrun.patch
> deleted file mode 100644
> index 48b8e98..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-=
0.10.31/0407-mulawdec-fix-integer-overrun.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From ce94b2c2b91b6db190c121860e12a6afafce7ae1 Mon Sep 17 00:00:00 2001
> -From: Roland Krikava <rkrikava@gmail.com>
> -Date: Fri, 2 Nov 2012 12:38:44 -0400
> -Subject: [PATCH 407/440] mulawdec: fix integer overrun
> -
> -There might be more than 65535 samples in a chunk of data.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D687469
> -
> -Commit - 3be45f70220310ec1c60d819f90b5f2ae03b5d83 in 0.10 branch
> -
> -Upstream Status:  Backported
> -
> -Signed-off-by: Roland Krikava <rkrikava@gmail.com>
> ----
> - gst/law/mulaw-conversion.c |    6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/gst/law/mulaw-conversion.c b/gst/law/mulaw-conversion.c
> -index 8afae80..190a9f5 100644
> ---- a/gst/law/mulaw-conversion.c
> -+++ b/gst/law/mulaw-conversion.c
> -@@ -51,9 +51,10 @@ mulaw_encode (gint16 * in, guint8 * out, gint numsamp=
les)
> -     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
> -     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
> -   };
> --  gint16 sign, exponent, mantissa, i;
> -+  gint16 sign, exponent, mantissa;
> -   gint16 sample;
> -   guint8 ulawbyte;
> -+  gint i;
> -
> -   for (i =3D 0; i < numsamples; i++) {
> -     sample =3D in[i];
> -@@ -102,7 +103,8 @@ mulaw_decode (guint8 * in, gint16 * out, gint numsam=
ples)
> -   static gint16 exp_lut[8] =3D { 0, 132, 396, 924, 1980, 4092, 8316, 16=
764 };
> -   gint16 sign, exponent, mantissa;
> -   guint8 ulawbyte;
> --  gint16 linear, i;
> -+  gint16 linear;
> -+  gint i;
> -
> -   for (i =3D 0; i < numsamples; i++) {
> -     ulawbyte =3D in[i];
> ---
> -1.7.9.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-p=
lugins-good_0.10.31.bb
> deleted file mode 100644
> index f993cfc..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_=
0.10.31.bb
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -require gst-plugins.inc
> -
> -LICENSE =3D "GPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
> -                    file://common/coverage/coverage-report.pl;beginline=
=3D2;endline=3D17;md5=3D622921ffad8cb18ab906c56052788a3f \
> -                    file://gst/replaygain/rganalysis.c;beginline=3D1;end=
line=3D23;md5=3Db60ebefd5b2f5a8e0cab6bfee391a5fe"
> -
> -PR =3D "r8"
> -
> -PACKAGECONFIG ?=3D "jpeg v4l \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
> -"
> -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable-pulse,pulseaudio=
"
> -PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> -PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
> -PACKAGECONFIG[wavpack] =3D "--enable-wavpack,--disable-wavpack,wavpack"
> -PACKAGECONFIG[gdkpixbuf] =3D "--enable-gdk_pixbuf,--disable-gdk_pixbuf,g=
dk-pixbuf"
> -PACKAGECONFIG[v4l] =3D "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l=
2 --without-gudev,libgudev"
> -# sub-feature of v4l, but control separately since libv4l is not part of=
 oe-core
> -PACKAGECONFIG[libv4l] =3D "--with-libv4l2,--without-libv4l2,libv4l"
> -PACKAGECONFIG[bzip2] =3D "--enable-bz2,--disable-bz2,bzip2"
> -PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> -PACKAGECONFIG[x11] =3D "--enable-x,--disable-x,virtual/libx11 libxfixes =
libxdamage"
> -PACKAGECONFIG[dv1394] =3D "--enable-dv1394,--disable-dv1394,libraw1394 l=
ibiec61883 libavc1394"
> -
> -DEPENDS +=3D "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
> -            speex libsoup-2.4 libcap"
> -
> -inherit gettext gconf
> -
> -SRC_URI +=3D "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_bu=
ffer-i.patch \
> -            file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_=
VCEN.patch \
> -            file://0407-mulawdec-fix-integer-overrun.patch \
> -"
> -EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disa=
ble-libcaca --disable-hal \
> -                 --disable-examples --disable-taglib"
> -
> -do_configure_prepend() {
> -    # This m4 file contains nastiness which conflicts with libtool 2.2.2
> -    rm ${S}/m4/lib-link.m4 || true
> -}
> -
> -SRC_URI[md5sum] =3D "24f98a294a2b521e1b29412bdadae2e6"
> -SRC_URI[sha256sum] =3D "7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d=
1d44dc96d9e35ac6"
> -
> -FILES_${PN}-gconfelements +=3D "${sysconfdir}/gconf/schemas/gstreamer-0.=
10.schemas"
> -FILES_${PN}-equalizer +=3D "${datadir}/gstreamer-0.10/presets/*.prs"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch b/me=
ta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-=
compensate-for-libcdio-s-recent-cd-text-api-cha.patch
> deleted file mode 100644
> index 1f72fc0..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/=
0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
> +++ /dev/null
> @@ -1,193 +0,0 @@
> -From 649bd92cd2600719862ad5189899212409dd0a67 Mon Sep 17 00:00:00 2001
> -From: Leon Merten Lohse <leon@green-side.de>
> -Date: Thu, 3 May 2012 23:50:30 +0100
> -Subject: [PATCH] cdio: compensate for libcdio's recent cd-text api chang=
es
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D675112
> -
> -Conflicts:
> -
> -       ext/cdio/gstcdiocddasrc.c
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> -
> -Upstream-Status: Backport
> ----
> - ext/cdio/gstcdio.c        | 35 ++++++++++++++++++++++++++++-------
> - ext/cdio/gstcdio.h        | 16 ++++++++++++++++
> - ext/cdio/gstcdiocddasrc.c | 19 +++++++++++++++++++
> - 3 files changed, 63 insertions(+), 7 deletions(-)
> -
> -diff --git a/ext/cdio/gstcdio.c b/ext/cdio/gstcdio.c
> -index 2f58d18..483ebf5 100644
> ---- a/ext/cdio/gstcdio.c
> -+++ b/ext/cdio/gstcdio.c
> -@@ -30,12 +30,16 @@
> - GST_DEBUG_CATEGORY (gst_cdio_debug);
> -
> - void
> --gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext,
> -+gst_cdio_add_cdtext_field (GstObject * src, cdtext_t * cdtext, track_t =
track,
> -     cdtext_field_t field, const gchar * gst_tag, GstTagList ** p_tags)
> - {
> -   const gchar *txt;
> -
> -+#if LIBCDIO_VERSION_NUM > 83
> -+  txt =3D cdtext_get_const (cdtext, field, track);
> -+#else
> -   txt =3D cdtext_get_const (field, cdtext);
> -+#endif
> -   if (txt =3D=3D NULL || *txt =3D=3D '\0') {
> -     GST_DEBUG_OBJECT (src, "empty CD-TEXT field %u (%s)", field, gst_ta=
g);
> -     return;
> -@@ -57,6 +61,12 @@ gst_cdio_add_cdtext_field (GstObject * src, cdtext_t =
* cdtext,
> - }
> -
> - GstTagList *
> -+#if LIBCDIO_VERSION_NUM > 83
> -+gst_cdio_get_cdtext (GstObject * src, cdtext_t * t, track_t track)
> -+{
> -+  GstTagList *tags =3D NULL;
> -+
> -+#else
> - gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, track_t track)
> - {
> -   GstTagList *tags =3D NULL;
> -@@ -67,14 +77,22 @@ gst_cdio_get_cdtext (GstObject * src, CdIo * cdio, t=
rack_t track)
> -     GST_DEBUG_OBJECT (src, "no CD-TEXT for track %u", track);
> -     return NULL;
> -   }
> -+#endif
> -
> --  gst_cdio_add_cdtext_field (src, t, CDTEXT_PERFORMER, GST_TAG_ARTIST, =
&tags);
> --  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_TITLE, &tags=
);
> -+  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_PERFORMER,
> -+      GST_TAG_ARTIST, &tags);
> -+  gst_cdio_add_cdtext_field (src, t, track, CDTEXT_FIELD_TITLE, GST_TAG=
_TITLE,
> -+      &tags);
> -
> -   return tags;
> - }
> -
> - void
> -+#if LIBCDIO_VERSION_NUM > 83
> -+gst_cdio_add_cdtext_album_tags (GstObject * src, cdtext_t * t,
> -+    GstTagList * tags)
> -+{
> -+#else
> - gst_cdio_add_cdtext_album_tags (GstObject * src, CdIo * cdio, GstTagLis=
t * tags)
> - {
> -   cdtext_t *t;
> -@@ -84,11 +102,14 @@ gst_cdio_add_cdtext_album_tags (GstObject * src, Cd=
Io * cdio, GstTagList * tags)
> -     GST_DEBUG_OBJECT (src, "no CD-TEXT for album");
> -     return;
> -   }
> -+#endif
> -
> --  /* FIXME: map CDTEXT_PERFORMER to GST_TAG_ALBUM_ARTIST once we have t=
hat */
> --  gst_cdio_add_cdtext_field (src, t, CDTEXT_TITLE, GST_TAG_ALBUM, &tags=
);
> --  gst_cdio_add_cdtext_field (src, t, CDTEXT_GENRE, GST_TAG_GENRE, &tags=
);
> --
> -+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_PERFORMER,
> -+      GST_TAG_ALBUM_ARTIST, &tags);
> -+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_TITLE, GST_TAG_ALB=
UM,
> -+      &tags);
> -+  gst_cdio_add_cdtext_field (src, t, 0, CDTEXT_FIELD_GENRE, GST_TAG_GEN=
RE,
> -+      &tags);
> -   GST_DEBUG ("CD-TEXT album tags: %" GST_PTR_FORMAT, tags);
> - }
> -
> -diff --git a/ext/cdio/gstcdio.h b/ext/cdio/gstcdio.h
> -index ef31ed0..c6da580 100644
> ---- a/ext/cdio/gstcdio.h
> -+++ b/ext/cdio/gstcdio.h
> -@@ -24,22 +24,38 @@
> - #include <gst/gst.h>
> - #include <cdio/cdio.h>
> - #include <cdio/cdtext.h>
> -+#include <cdio/version.h>
> -+
> -+#if LIBCDIO_VERSION_NUM <=3D 83
> -+  #define CDTEXT_FIELD_PERFORMER CDTEXT_PERFORMER
> -+  #define CDTEXT_FIELD_GENRE     CDTEXT_GENRE
> -+  #define CDTEXT_FIELD_TITLE     CDTEXT_TITLE
> -+#endif
> -
> - GST_DEBUG_CATEGORY_EXTERN (gst_cdio_debug);
> - #define GST_CAT_DEFAULT gst_cdio_debug
> -
> - void     gst_cdio_add_cdtext_field (GstObject      * src,
> -                                     cdtext_t       * cdtext,
> -+                                    track_t          track,
> -                                     cdtext_field_t   field,
> -                                     const gchar    * gst_tag,
> -                                     GstTagList    ** p_tags);
> -
> - GstTagList  * gst_cdio_get_cdtext  (GstObject      * src,
> -+#if LIBCDIO_VERSION_NUM > 83
> -+                                    cdtext_t       * t,
> -+#else
> -                                     CdIo           * cdio,
> -+#endif
> -                                     track_t          track);
> -
> - void      gst_cdio_add_cdtext_album_tags (GstObject  * src,
> -+#if LIBCDIO_VERSION_NUM > 83
> -+                                          cdtext_t   * t,
> -+#else
> -                                           CdIo       * cdio,
> -+#endif
> -                                           GstTagList * tags);
> -
> - #endif /* __GST_CDIO_H__ */
> -diff --git a/ext/cdio/gstcdiocddasrc.c b/ext/cdio/gstcdiocddasrc.c
> -index 615a0c8..830839e 100644
> ---- a/ext/cdio/gstcdiocddasrc.c
> -+++ b/ext/cdio/gstcdiocddasrc.c
> -@@ -206,6 +206,9 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc, =
const gchar * device)
> -   GstCdioCddaSrc *src;
> -   discmode_t discmode;
> -   gint first_track, num_tracks, i;
> -+#if LIBCDIO_VERSION_NUM > 83
> -+  cdtext_t *cdtext;
> -+#endif
> -
> -   src =3D GST_CDIO_CDDA_SRC (audiocdsrc);
> -
> -@@ -244,8 +244,18 @@ gst_cdio_cdda_src_open (GstCddaBaseSrc * cddabasesr=
c, const gchar * device)
> -   if (src->read_speed !=3D -1)
> -     cdio_set_speed (src->cdio, src->read_speed);
> -
> -+#if LIBCDIO_VERSION_NUM > 83
> -+  cdtext =3D cdio_get_cdtext (src->cdio);
> -+
> -+  if (NULL =3D=3D cdtext)
> -+    GST_DEBUG_OBJECT (src, "no CD-TEXT on disc");
> -+  else
> -+    gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), cdtext,
> -+        cddabasesrc->tags);
> -+#else
> -   gst_cdio_add_cdtext_album_tags (GST_OBJECT_CAST (src), src->cdio,
> -       cddabasesrc->tags);
> -+#endif
> -
> -   GST_LOG_OBJECT (src, "%u tracks, first track: %d", num_tracks, first_=
track);
> -
> -@@ -250,8 +263,14 @@ gst_cdio_cdda_src_open (GstAudioCdSrc * audiocdsrc,=
 const gchar * device)
> -      * the right thing here (for cddb id calculations etc. as well) */
> -     track.start =3D cdio_get_track_lsn (src->cdio, i + first_track);
> -     track.end =3D track.start + len_sectors - 1;  /* -1? */
> -+#if LIBCDIO_VERSION_NUM > 83
> -+    if (NULL !=3D cdtext)
> -+      track.tags =3D gst_cdio_get_cdtext (GST_OBJECT (src), cdtext,
> -+          i + first_track);
> -+#else
> -     track.tags =3D gst_cdio_get_cdtext (GST_OBJECT (src), src->cdio,
> -         i + first_track);
> -+#endif
> -
> -     gst_audio_cd_src_add_track (GST_AUDIO_CD_SRC (src), &track);
> -   }
> ---
> -2.1.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-ugly/0002-Fix-opencore-include-paths.patch b/meta-multimedia/recipes-mult=
imedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patc=
h
> deleted file mode 100644
> index 3fd6a26..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/=
0002-Fix-opencore-include-paths.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From e634bc6420826f760f6519a9f134c6a4d3412ef8 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Mon, 19 Oct 2015 15:26:24 +0200
> -Subject: [PATCH] Fix opencore include paths
> -
> -Upstream-Status: Inappropriate [no upstream - GStreamer 0.10 is no longe=
r being maintained]
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - ext/amrnb/amrnbdec.h    | 2 +-
> - ext/amrnb/amrnbenc.h    | 2 +-
> - ext/amrwbdec/amrwbdec.h | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/ext/amrnb/amrnbdec.h b/ext/amrnb/amrnbdec.h
> -index 1e81839..01b7154 100644
> ---- a/ext/amrnb/amrnbdec.h
> -+++ b/ext/amrnb/amrnbdec.h
> -@@ -22,7 +22,7 @@
> -
> - #include <gst/gst.h>
> - #include <gst/audio/gstaudiodecoder.h>
> --#include <interf_dec.h>
> -+#include <opencore-amrnb/interf_dec.h>
> -
> - G_BEGIN_DECLS
> -
> -diff --git a/ext/amrnb/amrnbenc.h b/ext/amrnb/amrnbenc.h
> -index 7f673ac..5be39b5 100644
> ---- a/ext/amrnb/amrnbenc.h
> -+++ b/ext/amrnb/amrnbenc.h
> -@@ -21,7 +21,7 @@
> - #define __GST_AMRNBENC_H__
> -
> - #include <gst/gst.h>
> --#include <interf_enc.h>
> -+#include <opencore-amrnb/interf_enc.h>
> - #include <gst/audio/gstaudioencoder.h>
> -
> - G_BEGIN_DECLS
> -diff --git a/ext/amrwbdec/amrwbdec.h b/ext/amrwbdec/amrwbdec.h
> -index c3528fc..f27c6d2 100644
> ---- a/ext/amrwbdec/amrwbdec.h
> -+++ b/ext/amrwbdec/amrwbdec.h
> -@@ -22,8 +22,8 @@
> -
> - #include <gst/gst.h>
> - #include <gst/audio/gstaudiodecoder.h>
> --#include <dec_if.h>
> --#include <if_rom.h>
> -+#include <opencore-amrwb/dec_if.h>
> -+#include <opencore-amrwb/if_rom.h>
> -
> - G_BEGIN_DECLS
> -
> ---
> -1.9.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-p=
lugins-ugly_0.10.19.bb
> deleted file mode 100644
> index 199b47d..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_=
0.10.19.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -require gst-plugins.inc
> -
> -LICENSE =3D "GPLv2+ & LGPLv2.1+ & LGPLv2+"
> -LICENSE_FLAGS =3D "commercial"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
> -                    file://gst/synaesthesia/synaescope.h;beginline=3D1;e=
ndline=3D20;md5=3D99f301df7b80490c6ff8305fcc712838 \
> -                    file://tests/check/elements/xingmux.c;beginline=3D1;=
endline=3D21;md5=3D4c771b8af188724855cb99cadd390068 \
> -                    file://gst/mpegstream/gstmpegparse.h;beginline=3D1;e=
ndline=3D18;md5=3Dff65467b0c53cdfa98d0684c1bc240a9"
> -
> -DEPENDS +=3D "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
> -PR =3D "r3"
> -
> -inherit gettext
> -
> -EXTRA_OECONF +=3D "--with-plugins=3Da52dec,lame,id3tag,mad,mpeg2dec,mpeg=
stream,mpegaudioparse,asfdemux,realmedia \
> -                 --disable-orc"
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[x264] =3D "--enable-x264,--disable-x264,x264"
> -PACKAGECONFIG[cdio] =3D "--enable-cdio,--disable-cdio,libcdio"
> -PACKAGECONFIG[dvdread] =3D "--enable-dvdread,--disable-dvdread,libdvdrea=
d"
> -PACKAGECONFIG[amrnb] =3D "--enable-amrnb,--disable-amrnb,opencore-amr"
> -PACKAGECONFIG[amrwb] =3D "--enable-amrwb,--disable-amrwb,opencore-amr"
> -
> -do_configure_prepend() {
> -    # This m4 file contains nastiness which conflicts with libtool 2.2.2
> -    rm ${S}/m4/lib-link.m4 || true
> -}
> -
> -SRC_URI[md5sum] =3D "1d81c593e22a6cdf0f2b4f57eae93df2"
> -SRC_URI[sha256sum] =3D "1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e8=
20703b977e2c8df0"
> -SRC_URI +=3D "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-a=
pi-cha.patch \
> -            file://0002-Fix-opencore-include-paths.patch"
> -
> -FILES_${PN}-amrnb +=3D "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.pr=
s"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugin=
s.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
> deleted file mode 100644
> index 6e163a8..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY =3D "Plugins for the GStreamer multimedia framework"
> -HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> -BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstre=
amer"
> -SECTION =3D "multimedia"
> -DEPENDS =3D "gstreamer"
> -
> -# gobject-introspection to get --disable-introspection into UNKNOWN_CONF=
IGURE_WHITELIST
> -inherit autotools pkgconfig gobject-introspection
> -
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.ta=
r.bz2"
> -
> -GSTREAMER_DEBUG ?=3D "--disable-debug"
> -EXTRA_OECONF =3D "--disable-valgrind ${GSTREAMER_DEBUG} --disable-exampl=
es --disable-introspection"
> -
> -acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> -
> -LIBV =3D "0.10"
> -require recipes-multimedia/gstreamer/gst-plugins-package.inc
> -
> -PACKAGES_DYNAMIC +=3D "^${PN}-.*"
> -
> -# apply gstreamer hack after Makefile.in.in in source is replaced by our=
 version from
> -# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before config=
ure is executed
> -# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/0=
32233.html
> -oe_runconf_prepend() {
> -    if [ -e ${S}/po/Makefile.in.in ]; then
> -        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' ${S}=
/po/Makefile.in.in
> -    fi
> -}
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0=
001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch b/meta-multi=
media/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INC=
LUDES-to-AM_CPPFLAGS-for-automa.patch
> deleted file mode 100644
> index 3afca4e..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-cha=
nge-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -index gst-rtsp_0.10.8/bindings/python/Makefile.am
> ---- gst-rtsp_0.10.8.orig/bindings/python/Makefile.am
> -+++ gst-rtsp_0.10.8/bindings/python/Makefile.am
> -@@ -14,7 +14,7 @@ defs_DATA =3D $(DEFS)
> - defsdir =3D $(pkgdatadir)/$(GST_MAJORMINOR)/defs
> - OVERRIDES =3D rtspserver.override
> -
> --INCLUDES =3D -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
> -+AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
> -
> - rtspserver_la_CFLAGS =3D -I$(top_srcdir)/src \
> -         $(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> -index gst-rtsp_0.10.8/examples/Makefile.am
> ---- gst-rtsp_0.10.8.orig/examples/Makefile.am
> -+++ gst-rtsp_0.10.8/examples/Makefile.am
> -@@ -1,6 +1,6 @@
> - noinst_PROGRAMS =3D test-video test-ogg test-mp4 test-readme test-launc=
h test-sdp test-uri test-auth
> -
> --INCLUDES =3D -I$(top_srcdir) -I$(srcdir)
> -+AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir)
> -
> - AM_CFLAGS =3D $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> - AM_LDFLAGS =3D \
> -index gst-rtsp_0.10.8/tests/Makefile.am
> ---- gst-rtsp_0.10.8.orig/tests/Makefile.am
> -+++ gst-rtsp_0.10.8/tests/Makefile.am
> -@@ -1,6 +1,6 @@
> - noinst_PROGRAMS =3D test-cleanup
> -
> --INCLUDES =3D -I$(top_srcdir) -I$(srcdir)
> -+AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir)
> -
> - AM_CFLAGS =3D $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> - AM_LDFLAGS =3D \
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0=
.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.=
8.bb
> deleted file mode 100644
> index b78bcaf..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.b=
b
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "GStreamer RTSP server"
> -LICENSE =3D "LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> -
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.ta=
r.bz2 \
> -           file://0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-aut=
oma.patch"
> -SRC_URI[md5sum] =3D "b511af07000595f63c3a705946221643"
> -SRC_URI[sha256sum] =3D "9915887cf8515bda87462c69738646afb715b597613edc73=
40477ccab63a6617"
> -
> -DEPENDS =3D "gst-plugins-base gstreamer"
> -
> -EXTRA_OECONF =3D "--disable-introspection"
> -
> -# Configure always checks for Python so inherit pythonnative. Better sol=
ution
> -# would be to disable the checks entirely.
> -inherit autotools pythonnative gettext
> -
> -FILES_${PN}-dev +=3D "${datadir}/vala/vapi/"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch b/m=
eta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-bas=
eparse-Fix-self-comparison-always-evaluates-to-tr.patch
> deleted file mode 100644
> index d077496..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ed7f4802222234eef192aa3f74bc92268f338f97 Mon Sep 17 00:00:00 2001
> -From: Sebastian Droege <sebastian.droege@collabora.co.uk>
> -Date: Tue, 6 Mar 2012 12:28:02 +0100
> -Subject: [PATCH] baseparse: Fix 'self-comparison always evaluates to tru=
e'
> -
> -This was really a bug.
> -
> -Commit is ed7f4802222234eef192aa3f74bc92268f338f97 in 0.10 branch
> -
> -Upstream Status:  Backported
> -
> -Signed-off-by: Sebastian Droege <sebastian.droege@collabora.co.uk>
> ----
> - libs/gst/base/gstbaseparse.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
> -index 851ec1d..108ee89 100644
> ---- a/libs/gst/base/gstbaseparse.c
> -+++ b/libs/gst/base/gstbaseparse.c
> -@@ -3899,7 +3899,7 @@ gst_base_parse_handle_seek (GstBaseParse * parse, =
GstEvent * event)
> -        seek event (in bytes) to upstream. Segment / flush handling happ=
ens
> -        in corresponding src event handlers */
> -     GST_DEBUG_OBJECT (parse, "seek in PUSH mode");
> --    if (seekstop >=3D 0 && seekpos <=3D seekpos)
> -+    if (seekstop >=3D 0 && seekstop <=3D seekpos)
> -       seekstop =3D seekpos;
> -     new_event =3D gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
> -         GST_SEEK_TYPE_SET, seekpos, stop_type, seekstop);
> ---
> -1.7.9.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch b/meta-multimedia=
/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-gramma=
r.y-work-with-Bison-3.patch
> deleted file mode 100644
> index dc2d606..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/0001-parse-make-grammar.y-work-with-Bison-3.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 60516f4798894f958fc53b470e1283318d0f8706 Mon Sep 17 00:00:00 2001
> -From: Kerrick Staley <kerrick@kerrickstaley.com>
> -Date: Tue, 20 Aug 2013 23:59:29 -0700
> -Subject: [PATCH 1/2] parse: make grammar.y work with Bison 3
> -
> -YYLEX_PARAM is no longer supported in Bison 3.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D706462
> ----
> - gst/parse/grammar.y | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
> -index 24fc87b..7f9dd16 100644
> ---- a/gst/parse/grammar.y
> -+++ b/gst/parse/grammar.y
> -@@ -26,7 +26,6 @@
> -  */
> -
> - #define YYERROR_VERBOSE 1
> --#define YYLEX_PARAM scanner
> -
> - #define YYENABLE_NLS 0
> -
> -@@ -648,6 +647,7 @@ static int yyerror (void *scanner, graph_t *graph, c=
onst char *s);
> - %right '.'
> - %left '!' '=3D'
> -
> -+%lex-param { void *scanner }
> - %parse-param { void *scanner }
> - %parse-param { graph_t *graph }
> - %pure-parser
> ---
> -2.7.2
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta=
-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-gl=
ib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> deleted file mode 100644
> index 8db3966..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 4b145ceb22bbce7ba6e209c6ab61f2d5867e69f9 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Tue, 1 Nov 2016 19:02:30 +0100
> -Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -we are definitely not one of those poor souls mentioned
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - common/m4/gst-glib2.m4 | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
> -index b01f02f..4569ae5 100644
> ---- a/common/m4/gst-glib2.m4
> -+++ b/common/m4/gst-glib2.m4
> -@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
> -   fi
> -
> -   dnl for the poor souls who for example have glib in /usr/local
> --  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
> -
> -   AC_SUBST(GLIB_EXTRA_CFLAGS)
> - ])
> ---
> -2.5.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/check_fix.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10=
/gstreamer-0.10.36/check_fix.patch
> deleted file mode 100644
> index 5d8bb13..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/check_fix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# gstreamer: Fix a problem with configure if check has already been buil=
t
> -# Richard Purdie <rpurdie@linux.intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff -urN gstreamer-0.10.29-orig/configure.ac gstreamer-0.10.29/configur=
e.ac
> ---- gstreamer-0.10.29-orig/configure.ac        2010-06-26 12:49:27.77493=
0773 +0800
> -+++ gstreamer-0.10.29/configure.ac     2010-06-26 12:51:12.899200233 +08=
00
> -@@ -543,8 +543,10 @@
> -       *) BUILD_CHECK=3Dyes ;;
> -     esac
> - ])
> -+
> - dnl bit of a misnomer, but keep the conditional named like this so we d=
on't
> - dnl have to change too much elsewhere
> -+HAVE_CHECK=3Dno
> - AM_CONDITIONAL(HAVE_CHECK, test "x$BUILD_CHECK" =3D "xyes")
> -
> - dnl configure the desired buffer alignment
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/gst-inspect-check-error.patch b/meta-multimedia/recipes-multimedia/=
gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
> deleted file mode 100644
> index 30be85f..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/gst-inspect-check-error.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# Fix crash with gst-inspect
> -# Chris Lord <chris@openedhand.com>
> -
> -Upstream-Status: Pending
> -
> ---- gstreamer-0.10.9/tools/gst-inspect.c.old   2006-09-12 11:56:53.00000=
0000 +0100
> -+++ gstreamer-0.10.9/tools/gst-inspect.c       2006-09-12 11:57:27.00000=
0000 +0100
> -@@ -1123,7 +1123,7 @@
> -   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
> -   g_option_context_add_group (ctx, gst_init_get_option_group ());
> -   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
> --    g_print ("Error initializing: %s\n", err->message);
> -+    g_print ("Error initializing: %s\n", err ? err->message : "(null)")=
;
> -     exit (1);
> -   }
> -   g_option_context_free (ctx);
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/gstregistrybinary.c b/meta-multimedia/recipes-multimedia/gstreamer-=
0.10/gstreamer-0.10.36/gstregistrybinary.c
> deleted file mode 100644
> index c1f3e71..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/gstregistrybinary.c
> +++ /dev/null
> @@ -1,487 +0,0 @@
> -/* GStreamer
> - * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
> - *                    2000 Wim Taymans <wtay@chello.be>
> - *                    2005 David A. Schleef <ds@schleef.org>
> - *
> - * gstregistryxml.c: GstRegistry object, support routines
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it ulnder the terms of the GNU Library General Public
> - * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Library General Public License for more details.
> - *
> - * You should have received a copy of the GNU Library General Public
> - * License along with this library; if not, write to the
> - * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> - * Boston, MA 02111-1307, USA.
> - */
> -
> -
> -#include <gst/gstregistrybinary.h>
> -
> -/*
> -** Simple handy function to write a memory location to the registry cach=
e file
> -*/
> -inline static gboolean
> -gst_registry_binary_write(GstRegistry *registry, const void *mem, const =
ssize_t size)
> -{
> -  if (write(registry->cache_file, mem, size) !=3D size)
> -    {
> -      GST_ERROR("Failed to write binary registry element: ptr=3D%p size=
=3D%u error=3D%s\n",
> -               mem, size, strerror(errno));
> -      return FALSE;
> -    }
> -  return TRUE;
> -}
> -
> -/*
> -** Save features GstBinary style
> -*/
> -static gboolean
> -gst_registry_binary_fill_feature(GList **list, GstPluginFeature *orig, G=
stBinaryPluginFeature *dest, const char *name)
> -{
> -  GstBinaryChunck *chk;
> -
> -  if ((chk =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D NULL)
> -    return FALSE;
> -
> -  chk->data =3D dest;
> -  chk->size =3D sizeof (GstBinaryPluginFeature);
> -
> -  *list =3D g_list_append(*list, chk);
> -
> -  dest->rank =3D orig->rank;
> -  if (!strncpy(dest->typename, name, GST_BINARY_REGISTRY_TYPENAME_TYPENA=
ME_LEN) ||
> -      !strncpy(dest->name, orig->name, GST_BINARY_REGISTRY_TYPENAME_NAME=
_LEN))
> -    {
> -      GST_ERROR("Failed to write binary registry feature");
> -      goto fail;
> -    }
> -
> -  if (GST_IS_ELEMENT_FACTORY(orig))
> -    {
> -      GstElementFactory *factory =3D GST_ELEMENT_FACTORY(orig);
> -
> -      if (!strncpy(dest->longname, factory->details.longname, GST_BINARY=
_REGISTRY_TYPENAME_LONGNAME_LEN) ||
> -         !strncpy(dest->class, factory->details.klass, GST_BINARY_REGIST=
RY_TYPENAME_CLASS_LEN) ||
> -         !strncpy(dest->description, factory->details.description, GST_B=
INARY_REGISTRY_TYPENAME_DESCRIPTION_LEN) ||
> -         !strncpy(dest->author, factory->details.author, GST_BINARY_REGI=
STRY_TYPENAME_AUTHOR_LEN))
> -       {
> -         GST_ERROR("Failed to write binary registry feature");
> -         goto fail;
> -       }
> -    }
> -
> -  dest->npadtemplates =3D dest->ninterfaces =3D dest->nuritypes =3D 0;
> -  return TRUE;
> -
> - fail:
> -  free(chk);
> -  return FALSE;
> -}
> -
> -
> -/*
> -** Initialize the GstBinaryRegistryMagic, setting both our magic number =
and gstreamer major/minor version
> -*/
> -inline static gboolean
> -gst_registry_binary_initialize_magic(GstBinaryRegistryMagic *m)
> -{
> -  if (!strncpy(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, GST_MAGIC_BINARY=
_REGISTRY_LEN) ||
> -      !strncpy(m->version, GST_MAJORMINOR, GST_BINARY_REGISTRY_VERSION_L=
EN))
> -    {
> -      GST_ERROR("Failed to write magic to the registry magic structure")=
;
> -      return FALSE;
> -    }
> -  return TRUE;
> -}
> -
> -/*
> -** Check GstBinaryRegistryMagic validity.
> -** Return a pointer pointing right after the magic structure
> -*/
> -static gchar *
> -gst_registry_binary_check_magic(gchar *in)
> -{
> -  GstBinaryRegistryMagic *m =3D (GstBinaryRegistryMagic *) in;
> -
> -  if (m =3D=3D NULL || m->magic =3D=3D NULL || m->version =3D=3D NULL)
> -    {
> -      GST_ERROR("Binary registry magic structure is broken");
> -      return NULL;
> -    }
> -  if (strncmp(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, GST_MAGIC_BINARY_=
REGISTRY_LEN) !=3D 0)
> -    {
> -      GST_ERROR("Binary registry magic is different : %02x%02x%02x%02x !=
=3D %02x%02x%02x%02x",
> -               GST_MAGIC_BINARY_REGISTRY_STR[0] & 0xff, GST_MAGIC_BINARY=
_REGISTRY_STR[1] & 0xff,
> -               GST_MAGIC_BINARY_REGISTRY_STR[2] & 0xff, GST_MAGIC_BINARY=
_REGISTRY_STR[3] & 0xff,
> -               m->magic[0] & 0xff, m->magic[1] & 0xff, m->magic[2] & 0xf=
f, m->magic[3] & 0xff);
> -      return NULL;
> -    }
> -  if (strncmp(m->version, GST_MAJORMINOR, GST_BINARY_REGISTRY_VERSION_LE=
N))
> -    {
> -      GST_ERROR("Binary registry magic version is different : %s !=3D %s=
",
> -               GST_MAJORMINOR, m->version);
> -      return NULL;
> -    }
> -  return (in + sizeof (GstBinaryRegistryMagic));
> -}
> -
> -/*
> -** Adapt a GstPlugin to our GstBinaryPluginElement structure, and write =
it to the
> -** registry file.
> -*/
> -static gboolean
> -gst_registry_binary_save_plugin(GList **list, GstRegistry *registry, Gst=
Plugin *plugin)
> -{
> -  GstBinaryPluginElement *e;
> -  GstBinaryChunck *chk;
> -  GList *walk;
> -
> -  if ((e =3D calloc(1, sizeof (GstBinaryPluginElement))) =3D=3D NULL ||
> -      (chk =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D NULL)
> -    return FALSE;
> -
> -  chk->data =3D e;
> -  chk->size =3D sizeof (GstBinaryPluginElement);
> -  *list =3D g_list_append(*list, chk);
> -
> -  if (!strncpy(e->name, plugin->desc.name, GST_BINARY_REGISTRY_NAME_LEN)=
                       ||
> -      !strncpy(e->description, plugin->desc.description, GST_BINARY_REGI=
STRY_DESCRIPTION_LEN)  ||
> -      !strncpy(e->filename, plugin->filename, _POSIX_PATH_MAX)          =
                       ||
> -      !strncpy(e->version, plugin->desc.version, GST_BINARY_REGISTRY_VER=
SION_LEN)              ||
> -      !strncpy(e->license, plugin->desc.license, GST_BINARY_REGISTRY_LIC=
ENSE_LEN)              ||
> -      !strncpy(e->source, plugin->desc.source, GST_BINARY_REGISTRY_SOURC=
E_LEN)                 ||
> -      !strncpy(e->package, plugin->desc.package, GST_BINARY_REGISTRY_PAC=
KAGE_LEN)              ||
> -      !strncpy(e->origin, plugin->desc.origin, GST_BINARY_REGISTRY_ORIGI=
N_LEN))
> -    {
> -      GST_DEBUG("Can't adapt GstPlugin to GstBinaryPluginElement");
> -      goto fail;
> -    }
> -
> -  e->size =3D plugin->file_size;
> -  e->m32p =3D plugin->file_mtime;
> -
> -  GList *ft_list =3D gst_registry_get_feature_list_by_plugin(registry, p=
lugin->desc.name);
> -
> -  for (walk =3D ft_list; walk; walk =3D g_list_next(walk), e->nfeatures+=
+)
> -    {
> -      GstPluginFeature *curfeat =3D GST_PLUGIN_FEATURE (walk->data);
> -      GstBinaryPluginFeature *newfeat;
> -      const char *feat_name =3D g_type_name(G_OBJECT_TYPE(curfeat));
> -
> -      if ((newfeat =3D calloc(1, sizeof (GstBinaryPluginFeature))) =3D=
=3D NULL)
> -         goto fail;
> -
> -      if (!feat_name || !gst_registry_binary_fill_feature(list, curfeat,=
 newfeat, feat_name))
> -       {
> -         GST_ERROR("Can't fill plugin feature, aborting.");
> -         goto fail;
> -       }
> -    }
> -
> -  GST_DEBUG("Found %d features in plugin \"%s\"\n", e->nfeatures, e->nam=
e);
> -  return TRUE;
> -
> - fail:
> -  free(chk);
> -  free(e);
> -  return FALSE;
> -}
> -
> -/*
> -** Write the cache to file. Part of the code was taken from gstregistryx=
ml.c
> -*/
> -gboolean
> -gst_registry_binary_write_cache(GstRegistry *registry, const char *locat=
ion)
> -{
> -  GList *walk;
> -  char *tmp_location;
> -  GstBinaryRegistryMagic *magic;
> -  GstBinaryChunck *magic_chunck;
> -  GList *to_write =3D NULL;
> -
> -  GST_INFO("Writing binary registry cache");
> -
> -  g_return_val_if_fail (GST_IS_REGISTRY (registry), FALSE);
> -  tmp_location =3D g_strconcat (location, ".tmpXXXXXX", NULL);
> -  registry->cache_file =3D g_mkstemp (tmp_location);
> -  if (registry->cache_file =3D=3D -1)
> -    {
> -      char *dir;
> -
> -      /* oops, I bet the directory doesn't exist */
> -      dir =3D g_path_get_dirname (location);
> -      g_mkdir_with_parents (dir, 0777);
> -      g_free (dir);
> -
> -      registry->cache_file =3D g_mkstemp (tmp_location);
> -    }
> -
> -  if (registry->cache_file =3D=3D -1)
> -    goto fail;
> -
> -  if ((magic =3D calloc(1, sizeof (GstBinaryRegistryMagic))) =3D=3D NULL=
 ||
> -      !gst_registry_binary_initialize_magic(magic))
> -    goto fail;
> -
> -  if ((magic_chunck =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D NULL=
)
> -    goto fail;
> -
> -  magic_chunck->data =3D magic;
> -  magic_chunck->size =3D sizeof (GstBinaryRegistryMagic);
> -  to_write =3D g_list_append(to_write, magic_chunck);
> -
> -  /* Iterate trough the list of plugins in the GstRegistry and adapt the=
m to our structures */
> -  for (walk =3D g_list_last(registry->plugins); walk; walk =3D g_list_pr=
evious(walk))
> -    {
> -      GstPlugin *plugin =3D GST_PLUGIN(walk->data);
> -
> -      if (!plugin->filename)
> -       continue;
> -
> -      if (plugin->flags & GST_PLUGIN_FLAG_CACHED)
> -       {
> -         int ret;
> -         struct stat statbuf;
> -
> -         ret =3D g_stat (plugin->filename, &statbuf);
> -         if ((ret =3D g_stat (plugin->filename, &statbuf)) < 0   ||
> -             plugin->file_mtime !=3D statbuf.st_mtime            ||
> -             plugin->file_size !=3D statbuf.st_size)
> -           continue;
> -       }
> -
> -      if (!gst_registry_binary_save_plugin(&to_write, registry, plugin))
> -       {
> -         GST_ERROR("Can't write binary plugin information for \"%s\"", p=
lugin->filename);
> -         continue; /* Try anyway */
> -       }
> -    }
> -
> -  for (walk =3D g_list_first(to_write); walk; walk =3D g_list_next(walk)=
)
> -    {
> -      GstBinaryChunck *cur =3D walk->data;
> -
> -      if (!gst_registry_binary_write(registry, cur->data, cur->size))
> -       {
> -         free(cur->data);
> -         free(cur);
> -         g_list_free(to_write);
> -         goto fail;
> -       }
> -      free(cur->data);
> -      free(cur);
> -    }
> -  g_list_free(to_write);
> -
> -  if (close(registry->cache_file) < 0)
> -    {
> -      GST_DEBUG("Can't close registry file : %s", strerror(errno));
> -      goto fail;
> -    }
> -
> -  if (g_file_test (tmp_location, G_FILE_TEST_EXISTS)) {
> -#ifdef WIN32
> -    remove (location);
> -#endif
> -    rename (tmp_location, location);
> -  }
> -
> -  g_free (tmp_location);
> -  return TRUE;
> -
> - fail:
> -  g_free(tmp_location);
> -  return FALSE;
> -}
> -
> -static GstPluginFeature*
> -gst_registry_binary_load_feature(GstBinaryPluginFeature *in)
> -{
> -  GstPluginFeature *feature;
> -  GType type;
> -
> -  if (!in->typename || !*(in->typename))
> -    return NULL;
> -
> -  /*  GST_INFO("Plugin feature typename : %s", in->typename);*/
> -
> -  if (!(type =3D g_type_from_name(in->typename)))
> -    {
> -      GST_ERROR("Unknown type from typename");
> -      return NULL;
> -    }
> -  feature =3D g_object_new (type, NULL);
> -
> -  if (!feature) {
> -    GST_ERROR("Can't create feature from type");
> -    return NULL;
> -  }
> -
> -  if (!GST_IS_PLUGIN_FEATURE (feature)) {
> -    /* don't really know what it is */
> -    if (GST_IS_OBJECT (feature))
> -      gst_object_unref (feature);
> -    else
> -      g_object_unref (feature);
> -    return NULL;
> -  }
> -
> -  feature->name =3D g_strdup(in->name);
> -  feature->rank =3D in->rank;
> -
> -  if (GST_IS_ELEMENT_FACTORY(feature))
> -    {
> -      GstElementFactory *factory =3D GST_ELEMENT_FACTORY(feature);
> -
> -      factory->details.longname =3D g_strdup(in->longname);
> -      factory->details.klass =3D g_strdup(in->class);
> -      factory->details.description =3D g_strdup(in->description);
> -      factory->details.author =3D g_strdup(in->author);
> -
> -      /*      GST_INFO("Element factory : %s", factory->details.longname=
); */
> -    }
> -
> -  GST_DEBUG("Added feature %p with name %s", feature, feature->name);
> -  return feature;
> -}
> -
> -/*
> -** Make a new plugin from current GstBinaryPluginElement structure
> -** and save it to the GstRegistry. Return an offset to the next
> -** GstBinaryPluginElement structure.
> -*/
> -static unsigned long
> -gst_registry_binary_get_binary_plugin(GstRegistry *registry, gchar *in)
> -{
> -  GstBinaryPluginElement *p =3D (GstBinaryPluginElement *) in;
> -  GstPlugin *plugin =3D NULL;
> -  GList *plugin_features =3D NULL;
> -  GstBinaryPluginFeature *feat;
> -  unsigned int i;
> -  unsigned long offset;
> -
> -  plugin =3D g_object_new (GST_TYPE_PLUGIN, NULL);
> -
> -  plugin->flags |=3D GST_PLUGIN_FLAG_CACHED;
> -
> -  plugin->desc.name =3D g_strdup(p->name);
> -  plugin->desc.description=3D g_strdup(p->description);
> -  plugin->filename =3D g_strdup(p->filename);
> -  plugin->desc.version =3D g_strdup(p->version);
> -  plugin->desc.license =3D g_strdup(p->license);
> -  plugin->desc.source =3D g_strdup(p->source);
> -  plugin->desc.package =3D g_strdup(p->package);
> -  plugin->desc.origin =3D g_strdup(p->origin);
> -  plugin->file_mtime =3D p->m32p;
> -  plugin->file_size =3D p->size;
> -  plugin->basename =3D g_path_get_basename (plugin->filename);
> -
> -  if (plugin->file_mtime < 0 || plugin->file_size < 0)
> -    {
> -      GST_ERROR("Plugin time or file size is not valid !");
> -      g_free(plugin);
> -      return -1;
> -    }
> -
> -  if (p->nfeatures < 0)
> -    {
> -      GST_ERROR("The number of feature structure is not valid !");
> -      gst_object_unref(plugin);
> -      return -1;
> -    }
> -
> -  for (feat =3D (GstBinaryPluginFeature *) (in + sizeof (GstBinaryPlugin=
Element)), i =3D 0;
> -       i < p->nfeatures; i++, feat++)
> -    {
> -      GstPluginFeature *gstfeat;
> -
> -      if ((gstfeat =3D gst_registry_binary_load_feature(feat)) =3D=3D NU=
LL)
> -       {
> -         g_list_free(plugin_features);
> -         g_free(plugin);
> -         GST_ERROR("Error while loading binary feature");
> -         return -1;
> -       }
> -      gstfeat->plugin_name =3D g_strdup(plugin->desc.name);
> -      plugin_features =3D g_list_prepend(plugin_features, gstfeat);
> -    }
> -
> -  GST_DEBUG("Added plugin \"%s\" to global registry from binary registry=
", plugin->desc.name);
> -  GList *g;
> -
> -  gst_registry_add_plugin (registry, plugin);
> -  for (g =3D plugin_features; g; g =3D g_list_next (g))
> -    gst_registry_add_feature (registry, GST_PLUGIN_FEATURE (g->data));
> -  /*  g_list_free(plugin_features); */
> -
> -  offset =3D sizeof (GstBinaryPluginElement) + p->nfeatures * sizeof (Gs=
tBinaryPluginFeature);
> -  return offset;
> -}
> -
> -
> -/*
> -** Read the cache and adapt it to fill GstRegistry
> -*/
> -gboolean
> -gst_registry_binary_read_cache(GstRegistry *registry, const char *locati=
on)
> -{
> -  GMappedFile *mapped =3D NULL;
> -  GTimer *timer =3D NULL;
> -  gchar *contents =3D NULL;
> -  gdouble seconds;
> -  unsigned long offset, inc;
> -  gsize size;
> -
> -  /* make sure these types exist */
> -  GST_TYPE_ELEMENT_FACTORY;
> -  GST_TYPE_TYPE_FIND_FACTORY;
> -  GST_TYPE_INDEX_FACTORY;
> -
> -  timer =3D g_timer_new ();
> -
> -  if ((mapped =3D g_mapped_file_new(location, FALSE, NULL)) =3D=3D NULL =
||
> -      (contents =3D g_mapped_file_get_contents(mapped)) =3D=3D NULL)
> -    {
> -      GST_ERROR("Can't load file : %s", strerror(errno));
> -      return FALSE;
> -    }
> -  if ((contents =3D gst_registry_binary_check_magic(contents)) =3D=3D NU=
LL)
> -    {
> -      GST_ERROR("Binary registry type not recognized (invalid magic)");
> -      g_mapped_file_free(mapped);
> -      return FALSE;
> -    }
> -
> -  if ((size =3D g_mapped_file_get_length(mapped)) < sizeof (GstBinaryPlu=
ginElement))
> -    {
> -      GST_INFO("No binary plugins structure to read");
> -      return TRUE; /* This is not really an error */
> -    }
> -
> -  for (offset =3D inc =3D 0; (offset + sizeof (GstBinaryPluginElement)) =
< size &&
> -        (inc =3D gst_registry_binary_get_binary_plugin(registry, content=
s + offset)) > 0;
> -       offset +=3D inc)
> -    ; /* May want in the future to do something here */
> -  if (inc < 0)
> -    {
> -      GST_DEBUG("Problem while reading binary registry");
> -      return FALSE;
> -    }
> -
> -  g_timer_stop (timer);
> -  seconds =3D g_timer_elapsed (timer, NULL);
> -  g_timer_destroy (timer);
> -
> -  GST_INFO ("loaded %s in %f seconds", location, seconds);
> -
> -  if (mapped)
> -    g_mapped_file_free (mapped);
> -  return TRUE;
> -}
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/gstregistrybinary.h b/meta-multimedia/recipes-multimedia/gstreamer-=
0.10/gstreamer-0.10.36/gstregistrybinary.h
> deleted file mode 100644
> index 2ef24d7..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/gstregistrybinary.h
> +++ /dev/null
> @@ -1,194 +0,0 @@
> -/* GStreamer
> - * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
> - *                    2000 Wim Taymans <wim.taymans@chello.be>
> - *
> - * gstregistry.h: Header for registry handling
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Library General Public
> - * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Library General Public License for more details.
> - *
> - * You should have received a copy of the GNU Library General Public
> - * License along with this library; if not, write to the
> - * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> - * Boston, MA 02111-1307, USA.
> - */
> -
> -/* SUGGESTIONS AND TODO :
> -** =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -** - Use a compressed registry, but would induce performance loss
> -** - Encrypt the registry, for security purpose, but would also reduce p=
erformances
> -** - Also have a non-mmap based cache reading (work with file descriptor=
s)
> -*/
> -
> -#ifndef __GST_REGISTRYBINARY_H__
> -#define __GST_REGISTRYBINARY_H__
> -
> -#ifdef HAVE_CONFIG_H
> -#  include "config.h"
> -#endif
> -
> -#include <stdio.h>
> -#include <errno.h>
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <dirent.h>
> -#include <fcntl.h>
> -#include <sys/mman.h>
> -#ifdef HAVE_UNISTD_H
> -#include <unistd.h>
> -#endif
> -
> -#include <gst/gst_private.h>
> -#include <gst/gstelement.h>
> -#include <gst/gsttypefind.h>
> -#include <gst/gsttypefindfactory.h>
> -#include <gst/gsturi.h>
> -#include <gst/gstinfo.h>
> -#include <gst/gstenumtypes.h>
> -#include <gst/gstregistry.h>
> -#include <gst/gstpadtemplate.h>
> -
> -#include "glib-compat-private.h"
> -#include <glib/gstdio.h>
> -
> -/* A magic, written at the beginning of the file */
> -#define GST_MAGIC_BINARY_REGISTRY_STR "\xc0\xde\xf0\x0d"
> -#define GST_MAGIC_BINARY_REGISTRY_LEN (4)
> -#define GST_MAGIC_BINARY_VERSION_LEN (64)
> -
> -typedef struct _GstBinaryRegistryMagic
> -{
> -  char magic[GST_MAGIC_BINARY_REGISTRY_LEN];
> -  char version[GST_MAGIC_BINARY_VERSION_LEN];
> -} GstBinaryRegistryMagic;
> -
> -
> -/* Used to store pointers to write */
> -typedef struct _GstBinaryChunck
> -{
> -  void *data;
> -  unsigned int size;
> -} GstBinaryChunck;
> -
> -
> -/* A structure containing (staticely) every information needed for a plu=
gin
> -**
> -** Notes :
> -** "nfeatures" is used to say how many GstBinaryPluginFeature structures=
 we will have
> -** right after the structure itself.
> -*/
> -
> -/* Various lenght defines for our GstBinaryPluginElement structure
> -** Note : We could eventually use smaller size
> -*/
> -#define GST_BINARY_REGISTRY_NAME_LEN (256)
> -#define GST_BINARY_REGISTRY_DESCRIPTION_LEN (1024)
> -#define GST_BINARY_REGISTRY_VERSION_LEN (64)
> -#define GST_BINARY_REGISTRY_LICENSE_LEN (256)
> -#define GST_BINARY_REGISTRY_SOURCE_LEN (256)
> -#define GST_BINARY_REGISTRY_PACKAGE_LEN (1024)
> -#define GST_BINARY_REGISTRY_ORIGIN_LEN (1024)
> -
> -typedef struct _GstBinaryPluginElement
> -{
> -  char name[GST_BINARY_REGISTRY_NAME_LEN];
> -  char description[GST_BINARY_REGISTRY_DESCRIPTION_LEN];
> -  char filename[_POSIX_PATH_MAX];
> -  char version[GST_BINARY_REGISTRY_VERSION_LEN];
> -  char license[GST_BINARY_REGISTRY_LICENSE_LEN];
> -  char source[GST_BINARY_REGISTRY_SOURCE_LEN];
> -  char package[GST_BINARY_REGISTRY_PACKAGE_LEN];
> -  char origin[GST_BINARY_REGISTRY_ORIGIN_LEN];
> -  unsigned long size;
> -  unsigned long m32p;
> -  unsigned int nfeatures;
> -} GstBinaryPluginElement;
> -
> -
> -/* A structure containing the plugin features
> -**
> -** Note :
> -** "npadtemplates" is used to store the number of GstBinaryPadTemplate s=
tructures following the structure itself.
> -** "ninterfaces" is used to store the number of GstBinaryInterface struc=
tures following the structure itself.
> -** "nuritypes" is used to store the number of GstBinaryUriType structure=
s following the structure itself.
> -*/
> -#define GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN (256)
> -#define GST_BINARY_REGISTRY_TYPENAME_NAME_LEN (256)
> -#define GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN (1024)
> -#define GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN (512)
> -#define GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN (1024)
> -#define GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN (256)
> -
> -typedef struct _GstBinaryPluginFeature
> -{
> -  char typename[GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN];
> -  char name[GST_BINARY_REGISTRY_TYPENAME_NAME_LEN];
> -  unsigned long rank;
> -  char longname[GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN];
> -  char class[GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN];
> -  char description[GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN];
> -  char author[GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN];
> -  unsigned int npadtemplates;
> -  unsigned int ninterfaces;
> -  unsigned int nuritypes;
> -} GstBinaryPluginFeature;
> -
> -
> -/*
> -** A structure containing the static pad templates of a plugin feature
> -*/
> -#define GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN (256)
> -#define GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN (1024)
> -
> -typedef struct _GstBinaryPadTemplate
> -{
> -  char name[GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN];
> -  char cap[GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN];
> -  int direction;                                       /* Either 0:"sink=
" or 1:"src" */
> -  GstPadPresence presence;
> -} GstBinaryPadTemplate;
> -
> -/*
> -** A very simple structure defining the plugin feature interface string
> -*/
> -#define GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN (512)
> -typedef struct _GstBinaryInterface
> -{
> -  char interface[GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN];
> -  unsigned long size;
> -} GstBinaryInterface;
> -
> -/* Uri Type */
> -typedef struct _GstBinaryUriType
> -{
> -  GstURIType type;
> -  unsigned long nuriprotocols;
> -} GstBinaryUriType;
> -
> -/*
> -** Function prototypes
> -*/
> -
> -/* Local prototypes */
> -inline static gboolean gst_registry_binary_write(GstRegistry *registry, =
const void *mem, const ssize_t size);
> -inline static gboolean gst_registry_binary_initialize_magic(GstBinaryReg=
istryMagic *m);
> -static gboolean gst_registry_binary_fill_feature(GList **list, GstPlugin=
Feature *, GstBinaryPluginFeature *, const char *);
> -static gboolean gst_registry_binary_save_plugin(GList **list, GstRegistr=
y *registry, GstPlugin *plugin);
> -static gchar *gst_registry_binary_check_magic(gchar *in);
> -static GstPluginFeature *gst_registry_binary_load_feature(GstBinaryPlugi=
nFeature *);
> -static unsigned long gst_registry_binary_get_binary_plugin(GstRegistry *=
registry, gchar *in);
> -
> -/* Exportable */
> -gboolean gst_registry_binary_write_cache(GstRegistry *registry, const ch=
ar *location);
> -gboolean gst_registry_binary_read_cache(GstRegistry *registry, const cha=
r *location);
> -
> -#endif /* !__GST_REGISTRYBINARY_H__ */
> -
> -
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_=
0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.=
10.36.bb
> deleted file mode 100644
> index 5f97a20..0000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36=
.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY =3D "GStreamer multimedia framework"
> -DESCRIPTION =3D "GStreamer is a multimedia framework for encoding and de=
coding video and sound. \
> -It supports a wide range of formats including mp3, ogg, avi, mpeg and qu=
icktime."
> -HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> -BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstre=
amer"
> -SECTION =3D "multimedia"
> -LICENSE =3D "LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
> -                    file://gst/gst.h;beginline=3D1;endline=3D21;md5=3D8e=
5fe5e87d33a04479fde862e238eaa4"
> -DEPENDS =3D "glib-2.0 libxml2 bison-native flex-native glib-2.0-native"
> -
> -PR =3D "r2"
> -
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${=
PV}.tar.bz2 \
> -           file://check_fix.patch \
> -           file://gst-inspect-check-error.patch \
> -           file://0001-baseparse-Fix-self-comparison-always-evaluates-to=
-tr.patch \
> -           file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
> -           file://0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS=
.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "a0cf7d6877f694a1a2ad2b4d1ecb890b"
> -SRC_URI[sha256sum] =3D "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de2=
9b5d82bb41ae7a30"
> -
> -inherit autotools pkgconfig gettext
> -
> -GSTREAMER_DEBUG ?=3D "--disable-debug"
> -EXTRA_OECONF =3D "--disable-docbook --disable-gtk-doc \
> -            --disable-dependency-tracking --disable-check \
> -            --disable-examples --disable-tests \
> -            --disable-valgrind ${GSTREAMER_DEBUG} \
> -            --disable-introspection \
> -            "
> -
> -CACHED_CONFIGUREVARS +=3D "ac_cv_header_valgrind_valgrind_h=3Dno"
> -
> -# apply gstreamer hack after Makefile.in.in in source is replaced by our=
 version from
> -# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before config=
ure is executed
> -# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/0=
32233.html
> -oe_runconf_prepend() {
> -        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' ${S}=
/po/Makefile.in.in
> -}
> -
> -#do_compile_prepend () {
> -#    mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
> -#}
> -
> -RRECOMMENDS_${PN}_qemux86    +=3D "kernel-module-snd-ens1370 kernel-modu=
le-snd-rawmidi"
> -RRECOMMENDS_${PN}_qemux86-64 +=3D "kernel-module-snd-ens1370 kernel-modu=
le-snd-rawmidi"
> -
> -FILES_${PN} +=3D " ${libdir}/gstreamer-0.10/*.so"
> -FILES_${PN}-dev +=3D " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer=
-0.10/*.a"
> -FILES_${PN}-dbg +=3D " ${libdir}/gstreamer-0.10/.debug/ ${libexecdir}/gs=
treamer-0.10/.debug/"
> --
> 1.8.3.1
>
> --
NAK - same as for xfce4-mixer

A question of intgerest: what is the goal of removing working recipes??

Andreas

