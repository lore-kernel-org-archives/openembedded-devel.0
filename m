Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvnFO-0001ki-1F for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 09:49:26 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvnCJ-0004sk-78 for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 07:46:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003280840.35570.ml@vdm-design.de>
References: <1269730499.4033.176.camel@mattotaupa>
	<201003280840.35570.ml@vdm-design.de>
Date: Sun, 28 Mar 2010 09:46:13 +0200
Message-ID: <1269762373.3693.3.camel@mattotaupa>
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
Subject: Re: enna: do_configure failed: automake: unknown warning category `cross'
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
X-List-Received-Date: Sun, 28 Mar 2010 07:49:26 -0000
X-Groupsio-MsgNum: 18185
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mxrj0p8goujy+GL+AiIe"

--=-mxrj0p8goujy+GL+AiIe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 28.03.2010, 08:40 +0200 schrieb Thomas Zimmermann:
> Am Samstag 27 M=C3=A4rz 2010 23:54:59 schrieb Paul Menzel:

[=E2=80=A6]

> > I am trying to write the recipe for Enna [1].
>=20
> There already is a recipe for the svn version of enna, so no need to make=
 a=20
> new one. Just upgrade the old one:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/e17/enna_=
svn.bb

I know. But it is not useful since almost everything changed (`SRC_URI`,
`DEPENDS`, =E2=80=A6)

So consider my recipe as a upgraded recipe. But I still get the same
problems.

Maybe I should send my current status as patches.


Thanks,

Paul

--=-mxrj0p8goujy+GL+AiIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvCT4ACgkQPX1aK2wOHVhecwCfQDzSi5EXpre2aq+hnQnjyCwA
PnkAn2egGWEI1Y2m3ix+MVZiYVvClgPF
=pFHk
-----END PGP SIGNATURE-----

--=-mxrj0p8goujy+GL+AiIe--
