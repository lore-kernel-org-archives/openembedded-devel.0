Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id A32FA60088
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2016 05:34:56 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w59so3006157qtd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2016 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=554K7VbQU4d5EpseU6qrGZv0YFw1E6oJDZ4oQXaG+Zs=;
	b=K/eQjTTpHSEtvLDdCiIoaf05sJew0gRoY8qbAWcENe1P6FfSRRuIndBkdYAqxKN/ne
	N+MjUhsNT8AcTxkiHqNNEiVUvuiVJG3QcdBO4URYf1WoUL8RHhNmkHjWFhPoPkfqMkqm
	Krq25woEIuWWHaAerkqnwZlRRFGopG/TVOTpaeBANbdM8/uo/KDsHtVKYyC0EYn/Q+I/
	INsAB8quRrNF3XjpRrKYFu92YmXvIxfp+Y+nmrRugeRv5P3VWUxYzMJlqtKC1A07RPV3
	znD9WcgOy8iOayjiEjskmPMzUKg6jfVgXEEnguOLzBZVtR/eo/s7ioe4/fDHING++5p0
	bDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=554K7VbQU4d5EpseU6qrGZv0YFw1E6oJDZ4oQXaG+Zs=;
	b=hfLZb628REJsfxOph7AlQ+XJ3RtQEPhR5sKmVenNltPGlZqH3oCoAmIdKyHg2lhAeP
	tkKp8voGSvhrLnKyjfxOiBLdoYLDUgfzPbZ6A3cYUmt/W75wXjACC46c8yGexfW5H6ga
	7kIxyKZphd/1NH9zNgR2+HOFvABoG0pWj7X1EbDFtGnfxuxqsxeuIG9RlrMqas8dvd4t
	v1N2BxkJMSw3WtizCdGzdVZhE7uSIpWfK73Hsoamqux4uI4RYk8TUoMfT5whgs4aTksV
	PTGaqoVykddcFFwDPk/tcqKGd5kL/3SGxkP5svn4Um/iNk67sdWA225IgLsm3413F8zf
	xNWA==
X-Gm-Message-State: ALyK8tJajzC/cfU0bZUSdsjnw67mHFUdEj3CkJDeqqXnFZ/TpRcWE9v74tij1ND91jShIEzz2VaGX0DAtLkldg==
MIME-Version: 1.0
X-Received: by 10.237.54.5 with SMTP id e5mr9087371qtb.41.1466832896884; Fri,
	24 Jun 2016 22:34:56 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 22:34:56 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 22:34:56 -0700 (PDT)
In-Reply-To: <576e10e7.e7c9c20a.77319.ffffdd64@mx.google.com>
References: <20160623132701.25067.8398@opal.openembedded.org>
	<20160623132705.46EBD50386@opal.openembedded.org>
	<576e10e7.e7c9c20a.77319.ffffdd64@mx.google.com>
Date: Fri, 24 Jun 2016 22:34:56 -0700
Message-ID: <CAMKF1sp131UH2j7yjw8YGqO_tfRvjoS0rKqeELM7WzvX-v8xuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: stelios mpantelas <www.mpantelasterios@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IM6RzqA6IFtvZS1jb21taXRzXSBbb3BlbmVtYmVkZGVkLWNvcmVdIDA4LzM4OiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQ6VXBncmFkZSB0byAxLjguMQ==?=
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
X-List-Received-Date: Sat, 25 Jun 2016 05:35:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

You need to unsubscribe from mailing list.

On Jun 24, 2016 10:04 PM, "stelios mpantelas" <www.mpantelasterios@gmail.co=
m>
wrote:

> Stop sending
> ------------------------------
> =CE=91=CF=80=CF=8C: git@git.openembedded.org
> =CE=A3=CF=84=CE=AC=CE=BB=CE=B8=CE=B7=CE=BA=CE=B5: =E2=80=8E23/=E2=80=8E6/=
=E2=80=8E2016 4:27 =CE=BC=CE=BC
> =CE=A0=CF=81=CE=BF=CF=82: openembedded-commits@lists.openembedded.org
> =CE=98=CE=AD=CE=BC=CE=B1: [oe-commits] [openembedded-core] 08/38:
> gstreamer1.0-plugins-bad:Upgrade to 1.8.1
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 6a326f2b37b0b49e1144428becda32400498c024
> Author: Khem Raj <raj.khem@gmail.com>
> AuthorDate: Thu Jun 16 21:23:57 2016 -0700
>
>     gstreamer1.0-plugins-bad: Upgrade to 1.8.1
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 28 ------------
> .../gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb    | 52
> ++++++++++++++++++++++
> 2 files changed, 52 insertions(+), 28 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.6.3.bb
> deleted file mode 100644
> index 8eb47c2..0000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -include gstreamer1.0-plugins-bad.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73a5855a8119deb017f5f13cf3270=
95d \
> -
> file://COPYING.LIB;md5=3D21682e4e8fea52413fd26c60acb907e5 \
> -
> file://gst/tta/crc32.h;beginline=3D12;endline=3D29;md5=3D27db269c575d1e53=
17fffca2d33b3b50
> \
> -
> file://gst/tta/filters.h;beginline=3D12;endline=3D29;md5=3D8a08270656f2f8=
ad7bb3655b83138e5a"
> -
> -# Note: The mpg123 plugin was moved to gst-plugins-ugly prior to the 1.7=
.2
> -# release, so this line should be removed during the update to 1.8.x
> -#
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3D08d8a=
efcdaaf89ecb6dd53ec1e4f95cd42d01664
> -PACKAGECONFIG[mpg123] =3D "--enable-mpg123,--disable-mpg123,mpg123"
> -
> -# Note: The gsettings plug-in was dropped prior to the 1.7.2 release,
> -# so this line should be removed during the update to 1.8.x
> -#
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3D91429=
1808ad10621d6a74031f3d46d45eef5a3a3
> -EXTRA_OECONF +=3D "--disable-gsettings"
> -
> -SRC_URI =3D " \
> -
> http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV=
}.tar.xz
> \
> -    file://configure-allow-to-disable-libssh2.patch \
> -    file://0001-glimagesink-Downrank-to-marginal.patch \
> -
> file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "4857adcafe41e4b9b8805cf88303bd55"
> -SRC_URI[sha256sum] =3D
> "971b29101d6a9c5e3fe94d99d977a227f58f0b2d29b6ca2c7f292052542b3a61"
> -
> -S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.8.1.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.8.1.bb
> new file mode 100644
> index 0000000..a240bcb
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
> @@ -0,0 +1,52 @@
> +include gstreamer1.0-plugins-bad.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73a5855a8119deb017f5f13cf3270=
95d \
> +
> file://COPYING.LIB;md5=3D21682e4e8fea52413fd26c60acb907e5 \
> +
> file://gst/tta/crc32.h;beginline=3D12;endline=3D29;md5=3D27db269c575d1e53=
17fffca2d33b3b50
> \
> +
> file://gst/tta/filters.h;beginline=3D12;endline=3D29;md5=3D8a08270656f2f8=
ad7bb3655b83138e5a"
> +
> +SRC_URI =3D " \
> +
> http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV=
}.tar.xz
> \
> +    file://configure-allow-to-disable-libssh2.patch \
> +    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch=
 \
> +    file://avoid-including-sys-poll.h-directly.patch \
> +    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
> +    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patc=
h
> \
> +"
> +SRC_URI[md5sum] =3D "e508da2a8a5c3d12264fe3415be2f451"
> +SRC_URI[sha256sum] =3D
> "0bbd58f363734fc0c4a620b2d6fb01d427fdafdbda7b90b4e15d03b751ca40f5"
> +
> +S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
> +
> +# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.in=
c
> to
> +# pass an additional --with-hls-crypto=3DXXX option (new in 1.7.x) and
> switch HLS
> +# AES decryption from nettle to openssl (ie a shared dependency with
> dtls).
> +# This should move back to the common .inc once the main recipe updates
> to 1.8.x
> +PACKAGECONFIG[hls] =3D "--enable-hls
> --with-hls-crypto=3Dopenssl,--disable-hls,openssl"
> +
> +# The tinyalsa plugin was added prior to the 1.7.2 release
> +#
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3Dc8bd7=
4fa9a81398f57d976c478d2043f30188684
> +PACKAGECONFIG[tinyalsa] =3D "--enable-tinyalsa,--disable-tinyalsa,tinyal=
sa"
> +
> +# The vulkan based video sink plugin was added prior to the 1.7.2 releas=
e
> +#
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3D5de6d=
d9f40629562acf90e35e1fa58464d66617d
> +PACKAGECONFIG[vulkan] =3D "--enable-vulkan,--disable-vulkan,libxcb"
> +
> +# The dependency-less netsim plugin was added prior to the 1.7.2 release
> +#
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3De3f9e=
854f08e82bfab11182c5a2aa6f9a0c73cd5
> +EXTRA_OECONF +=3D " \
> +    --enable-netsim \
> +"
> +
> +# In 1.6.2, the "--enable-hls" configure option generated an installable
> package
> +# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin
> package
> +# has become "gstreamer1.0-plugins-bad-hls". See:
> +#
> http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=3Defe622=
92a3d045126654d93239fdf4cc8e48ae08
> +
> +PACKAGESPLITFUNCS_append =3D " handle_hls_rename "
> +
> +python handle_hls_rename () {
> +    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls',
> 'gstreamer1.0-plugins-bad-fragmented')
> +    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls',
> 'gstreamer1.0-plugins-bad-fragmented')
> +    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls',
> 'gstreamer1.0-plugins-bad-fragmented')
> +}
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

