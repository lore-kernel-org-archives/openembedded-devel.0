Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnTXY-0004gD-0l for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:42:04 +0200
Received: from f053041221.adsl.alicedsl.de ([78.53.41.221]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnTXB-0007Zj-SZ for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 09:41:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimHzXPoBOqbHN2Fq1wQc3JHiznX48BG8Tov3Coj@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
	<AANLkTikoa8bZuk-xbkbtbym2ST=zsy+_Ro9qGA5S7_Xp@mail.gmail.com>
	<AANLkTinYmjwS13hGmRf6yq1iQjq=0bAmNtAXxra3to7d@mail.gmail.com>
	<AANLkTimHzXPoBOqbHN2Fq1wQc3JHiznX48BG8Tov3Coj@mail.gmail.com>
Date: Mon, 23 Aug 2010 11:41:38 +0200
Message-ID: <1282556498.3853.19.camel@mattotaupa>
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
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 09:42:04 -0000
X-Groupsio-MsgNum: 22559
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-cnb9cWgdmyTbKXNYNsEd"

--=-cnb9cWgdmyTbKXNYNsEd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 23.08.2010, 07:45 +0200 schrieb Frans Meulenbroeks:
> 2010/8/23 AJ ONeal <coolaj86@gmail.com>:
> > I did
> >
> > git commit -m "[v2] blah blah blah"
>=20
> Not really the desired way as now [v2] becomes part of the commit message=
.

Git=E2=80=99s manual pages are very good: `git help format-patch`.
`--subject-prefix` is the option you are looking for to add =C2=BBv2=C2=AB.

> > git format-patch -1
> > git send-email *blah*


Thanks,

Paul

--=-cnb9cWgdmyTbKXNYNsEd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxyQlIACgkQPX1aK2wOHVggbwCeJFJaTCcmOtms5PvD9grYZeYI
q7sAn1s5a4Stshg+mIb/DY91EeVuVRWW
=mR+2
-----END PGP SIGNATURE-----

--=-cnb9cWgdmyTbKXNYNsEd--
