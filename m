Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TSy8G-0007HW-5t
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 23:48:32 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so4102802pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=wC9Gzb+lQgrTl5jSzuTGv6Ro5bHVYMF1UWfUwOPzegA=;
	b=IlpktVm9vE8x6L4HUlhxtgaSHTdI381qpsI1sOlFvH5vku39ADYSxs2IroNp+1NVws
	K2TMbGMRK39bD0DMaDcjt768WuLfQf+HUOfd37prIBYrwfgPWXj+iNgnu2RvOiUTT8iJ
	daZ2r98rHNNvJ8bp2vqtsTtRYGip8kvS6cEmbKrbk0GkobAJhSoDh/FBiF5xag6I0l5H
	+wnrK+MLpF0KKKcSUZShc/5OdW5yMmodMa4gzmURuemUi9WgkOw5uKtmY60HNbNLldjZ
	DaYxX4quHcVttYfa2CwfKzwUtpCsvCs8dxnq9w8j+/lzUXUzu/mFB4PFQALO+itKHvzL
	zm0g==
Received: by 10.66.85.66 with SMTP id f2mr87111287paz.56.1351550096894;
	Mon, 29 Oct 2012 15:34:56 -0700 (PDT)
Received: from bill-the-cat (ip68-230-53-52.ph.ph.cox.net. [68.230.53.52])
	by mx.google.com with ESMTPS id g1sm5217636pax.21.2012.10.29.15.34.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 15:34:55 -0700 (PDT)
Date: Mon, 29 Oct 2012 15:34:52 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20121029223452.GG11581@bill-the-cat>
References: <cover.1351244110.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1351244110.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20121026
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
X-List-Received-Date: Mon, 29 Oct 2012 22:48:32 -0000
X-Groupsio-MsgNum: 41351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline

--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2012 at 11:36:28AM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull this commit which updates opkg-utils to the latest
> upstream version also used in oe-core.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit 0609a1cf10887b5f5d69cc4c7baba35beebb3f=
16:
>=20
>   Merge branch 'pull-request-3' of git://github.com/sledz/oe into 2011.03=
-maintenance (2012-10-09 07:41:40 -0700)
>   https://github.com/sledz/oe/tree/pull-request-opkg-utils
>=20
> Steffen Sledz (1):
>   opkg-utils: bump SRCREV to latest
>=20
>  recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

--=20
Tom

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCPBIwACgkQdZngf2G4WwN7jgCeNFJUV20I2J+KioTn2Zcjm3ip
oD0Anj4AAcMWtyQK4k6fStLGVDP5zRfK
=dlQO
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--
