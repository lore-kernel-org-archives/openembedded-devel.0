Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RXwE2-0001e0-Vw for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 15:42:31 +0100
Received: from g225080061.adsl.alicedsl.de ([92.225.80.61]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RXw7Z-0000hQ-90 for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 14:35:49 +0000
Message-ID: <1323182142.4571.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Dec 2011 15:35:42 +0100
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
	, <CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Tue, 06 Dec 2011 14:42:31 -0000
X-Groupsio-MsgNum: 35923
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-HLjocancwNpsBtycRFga"

--=-HLjocancwNpsBtycRFga
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mats,


Am Dienstag, den 06.12.2011, 07:55 +0000 schrieb Mats K=C3=A4rrman:
> > From: openembedded-devel-bounces@lists.openembedded.org [openembedded-d=
evel-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.=
com]
> > Sent: Monday, December 05, 2011 8:49 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam
> >=20
> > On Mon, Dec 5, 2011 at 9:42 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech=
.se> wrote:
> > > Hello Tom,
> > >
> > > Please pull this commit from here:
> > >
> > > git://github.com/mkarrman/openembedded
> > > Branch: maintenance
> > >
> > > Mats K=C3=A4rrman (1):
> > >      368c68a  libpam_1.1.1: remove directory preventing /var/run from=
 being volatile.
> >=20
> > Where is this a backport from?  Thanks!

> My local project...
> Maybe I went ahead of myself but the solution is ~equivalent to the
> solution applied in libpam recipes of oe-core but 1.1.1 does not exist
> there and the corresponding fix was a part of the original recipes for
> later versions.

so why not push it to OE-classic master first?


Thanks,

Paul

--=-HLjocancwNpsBtycRFga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7eKD8ACgkQPX1aK2wOHVjciACeNm+ahu9vMkHkDgV5R+akWiPq
FyMAn1rvEnzFV/4+3VWAzHojWxb+/cww
=wdRA
-----END PGP SIGNATURE-----

--=-HLjocancwNpsBtycRFga--
