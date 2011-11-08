Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNkiV-0003rm-RW for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 13:23:52 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNkcY-00082D-NL for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 12:17:42 +0000
Message-ID: <1320754658.3915.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Nov 2011 13:17:38 +0100
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: [meta-oe] slim fails to install with unmet dependency of `libpam-meta`
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
X-List-Received-Date: Tue, 08 Nov 2011 12:23:52 -0000
X-Groupsio-MsgNum: 35251
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-lhas9vNWw9D3eOEI7CQL"

--=-lhas9vNWw9D3eOEI7CQL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


using the systemd demo image [1] based on OE-core and meta-oe and
running `opkg update` and `opkg install slim` an error was displayed
that the dependency for libpam-meta could not be installed.


Thanks,

Paul


[1] http://www.angstrom-distribution.org/demo/beagleboard/Angstrom-systemd-=
image-eglibc-ipk-v2011.11-core-beagleboard.rootfs.tar.bz2

--=-lhas9vNWw9D3eOEI7CQL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65HeIACgkQPX1aK2wOHVhvtQCeLT4Gw5Je9MAkSXhyu8slxlrT
P/QAnjWFKmnMW6PAjhfHdOpfdtW0p1M3
=QMc8
-----END PGP SIGNATURE-----

--=-lhas9vNWw9D3eOEI7CQL--
