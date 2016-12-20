Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 67EA7772DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:32:31 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id j10so27928831wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HSBV3WcxUeDJ1PpVEcj+w9gjLBwDgYldeT4k1jL5yeQ=;
	b=uOgAwtA1iVbfoHj6w9kpWPSeJu6KXWKOuNh6huZp7EKgdz0HerOWux8dAV+JW7Y4sL
	jTpekj/xorfnQsnVQqUf0i0vbKbgNj6z/SPGPQ+y0lEGB9MAhhXyhuSJcBGXYPKNoC78
	qxmDA/9gpo/ZiSxapYRRJ7N/NbqUl0ymOZBvQyYOnIMJXLln02oOrtlHDOdHiow3Q2k8
	8tOxNeCwdAOr9eHvZo7A8j/Hg9UkO9V2Xuom1RFS4IfSioXtANIwaOIMhTPrIeImZuvv
	ODq9bf3DSFnSM4KUBqtlMVMVYwCioch95R2jOS3QvvY2fWCbOc65PcC6l1S5D5vBCoVH
	gLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HSBV3WcxUeDJ1PpVEcj+w9gjLBwDgYldeT4k1jL5yeQ=;
	b=LlLbHYlY62JncNENAjrlVuiw0qaRE878cndyTKJ5EvLSuL+OjWLqJVztwoA01vRSkH
	EY7GMs/kU5Vryec9E+xQjkltpkg2M/375b9NYBRQm3i+W5AxEnGi0weWnnARLewdsgep
	AVMYg6QaVA78Dymxf1Oh5TBkCElaWzNhLW/PKhsl+K/Ad2aDFK/PNSU7rt4IeyGRzeuS
	2X29tPchThC16Ss/Wea9YL+tzGTll1VyimH9vQbHZ89UktHBF+/ST/+v3YeoC/cQWlT2
	m/pcA/JUFV/m2rsdnioIYOuhnpDBDmcHDUafBEQwBQZUIQ69yipC1oyD5N/Hlhctyeuf
	jxNw==
X-Gm-Message-State: AIkVDXID4CTChezhE1l1e7YrL1JEdmaoL4WSdkgEGjrHNNTKQngbDwq5nuWP99nQkwh33w==
X-Received: by 10.194.141.98 with SMTP id rn2mr8036078wjb.1.1482244352681;
	Tue, 20 Dec 2016 06:32:32 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w18sm22451624wme.9.2016.12.20.06.32.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 06:32:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 15:32:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220143231.GG3275@jama>
References: <20161216035947.18909-1-raj.khem@gmail.com>
	<20161216035947.18909-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161216035947.18909-2-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-networking][PATCH 2/3] usrsctp: Add recipe
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
X-List-Received-Date: Tue, 20 Dec 2016 14:32:32 -0000
X-Groupsio-MsgNum: 64436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline

--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2016 at 07:59:46PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-protocols/usrsctp/usrsctp_git.bb       | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/m=
eta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> new file mode 100644
> index 0000000..291eaa9
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "This is a userland SCTP stack supporting FreeBSD, Linux=
, Mac OS X and Windows."
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dffcf846341f3856d79a483eafa=
18e2a5"
> +
> +SRC_URI =3D "git://github.com/sctplab/usrsctp;protocol=3Dhttps;branch=3D=
master"
> +SRCREV =3D "dbfc1b8c4cf1a46a4d8987ba542d5ff06bdaf14c"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS +=3D "openssl"

Fails to build here:
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuar=
m.20161218_140914.log//3_min/failed/usrsctp.log

 Makefile.am: installing './INSTALL'
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: error: required file './README' not found
| Makefile.am: error: required file './AUTHORS' not found
| Makefile.am: error: required file './ChangeLog' not found
| Makefile.am: installing './COPYING' using GNU General Public License
v3 file
| Makefile.am:     Consider adding the COPYING file to the version
control system
| Makefile.am:     for your code, to avoid questions about which license
your project uses
| programs/Makefile.am: installing './depcomp'
| autoreconf: automake failed with exit status: 1


> +
> +CFLAGS  +=3D "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
> +LDFLAGS +=3D "-lssl -lcrypto"
> +
> +PACKAGECONFIG ?=3D "disablewarnings"
> +PACKAGECONFIG[disablewarnings] =3D "--disable-warnings-as-errors,,"
> +
> +EXTRA_OECONF +=3D "--disable-inet \
> +                 --disable-inet6 \
> +                 --disable-shared \
> +                 --disable-debug \
> +               "
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

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFlA/wAKCRA3VSO3ZXaA
HAxkAJwOgTI+Pu3wpWIMqVs8dbHn5LZPuwCgm4VYn2boDWbHKdO6jjTUf3lqUP8=
=b+2z
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
