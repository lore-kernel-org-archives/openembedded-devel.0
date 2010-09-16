Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ow9L9-0005MW-54 for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 09:57:07 +0200
Received: from f053044210.adsl.alicedsl.de ([78.53.44.210]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ow9KN-00005k-3s for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 07:56:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284615893-18010-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
References: <1284615893-18010-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 16 Sep 2010 09:56:16 +0200
Message-ID: <1284623776.3825.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: Update recipe for all version
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
X-List-Received-Date: Thu, 16 Sep 2010 07:57:08 -0000
X-Groupsio-MsgNum: 23642
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-H/aPDq5W5Mk6DX5LsNI6"

--=-H/aPDq5W5Mk6DX5LsNI6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 16.09.2010, 14:44 +0900 schrieb Nobuhiro Iwamatsu:
> * Included sh4_set_fpscr.patch and sh4_set_fpscr_2.12.patch.
>   These patch provides patch of __set_fpscr prototype.
> * Included sh4_local-fpscr_values.patch.
>   This provides a patch maintaining __fpscr_values in libc.
>   This is taken in in Debian and codesourcery already.
>   This patch is necessary to have compatibility in these and openemdedded=
.
>=20
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---

[=E2=80=A6]

>  create mode 100644 recipes/eglibc/files/sh4_local-fpscr_values.patch
>  create mode 100644 recipes/eglibc/files/sh4_set_fpscr.patch
>  create mode 100644 recipes/eglibc/files/sh4_set_fpscr_2.12.patch

Could you please add more information to the patch headers [1]. Like,
were do they come from, links to more information why they are needed
and possibly upstream tickets or commits.

[=E2=80=A6]


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Push_patches_upstream

--=-H/aPDq5W5Mk6DX5LsNI6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyRzZoACgkQPX1aK2wOHVjDcACdH8Fx7iFcSLauHvheGs1RXmwk
4HUAniPQz76KbsUsPTf+pIFfeevZrX9q
=gOpr
-----END PGP SIGNATURE-----

--=-H/aPDq5W5Mk6DX5LsNI6--
