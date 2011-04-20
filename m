Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCTid-0006I7-Ug for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:29:08 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCTgs-0002h8-W7 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:27:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iom5kt$2h5$1@dough.gmane.org>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
	<iom5kt$2h5$1@dough.gmane.org>
Date: Wed, 20 Apr 2011 11:26:45 +0200
Message-ID: <1303291605.3979.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: state of oe and meta-oe (was: 0/6] add syslog-ng/eventlog/libnet)
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
X-List-Received-Date: Wed, 20 Apr 2011 09:29:08 -0000
X-Groupsio-MsgNum: 31352
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-I/RJJWheAqhbuREDQ/gy"

--=-I/RJJWheAqhbuREDQ/gy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 20.04.2011, 10:31 +0200 schrieb Koen Kooi:
> On 20-04-11 09:18, Michael Lippautz wrote:

[=E2=80=A6]

> Could please squasH
>=20
> >   syslog-ng: Re-import 2.0.5 from org.oe.dev
> >   syslog-ng: Update to 3.2.2
>=20
> and
>=20
> >   eventlog: Re-import 0.2.5 from org.oe.dev
> >   eventlog: Clean recipe and upgrade to 0.2.12
>=20
> and
>=20
> >   libnet: Re-import 1.1.2.1 from org.oe.dev
> >   libnet: Clean and upgrade (see below)
>=20
> Being able to trace the origin isn't worth having broken recipes at
> various points due to missing checksums IMO.
> If people disagree with that I'm willing to stance my stance on that,
> though.

Could you please clarify, what the current situation between the =E2=80=9Co=
ld=E2=80=9D
OpenEmbedded repository and the layers, for example meta-oe, is.

I thought at some point the old repository would be imported, so that
the history/commit log will be preserved. Therefore I think it would be
best to update the recipes in OE and then get them into oe-meta.

I am sorry for my ignorance. I try to follow the recent changes, but it
takes too much time to keep track. If there is a summary of the current
state I would be happy to read it.


Thanks,

Paul

--=-I/RJJWheAqhbuREDQ/gy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2ups8ACgkQPX1aK2wOHVi2QQCfR7/OFN2kVIS7eh175j8Bc3RG
pqkAnAosV503eO2n2WYuSDj5Tyigxk3M
=p/e5
-----END PGP SIGNATURE-----

--=-I/RJJWheAqhbuREDQ/gy--
