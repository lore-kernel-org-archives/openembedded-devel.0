Return-Path: <joe@deserted.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id D96A260071
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 17:34:28 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1878754eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 10:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=jsISbsjQL4upT76vgZOow9btl00V2EaE5hggkFF/R7A=;
	b=FHpa1qAR2jHQRXsEE1OHtHgHGr3Ye1yt/mk5U6nWgcLy3ztBbykA7TtnWV4JOJZioc
	nD1f6cKX2eZHo6I+X5VpMgnzKT2NW9lR6BLr7Bhr3hvXYxY4jYRyBonkTFsI5Mgw2hCb
	YsnP/5tGZntoaojjxofc4t/u7bLD6l26A5gtPSf2pHozROgmYYy66uwkNFhokpwZchES
	AtIODy7r1pBzWYDpt/683FaslKq8R0i8VvyjAiMa05OFr+Ry5BLt/FY51HoSc5ZZfbJx
	NzgK8Mk4K3c1uKE/jo2dt9LAGps9i+c5s246wgu6xDhU9fUW96pG3EQMqEujXcIXLPyc
	SnUw==
X-Gm-Message-State: ALoCoQnq8Z9HgnhZKz+nyzUaMmOo7SFk8M5o+i2c28d0AMXpQIYuIe+73ozUhvNA6RfEgusIGN6B
X-Received: by 10.15.98.194 with SMTP id bj42mr39194161eeb.12.1379957670290;
	Mon, 23 Sep 2013 10:34:30 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h52sm44019757eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 10:34:29 -0700 (PDT)
Date: Mon, 23 Sep 2013 13:34:25 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130923173423.GD25887@deserted.net>
References: <1379928007-28803-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1379928007-28803-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 3/3] barnyard: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 17:34:30 -0000
X-Groupsio-MsgNum: 46309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline

--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 3/3] barnyard:  add recipe] On 13.09.23 (Mon =
17:20) b40290@freescale.com wrote:

> From: Chunrong Guo <B40290@freescale.com>
>=20
>   *Barnyard is a output system for Snort
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../barnyard/barnyard_0.2.0.bb                     |   19 ++++++++++++++=
+++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/barnyard/barnyar=
d_0.2.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0=
=2Ebb b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
> new file mode 100644
> index 0000000..c5e0e78
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Barnyard is a output system for Snort."
> +HOMEPAGE =3D "http://www.snort.org/"
> +LICENSE =3D "QPL"

I think this is QPL-1.0.

> +LIC_FILES_CHKSUM =3D "file://LICENSE.QPL;md5=3D1b8ff8c0012b5a2d647357699=
bf44b41"
> +
> +DEPENDS =3D "libpcap"
> +
> +SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
> +          "

In line with my other request about SRC_URI formatting, can you update
this as well?  I think you can remove the ";name=3Dtarball" piece and you
can move the bottom " back up against the left margin.

I'm curious, too, about the SRC_URI itself.  Why GENTOO_MIRROR instead
of the SourceForge site?

Also, do you really need Barnyard and not Barnyard2?  Barnyard2 is the
one currently referenced on snort.org and it appears to be a full
re-write.  Since the original Barnyard appears to be somewhat idle, I'd
be more inclined to adopt Barnyard2 and leave the older version behind.
Perhaps there's a good reason to use the older one, though.  I can
surely be convinced.  :-)

> +SRC_URI[tarball.md5sum] =3D "be3283028cf414b52b220308ceb411e9"
> +SRC_URI[tarball.sha256sum] =3D "09e0f8e095e79cfe70ea069d13e7d02521a504a1=
f400a45556a634dccfd31a3a"
> +
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +	#fix hardcoded include path
> +	sed -i -e 's:extra_incl=3D-I/usr/include/pcap::g' ${S}/configure.in
> +}
> +

This is probably a fine solution for the snort host include path issue,
too.

Thanks.

--=20
-Joe MacDonald.
:wq

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJAe58ACgkQwFvcllog0Xz75gCgjNQGeKfzWz+yIvaLe0cSxkQ9
d5AAoKlw7XBu69Fdtsvs4t9OBbFCckqr
=nzON
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
