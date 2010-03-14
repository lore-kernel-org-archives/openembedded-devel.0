Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nqwxj-00065f-CP for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 00:11:15 +0100
Received: from g231208203.adsl.alicedsl.de ([92.231.208.203]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nqwup-0002L4-VS for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 23:08:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hnj0q5$luv$1@dough.gmane.org>
References: <1268482329.11170.31.camel@mattotaupa>
	<hnj0q5$luv$1@dough.gmane.org>
Date: Mon, 15 Mar 2010 00:08:01 +0100
Message-ID: <1268608081.3809.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Sun, 14 Mar 2010 23:11:15 -0000
X-Groupsio-MsgNum: 17601
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-phu9CLfRB7WptzKPQGqu"

--=-phu9CLfRB7WptzKPQGqu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen,


Am Sonntag, den 14.03.2010, 16:53 +0100 schrieb Koen Kooi:
> Thanks for the patch! I have a huuuuge stack of changed queued for TI
> platforms (beagle, hawk, omap3evm etc) that will be merged next week, so
> I recreated your patch on top of that:
>=20
> http://gitorious.org/angstrom/openembedded/commit/3891af0d4838f1445ee27f6=
be4258d558731f3ea

Thanks for doing that. I updated the state in Patchwork.

    $ ./pwclient update -s accepted 1711

> And the branch:
>=20
> http://gitorious.org/angstrom/openembedded/commits/ti/staging
>=20
> Please let me know if that commit matches your intent.

Yes it is. Besides that you shortened the commit message a little bit
XorA told me on IRC to formulate. ;-) Since you are in the TSC I am ok
with this.


Thanks,

Paul

--=-phu9CLfRB7WptzKPQGqu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkudbEsACgkQPX1aK2wOHVjIRACdGdycXnmy7ajtxB8VlXKmCGpq
JpcAoIkZ/6uQfh0VGJKtXWjiJCt8qJVn
=gz4x
-----END PGP SIGNATURE-----

--=-phu9CLfRB7WptzKPQGqu--
