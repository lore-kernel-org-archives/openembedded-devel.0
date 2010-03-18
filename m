Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsCvf-0001SG-Kk for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 11:26:19 +0100
Received: from f053045153.adsl.alicedsl.de ([78.53.45.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsCsj-00089b-Ae for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 10:23:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Mar 2010 11:23:12 +0100
Message-ID: <1268907792.4619.5.camel@mattotaupa>
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
Subject: OE user manual: Packaging: Defining packages and their contents: Wildcards
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
X-List-Received-Date: Thu, 18 Mar 2010 10:26:24 -0000
X-Groupsio-MsgNum: 17813
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JSonTiBkODpx66xTVHHJ"

--=-JSonTiBkODpx66xTVHHJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


reading the OE user manual I wonder about the section =C2=BBWildcards=C2=AB
regarding packages [1].

There are some statements as the following.

        PACKAGES +=3D "FILES-${PN}-test"

Is that correct or should it be fixed?


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html#id428078

--=-JSonTiBkODpx66xTVHHJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuh/w8ACgkQPX1aK2wOHViYWgCaA1c8ackHSpccM7thjv4Eqxk2
riUAoI1DdB0bemJi3DiSTnrGU0WZ4JwF
=c9Kk
-----END PGP SIGNATURE-----

--=-JSonTiBkODpx66xTVHHJ--
