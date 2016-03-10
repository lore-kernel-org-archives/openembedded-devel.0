Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D671C6FF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:30:47 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so16193451wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 23:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rUSrJ5q6AD6EWW1ttKtnrFa7v7P7JGYtb52a+Kwf+h0=;
	b=huGu3fGR9riAinmFj09Z4vTHYLla/ohfG493DERXDyLaM40yLvkg2cojiKiHH+vv25
	BjNO1Toykcjfzh80XCykmQXU04SVhBLsFpzCs9svm7fTZCp5NWwLDtjeq3/Y/co2LNQ3
	hN93A9+HrYozTvRdlE3KE5kp3I54Fo8+b/W9wicOlTNihE5jBAtNDzIs9KXYRnwYgvHj
	MAjQhhAIjNmRIj+WjH7DKU18rXbrOFNfwJKefNL+B/KhwF647crP7tFpwpaDaxagyQf4
	+G/zdaBHzOeayjz6FTKcvEf42rOF8d1KobgVOmGlseVsJhpVqHN03iq4z3dTi3Rf/BLu
	sM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rUSrJ5q6AD6EWW1ttKtnrFa7v7P7JGYtb52a+Kwf+h0=;
	b=C5lUEm+22K9EqdhzhxnSBTYkoeOQfgsi7sMPLRhdU9ccxNmlTVsgT8EjapyCsilGNA
	3i/+MytCzTQhMt91xucB27GvfcfzczPEB/7mMNY03Dy6HIWm3t9BtTWGIllIybpiQg5s
	hHrI5YKuPDKOg2e1iR8H3K8Yoxskkozp3Nx7KQpFjnZgDxP527j76bmlke15yPN7xJL2
	BqoOpa9o8I7w6zf9k2BusLwPHsDRKryCzy9/iYFDIP6nh5Y/WAIhtC2cH29pmTtgK/Ix
	mWSJ/l0KClMAqYrLvf6vUaUYDqSNmLl6Ls6GlHNR4JXZW//c1Ns12yxWTwdTUcLwQdTZ
	WuLw==
X-Gm-Message-State: AD7BkJIfrSoSehvdM9mkP39XgkxgSkxfZh/u2p4qZVcwCpbH079iW7u7rQc1wVBXppQusA==
X-Received: by 10.28.132.17 with SMTP id g17mr2098303wmd.63.1457595047789;
	Wed, 09 Mar 2016 23:30:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i2sm2098059wje.22.2016.03.09.23.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 23:30:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 08:33:40 +0100
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20160310073340.GR2542@jama>
References: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
	<20160309191532.GI2542@jama> <56E0FB3F.3020004@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56E0FB3F.3020004@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 07:30:48 -0000
X-Groupsio-MsgNum: 60442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EcLUEBHJhOmOUQ0C"
Content-Disposition: inline

--EcLUEBHJhOmOUQ0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 05:42:39AM +0100, Gary Thomas wrote:
> On 2016-03-09 20:15, Martin Jansa wrote:
> > On Wed, Mar 09, 2016 at 07:20:33AM +0100, Gary Thomas wrote:
> >> mpv is a fork of mplayer2 and MPlayer. It shares some features with th=
e former projects while introducing many more.
> >>
> >> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >> ---
> >>   meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60 ++++++++++++++=
++++++++++
> >>   1 file changed, 60 insertions(+)
> >>   create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>
> >> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-o=
e/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >> new file mode 100644
> >> index 0000000..37e4b02
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >> @@ -0,0 +1,60 @@
> >> +SUMMARY =3D "Open Source multimedia player"
> >> +SECTION =3D "multimedia"
> >> +HOMEPAGE =3D "http://www.mpv.io/"
> >> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrnsaver"
> >> +
> >> +# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
> >> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >> +
> >> +LICENSE =3D "GPLv2+"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d259=
5441cb"
> >> +
> >> +SRC_URI =3D "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;=
name=3Dmpv \
> >> +           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=
=3Dwaf \
> >> +"
> >> +SRC_URI[mpv.md5sum] =3D "9042bd3fbff2bc8ba0b7fadaa4a22101"
> >> +SRC_URI[mpv.sha256sum] =3D "7d31217ba8572f364fcea2955733f821374ae6d8c=
6d8f22f8bc63c44c0400bdc"
> >> +SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
> >> +SRC_URI[waf.sha256sum] =3D "01bf2beab2106d1558800c8709bc2c8e496d3da4a=
2ca343fe091f22fca60c98b"
> >> +
> >> +EXTRA_OECONF =3D " \
> >> +    --prefix=3D${D}/usr \
> > why not ${prefix} and does it really need to be prefixed with ${D}
> > (unlike mandir bellow)? Ugly waf.

What about ${D}?

> >> +    --mandir=3D${mandir} \
> >> +    --target=3D${SIMPLE_TARGET_SYS} \
> >> +    --disable-gl \
> >> +    --disable-libsmbclient \
> >> +    --disable-libass \
> >> +    --disable-lua \
> >> +    --disable-libass-osd \
> >> +    --disable-encoding \
> >> +    --disable-libbluray \
> >> +    --disable-dvdread \
> >> +    --disable-dvdnav \
> >> +    --disable-cdda \
> >> +    --disable-enca \
> >> +    --disable-libguess \
> >> +    --disable-uchardet \
> >> +    --disable-rubberband \
> >> +    --disable-lcms2 \
> >> +    --disable-vapoursynth \
> >> +    --disable-vapoursynth-lazy \
> >> +    --enable-libarchive \
> >> +"
> >> +
> >> +do_configure() {
> >> +    if [ ! -L ../waf ]; then
> >> +        chmod a+x ../waf-1.8.12
> >> +	ln -s waf-1.8.12 ../waf
> >> +    fi
> >> +    ../waf configure ${EXTRA_OECONF}
> >> +}
> >> +
> >> +do_compile () {
> >> +    ../waf build
> >> +}
> >> +
> >> +do_install() {
> >> +    ../waf install
> >> +}
> >> +
> >> +FILES_${PN} +=3D "/usr/"
> >
> > ${prefix}?
> >
> > Does it install files in strange directories not covered by standard
> > FILES?
> >
>=20
> Use of ${prefix} does seem correct, I've updated the recipe.
> Patch v2 has been dispatched, including a required update to
> the libass package which was necessary to get a fully functional
> mpv.

Does it install files in strange directories not covered by standard
FILES?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EcLUEBHJhOmOUQ0C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhI1MACgkQN1Ujt2V2gBy07ACfYtr2Yl3QHYLMqtygeT0EcDUc
c6wAoJeXYZ9c6eTbQQteWnNRAiR9lwYs
=khRJ
-----END PGP SIGNATURE-----

--EcLUEBHJhOmOUQ0C--
