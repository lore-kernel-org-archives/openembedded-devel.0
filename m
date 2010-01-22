Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYKtN-0005Bx-Mi for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 15:53:48 +0100
Received: from f053040144.adsl.alicedsl.de ([78.53.40.144]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYKrC-0005KV-2K for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 14:51:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001221544.26770.christopher.lang@acurana.de>
References: <201001221544.26770.christopher.lang@acurana.de>
Date: Fri, 22 Jan 2010 15:51:28 +0100
Message-ID: <1264171888.14275.7.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New Recipe: svgalib
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
X-List-Received-Date: Fri, 22 Jan 2010 14:53:48 -0000
X-Groupsio-MsgNum: 16027
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zuDIYZbSivRFQhPvg+jn"

--=-zuDIYZbSivRFQhPvg+jn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christopher,


Am Freitag, den 22.01.2010, 15:44 +0100 schrieb Christopher Lang:
> and another one, old but sometimes quite useful: svgalib
> Checksums attached.
>=20
> Tested with OE from Jan 11 on Opensuse 11 building for machine "x86",=20
> distro "minimal".
>=20
> Checked with oe-stylize.py.

could you please send this as patch created with `git format-patch` and
a commit message. The requirements (Signed-off-by, etc.) are described
in [1].

You would ease the lives of the developers significantly, since review
(no decompress) and committing the patch is much easier.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy

--=-zuDIYZbSivRFQhPvg+jn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktZu2kACgkQPX1aK2wOHVhb9ACfUO0kZl1gf8ut7+wxT5BlUXqW
CM0AmgLs+UvNNbKkGljb4AwJCCDeUTB1
=yFkt
-----END PGP SIGNATURE-----

--=-zuDIYZbSivRFQhPvg+jn--
