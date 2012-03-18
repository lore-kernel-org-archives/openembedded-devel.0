Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S9HCA-0007pD-1G for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 15:34:54 +0100
Received: from f053036091.adsl.alicedsl.de ([78.53.36.91]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S9H3s-000170-B4 for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 14:26:20 +0000
Message-ID: <1332080764.7678.29.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 15:26:04 +0100
In-Reply-To: <4F65E225.4080400@mlbassoc.com>
References: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
	<jk4j25$dat$1@dough.gmane.org> <20120318121834.GL3855@jama.jama.net>
	<4F65E225.4080400@mlbassoc.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] midori: Add project home page info
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
X-List-Received-Date: Sun, 18 Mar 2012 14:34:54 -0000
X-Groupsio-MsgNum: 37820
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-aUuY1gm0OlvGaLu5tDs+"

--=-aUuY1gm0OlvGaLu5tDs+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 18.03.2012, 07:24 -0600 schrieb Gary Thomas:
> On 2012-03-18 06:18, Martin Jansa wrote:
> > On Sun, Mar 18, 2012 at 01:05:20PM +0100, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Op 16-03-12 20:41, Gary Thomas schreef:
> >>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>  ---
> >>> meta-oe/recipes-connectivity/midori/midori.inc |    1 + 1 files chang=
ed,
> >>> 1 insertions(+), 0 deletions(-)
> >>>
> >>> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc
> >>> b/meta-oe/recipes-connectivity/midori/midori.inc index 4c7147e..dccb3=
ee
> >>> 100644 --- a/meta-oe/recipes-connectivity/midori/midori.inc +++
> >>> b/meta-oe/recipes-connectivity/midori/midori.inc @@ -1,4 +1,5 @@
> >>> DESCRIPTION =3D "Midori is a lightweight web browser." +HOMEPAGE =3D
> >>> "http://www.twotoasts.de/index.php?/pages/midori_summary.html" LICENS=
E =3D
> >>> "LGPLv2.1" LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
> >>
> >> Missing PR bump
> >
> > Khem applied it before my version upgrade, so it should be fine in
> > feeds.
>=20
> Plus, it's informational only, so why bump the PR?

Because the metadata is included in packages as far as I know. So
package manager can display the homepage field.

> That's silly.

Please use another wording next time.


Thanks,

Paul

--=-aUuY1gm0OlvGaLu5tDs+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9l8HwACgkQPX1aK2wOHVil/QCdHsCv2rf4UvXpuxgUsxOYh0EL
bTMAn2PapA6JuJmVBeEpcYGC6KaTzgov
=+b0M
-----END PGP SIGNATURE-----

--=-aUuY1gm0OlvGaLu5tDs+--
