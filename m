Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqxMY-0004mT-Rz for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 00:36:56 +0100
Received: from g231208203.adsl.alicedsl.de ([92.231.208.203]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqxJf-0000SH-VX for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 23:33:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 00:33:50 +0100
Message-ID: <1268609630.3809.13.camel@mattotaupa>
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
Subject: enna: Does someone have an updated recipe for geexbox repositories?
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
X-List-Received-Date: Sun, 14 Mar 2010 23:36:56 -0000
X-Groupsio-MsgNum: 17607
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lpMeps/q6q9k1UMwpae3"

--=-lpMeps/q6q9k1UMwpae3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


        $ bitbake enna
        [=E2=80=A6]
        ERROR: Task 7 (/srv/oe/openembedded/recipes/e17/enna_svn.bb, do_con=
figure) failed
        [=E2=80=A6]
        $ more /srv/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/enna=
-0.2.0+svnr46510-r1/enna/README
        Enna have been removed from E SVN (at svn rev 42500).
        Development continue in geexbox repositories.
        You can find more informations here :
        http://enna.geexbox.org
       =20
        And you can get development version here :
        hg clone http://hg.geexbox.org/enna

Did someone already do the work to create an updated recipe? If not I
will try to update/convert the recipe tomorrow.


Thanks,

Paul

--=-lpMeps/q6q9k1UMwpae3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkudcl4ACgkQPX1aK2wOHVhCRACgjPxeRF4gc52G2vcXTxe7pNtN
V7AAn2PZz5vLFbvjjucQhBB35jQsPyLU
=2zEJ
-----END PGP SIGNATURE-----

--=-lpMeps/q6q9k1UMwpae3--
