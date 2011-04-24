Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QE0Rd-0002uB-1V for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:37:53 +0200
Received: from f053043061.adsl.alicedsl.de ([78.53.43.61]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QE0Px-0005kX-0A for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 14:36:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20110423T144701-128@post.gmane.org>
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa> <4DACB16C.6050303@eric-weiss.de>
	<loom.20110423T113131-855@post.gmane.org>
	<1303553742.4551.2.camel@mattotaupa>
	<loom.20110423T144701-128@post.gmane.org>
Date: Sun, 24 Apr 2011 16:35:26 +0200
Message-ID: <1303655726.3956.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Sun, 24 Apr 2011 14:37:53 -0000
X-Groupsio-MsgNum: 31424
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Dw++H+852yGrZaCY9LSy"

--=-Dw++H+852yGrZaCY9LSy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear DmitryZ,


Am Samstag, den 23.04.2011, 12:58 +0000 schrieb DmitryZ:
> Paul Menzel <paulepanter <at> users.sourceforge.net> writes:
>=20
> > please update to latest master and make a new build from scratch, i. e.=
,
> > remove your build directory beforehand.
> >=20
> > You could also use `bitbake -c clean yourprogramname` before the upgrad=
e
> > to try to get rid of the wrong versions.

> Thanks for advice. I'm just trying your suggestions.

did it work?

> But just to let you know=20
> that I was updated to the master about three days ago. I just double chec=
ked=20
> which of the orc versions the OE downloaded in order to build the problem=
atic=20
> package and it was 0.4.13.

It is still there, but it will not be used by default.

> At the beginning of this thread it was said to try to=20
> build it instead of 0.4.12 with 0.4.10 where the defines for different ty=
pes=20
> still exist. However, it looks that the OE trying to build it with 0.4.13=
 where=20
> the types still omitted. Do you know about some patches that were applied=
 in a=20
> last three days or something.

No patches were applied as far as I know. Only Orc version 0.4.10 is
still used by default now.

> Just to let you know, I have been building the Angstrom console-image wit=
h=20
> eglibc for mini6410 machine. The preffered kernel version that came with =
OE git=20
> is 2.6.28 with stable patch 6, however it is impossible to build it since=
 the=20
> make oldconfig fails with ERROR that says that it mixes the implicit and =
normal=20
> rules, so I just needed to upgrade to some newer kernel. So I just upgrad=
ed it=20
> to the 2.6.37 and specifically kernel build succeeded.
> As being newbie to the whole stuff I was wondering if the all things some=
how=20
> have been in connection with one to other.

Thank you for the detailed information. But I do not think that it is
related.


Thanks,

Paul

--=-Dw++H+852yGrZaCY9LSy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk20NSgACgkQPX1aK2wOHVhGNACfStHd0qJHEqaSD1jwg4pmvGpl
BbYAn1uPP/S3s0PFSkCgFlC9ZRDTJKv/
=Ya2A
-----END PGP SIGNATURE-----

--=-Dw++H+852yGrZaCY9LSy--
