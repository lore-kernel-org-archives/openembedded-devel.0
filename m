Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nzzia-0004C5-1W for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 23:56:56 +0200
Received: from f053045106.adsl.alicedsl.de ([78.53.45.106]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NzzfL-0007PL-1b for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 21:53:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268608081.3809.6.camel@mattotaupa>
References: <1268482329.11170.31.camel@mattotaupa>
	<hnj0q5$luv$1@dough.gmane.org>  <1268608081.3809.6.camel@mattotaupa>
Date: Thu, 08 Apr 2010 23:53:32 +0200
Message-ID: <1270763612.29502.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-omap*/beagleboard/defconfig: Compile Ext4 support into Linux.
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
X-List-Received-Date: Thu, 08 Apr 2010 21:56:56 -0000
X-Groupsio-MsgNum: 18515
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Z6Y2QycHfklA+3fDXlU8"

--=-Z6Y2QycHfklA+3fDXlU8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen,


Am Montag, den 15.03.2010, 00:08 +0100 schrieb Paul Menzel:
> Am Sonntag, den 14.03.2010, 16:53 +0100 schrieb Koen Kooi:
> > Thanks for the patch! I have a huuuuge stack of changed queued for TI
> > platforms (beagle, hawk, omap3evm etc) that will be merged next week, s=
o
> > I recreated your patch on top of that:
> >=20
> > http://gitorious.org/angstrom/openembedded/commit/3891af0d4838f1445ee27=
f6be4258d558731f3ea
>=20
> Thanks for doing that. I updated the state in Patchwork.
>=20
>     $ ./pwclient update -s accepted 1711
>=20
> > And the branch:
> >=20
> > http://gitorious.org/angstrom/openembedded/commits/ti/staging

do you have an estimate when you will merge your changes.

[=E2=80=A6]


Thanks,

Paul



--=-Z6Y2QycHfklA+3fDXlU8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku+UFwACgkQPX1aK2wOHVg6kwCfSbS7baLVQWDLmZRooPiIBJm/
p2IAmwVIJJeVIrDO4tTb1Lu1G4KrZI4V
=9fwM
-----END PGP SIGNATURE-----

--=-Z6Y2QycHfklA+3fDXlU8--
