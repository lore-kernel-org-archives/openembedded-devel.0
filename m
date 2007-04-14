Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1Hcf2m-0003Ua-Rv
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2007 11:59:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 8732A3081F1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 11:59:24 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05751-09 for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 11:59:20 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-81-173-229-195.netcologne.de
	[81.173.229.195]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 879843081E9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 11:58:59 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
References: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
Date: Sat, 14 Apr 2007 11:58:56 +0200
Message-Id: <1176544736.7958.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [RFC] Removal of GPL recipes
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
X-List-Received-Date: Sat, 14 Apr 2007 09:59:47 -0000
X-Groupsio-MsgNum: 1860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-en8jRCKFBS3aeosK/pNN"

--=-en8jRCKFBS3aeosK/pNN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey,

Am Freitag, den 13.04.2007, 23:48 +0200 schrieb Holger Freyther:
> Hey,
>=20
> I'm schocked that the following recipes are not compatible to our =20
> licensing policy and I would like to remove/relicense/rewrite them ASAP.
>=20
>=20
> ../org.openembedded.dev/packages/altboot/altboot_1.0.5.bb:4:# =20
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of =20
> the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.0.8.bb:4:# =20
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of =20
> the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.1.1=20
> +wip-20061123.bb:4:# License: GPL (see http://www.gnu.org/licenses/=20
> gpl.txt for a copy of the license)
> ../org.openembedded.dev/packages/altboot/altboot_svn.bb:4:# License: =20
> GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.1.1+wip-SVNR30.bb:=20
> 4:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy =20
> of the license))
> ../org.openembedded.dev/packages/images/essential-image.bb:3:# =20
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of =20
> the license)
> ../org.openembedded.dev/packages/images/essential-machine-image.bb:=20
> 3:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy =20
> of the license)
> ../org.openembedded.dev/packages/mplayer/mplayer-common.bb:3:# =20
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of =20
> the license)
>=20
> I will remove them by monday if no one complains.

You are welcome to relicense these _.bb_ file to MIT, looks like the
above slipped "under my radar"...

I myself will not be able to hack on OE until monday or tuesday night.
--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-en8jRCKFBS3aeosK/pNN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGIKXgPXyoPq8wMNkRAlnBAKDYU+v9bq3gPV9fnAOaQksV64tEFQCZATQQ
YnMj3vxNk0CpBkWDbkiT5z8=
=iCeu
-----END PGP SIGNATURE-----

--=-en8jRCKFBS3aeosK/pNN--
