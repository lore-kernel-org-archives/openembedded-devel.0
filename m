Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtLHH-0004WL-UQ for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 17:10:03 +0200
Received: from f053034117.adsl.alicedsl.de ([78.53.34.117]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtLCt-0000uS-QI for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 15:05:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c0f2c59a9aca500b4be0c93de85a2a4390b2b115.1313496291.git.anders@chargestorm.se>
References: <cover.1313496291.git.anders@chargestorm.se>
	<c0f2c59a9aca500b4be0c93de85a2a4390b2b115.1313496291.git.anders@chargestorm.se>
Date: Tue, 16 Aug 2011 17:05:26 +0200
Message-ID: <1313507126.4418.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH v2 1/2] ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
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
X-List-Received-Date: Tue, 16 Aug 2011 15:10:04 -0000
X-Groupsio-MsgNum: 33631
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GfShWAcAeIDL2LkfkXBH"

--=-GfShWAcAeIDL2LkfkXBH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Anders, Koen,


Am Dienstag, den 16.08.2011, 14:05 +0200 schrieb Anders Darander:
> Adding LIC_FILES_CHKSUM, otherwise it is identical to the oe version.
>=20
> Build tested on a custom ARM9 platform.
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-support/ckermit/ckermit_211.bb |   98 ++++++++++++++++++=
++++++
>  1 files changed, 98 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ckermit/ckermit_211.bb
>=20
> diff --git a/meta-oe/recipes-support/ckermit/ckermit_211.bb b/meta-oe/rec=
ipes-support/ckermit/ckermit_211.bb
> new file mode 100644
> index 0000000..88bc918
> --- /dev/null
> +++ b/meta-oe/recipes-support/ckermit/ckermit_211.bb
> @@ -0,0 +1,98 @@
> +DESCRIPTION =3D "C-Kermit is a combined serial and network communication=
 \
> +software package offering a consistent, medium-independent, \
> +cross-platform approach to connection establishment, terminal \
> +sessions, file transfer, character-set translation, and automation \
> +of communication tasks."
> +HOMEPAGE =3D "http://www.columbia.edu/kermit/"
> +SECTION =3D "console/network"
> +LICENSE =3D "Kermit"
> +LIC_FILES_CHKSUM =3D "file://COPYING.TXT;md5=3D17dabbd2543933464b6d32083=
c3a3596"
> +SRC_URI =3D "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;s=
ubdir=3D${BPN}-${PV}"
> +PR =3D "r3"

could you please edit this commit and make that `r0`.

[=E2=80=A6]

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-GfShWAcAeIDL2LkfkXBH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5KhzYACgkQPX1aK2wOHVhiZACfXUSl4XgA2UKfBHmDQZUKVQfK
vPkAn16GAWg2MmifZP9uB565TBUyxlGz
=K5Ic
-----END PGP SIGNATURE-----

--=-GfShWAcAeIDL2LkfkXBH--
