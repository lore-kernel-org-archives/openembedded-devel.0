Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCC9D71A32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:47:46 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y205so5205301qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TMnFND9cfzJfo2l48aLyovmqDzZHqTbPd6DDpgHRNWM=;
	b=jVWgfdMJdhvYWGYyhNujkoQGWs5cLXHH+fZ4/ppq1XiVzQaRsVkoAdaLD/Qyi0Ad6G
	Zmnl9mgBPNOWL8GXZDpsw3TfEfgavDyR6bG51vP1eehC04olwAG5IUvIB4eNfKrM3hN9
	MhNtjlvEXEKQRwRgfHwt2sh20Upw/rl1z8TwzvDOb6jXRcZX3y0GwDR1rNEBRVuIwWwd
	z4UE2lxBVWvnWXZnSDiIJeYXQ0TC7qoap9I8xW9CWc8msKL3nSDsTkNu9Pe0QZ/J/xY6
	ZqJEnFMfzxwZIbj01ztnZjX+bukqTaWvauv5/Zs5BgYMWcNz/mkCU5T2p9gEAdzXb/EM
	bqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TMnFND9cfzJfo2l48aLyovmqDzZHqTbPd6DDpgHRNWM=;
	b=ds9B9nY+utH7WvTxBHtZEDjcIHH6KR7g+c/0reD3CpwS93N/2PdpuOJ9zFFs7IiVH4
	FT/wGnrolHa/XVSHAs/OAKGs1anSAp5oLFV6w2wnfhPZF4aoNdP/zxaitMq5LTuUhJzz
	QmAgwyrHik4sMmYenuyy1yM5zMek0eHIMFcaDbE0anJjGRf3WyqBMuQiBMD2idvmq55/
	DScvaDJgJSbLczJaIjGpjx0eOoLIKA6me2hKfpn+mnZ66rApOK8nvn7VisnJ3B6A0Wox
	PrChN7FpflrvnBY0MljSBWjYhBpz2EzimBmgFTeMrSp3M9S5jZ7Us9nokjU+odVx7wvb
	JPLA==
X-Gm-Message-State: AKaTC01/Wet81mTzi0xtx5ZM1bGDcBY/t9zSYlTepEUpodXlwqhCmAxqJTqpE0M3R6UuEQ==
X-Received: by 10.194.69.230 with SMTP id h6mr17271826wju.63.1479833267342;
	Tue, 22 Nov 2016 08:47:47 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l2sm31822634wji.7.2016.11.22.08.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Nov 2016 08:47:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Nov 2016 17:47:47 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161122164747.GA3348@jama>
References: <20161103101650.31105-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161103101650.31105-1-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] libvdpau: Add recipe
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
X-List-Received-Date: Tue, 22 Nov 2016 16:47:47 -0000
X-Groupsio-MsgNum: 63946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 03:16:50AM -0700, Khem Raj wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Needed for x86 machines
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This seems to break vlc:

http://errors.yoctoproject.org/Errors/Details/104697/

> ---
>  meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23 ++++++++++++++++++++=
+++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>=20
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/rec=
ipes-graphics/vdpau/libvdpau_git.bb
> new file mode 100644
> index 0000000..31f4df4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Video Decode and Presentation API for UNIX"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D83af8811a28727a13f04132cc33b7=
f58"
> +
> +DEPENDS =3D "virtual/libx11 libxext dri2proto"
> +
> +PV =3D "1.1.1+git${SRCPV}"
> +
> +SRCREV =3D "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
> +SRC_URI =3D "git://anongit.freedesktop.org/vdpau/libvdpau"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +do_install_append() {
> +    rm -f ${D}${libdir}/*/*.la
> +}
> +
> +FILES_${PN}-dbg +=3D "${libdir}/vdpau/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/vdpau/lib*${SOLIBSDEV}"
> +FILES_${PN} +=3D "${libdir}/vdpau/lib*${SOLIBS}"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDR2sgAKCRA3VSO3ZXaA
HLuKAJ9n4bPBy3nvsMRB49EMNyi2IZVnHgCgoakRlCHdYlOrQGqNotOjS9bV410=
=eiOU
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
