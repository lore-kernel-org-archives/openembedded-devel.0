Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1HmfAh-0006hI-Db
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2007 02:09:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id EB54C3081EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2007 02:08:26 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12035-05 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2007 02:08:24 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-87-78-53-91.netcologne.de
	[87.78.53.91]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 1A1EE3081E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2007 02:08:04 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4644B0D2.8020409@dominion.kabel.utwente.nl>
References: <4644ABCB.6080202@openhardware.net>
	<4644B0D2.8020409@dominion.kabel.utwente.nl>
Date: Sat, 12 May 2007 02:07:53 +0200
Message-Id: <1178928474.4954.18.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: do_rootfs fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 May 2007 00:09:15 -0000
X-Groupsio-MsgNum: 2046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-IklzB+HIlaGQRDMgebwc"

--=-IklzB+HIlaGQRDMgebwc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 11.05.2007, 20:07 +0200 schrieb Koen Kooi:

> All: Are we still going to wait 1.5 months with requiring 1.8.x? I've see=
n enough proof
> that 1.6.x is broken with current .dev, with no effort to fix it. "Giving=
 people time to
> prepare the upgrade" has now turned into "Stabbing user in the eye" :(
>=20
> regards,
>=20
> Koen

1.8.x has a show-stopper freeze-bug for some users ( including myself )
which has not been fixed or even looked into yet.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-IklzB+HIlaGQRDMgebwc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGRQVZPXyoPq8wMNkRAhTWAKCB3g8c3aoUfjnsLCYjGzBbxkdraACfU7E6
x4TgEEJgFbzLsivSLaTZoA0=
=ieLN
-----END PGP SIGNATURE-----

--=-IklzB+HIlaGQRDMgebwc--
