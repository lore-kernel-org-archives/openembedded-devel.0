Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiS61-0000V7-3B for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 15:08:53 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiS5t-0001qR-PT for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:08:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E7A@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
	<1281357774.3767.34.camel@mattotaupa>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E7A@deimsg40.de.net.world>
Date: Mon, 09 Aug 2010 15:08:43 +0200
Message-ID: <1281359323.3767.35.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2 2/2] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Mon, 09 Aug 2010 13:08:53 -0000
X-Groupsio-MsgNum: 22002
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Ww4DR5UA7e7tYxmtMhIC"

--=-Ww4DR5UA7e7tYxmtMhIC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 15:01 +0200 schrieb Hauser, Wolfgang
(external):
> > That is not necessary as increasing of the INC_PR will have the PR
> > increased along the way.
>=20
> The busybox_1.16.2.bb is changed too, should there be really no increase
> of PR ?

Sorry, my bad. Yes, I guess it is better to increase it then, although
it should technically not be necessary since everything is committed
using one patch.


Thanks,

Paul

--=-Ww4DR5UA7e7tYxmtMhIC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxf/dsACgkQPX1aK2wOHVgy3ACeLaRTiEdxWy8x4rvbzTFsm36W
pqoAn1GMYXnYK2+i+h+/xE79ge6CRpAg
=I/al
-----END PGP SIGNATURE-----

--=-Ww4DR5UA7e7tYxmtMhIC--
