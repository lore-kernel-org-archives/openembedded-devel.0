Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RYDJ6-0004Hl-Bq for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 09:56:52 +0100
Received: from f053037255.adsl.alicedsl.de ([78.53.37.255]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RYDCd-0003Hu-A7 for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 08:50:11 +0000
Message-ID: <1323247803.32367.48.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Dec 2011 09:50:03 +0100
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A4DAE@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
	, <CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
	, <1323182142.4571.10.camel@mattotaupa>
	<ED3E0BCACD909541BA94A34C4A164D4C401A4DAE@post.tritech.se>
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
X-List-Received-Date: Wed, 07 Dec 2011 08:56:52 -0000
X-Groupsio-MsgNum: 35952
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-aRJv6R43H9hUzsLiMvNG"

--=-aRJv6R43H9hUzsLiMvNG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 06.12.2011, 15:40 +0000 schrieb Mats K=C3=A4rrman:
> > From: openembedded-devel-bounces@lists.openembedded.org [openembedded-d=
evel-bounces@lists.openembedded.org] on behalf of Paul Menzel [paulepanter@=
users.sourceforge.net]
> > Sent: Tuesday, December 06, 2011 3:35 PM

> > Am Dienstag, den 06.12.2011, 07:55 +0000 schrieb Mats K=C3=A4rrman:
> > > > From: openembedded-devel-bounces@lists.openembedded.org [openembedd=
ed-devel-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gm=
ail.com]
> > > > Sent: Monday, December 05, 2011 8:49 PM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam
> > > >
> > > > On Mon, Dec 5, 2011 at 9:42 AM, Mats K=C3=A4rrman <Mats.Karrman@tri=
tech.se> wrote:
> > > > > Hello Tom,
> > > > >
> > > > > Please pull this commit from here:
> > > > >
> > > > > git://github.com/mkarrman/openembedded
> > > > > Branch: maintenance
> > > > >
> > > > > Mats K=C3=A4rrman (1):
> > > > >      368c68a  libpam_1.1.1: remove directory preventing /var/run =
from being volatile.
> > > >
> > > > Where is this a backport from?  Thanks!
> >=20
> > > My local project...
> > > Maybe I went ahead of myself but the solution is ~equivalent to the
> > > solution applied in libpam recipes of oe-core but 1.1.1 does not exis=
t
> > > there and the corresponding fix was a part of the original recipes fo=
r
> > > later versions.
> >=20
> > so why not push it to OE-classic master first?
>=20
> Perhaps I missed the consensus of the "Plans for OE classic future" threa=
d?
> To my understanding pull requests from "somewhere" and master will sooner=
-than-later die was the way to go.

True. And a lot of developers answered they are still using OE-classic
including master. So they would profit from your fix too.

> Also, pushing requires write access to the repo (that I don't have) but I=
 can send a patch to the mailing list, if you like.

I would push it for you.


Thanks,

Paul

--=-aRJv6R43H9hUzsLiMvNG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7fKLsACgkQPX1aK2wOHVil+QCfaLt5ktQqTy7g0JPZrz+9VqcN
q5sAnihASy3zJZb/YimY6dKmrMOwdicR
=T72e
-----END PGP SIGNATURE-----

--=-aRJv6R43H9hUzsLiMvNG--
