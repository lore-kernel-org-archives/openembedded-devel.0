Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaS0t-00081Y-BM for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 14:31:03 +0200
Received: from f053043248.adsl.alicedsl.de ([78.53.43.248]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaRxe-0001TM-Iu for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 12:27:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jun 2011 14:27:25 +0200
Message-ID: <1309004845.4286.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: =?UTF-8?B?YXVyb3JhOiB0YXNrIGNvbmZpZ3VyZSBmYWlscyB3aXRoICdjb25maWd1cmU6IGVycm9yOiBQYWNrYWdlIHJlcXVpcmVtZW50cyAoUXRDb3JlRSA+PSA0LjcuMCDigKYn?=
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
X-List-Received-Date: Sat, 25 Jun 2011 12:31:04 -0000
X-Groupsio-MsgNum: 32834
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7i91+nqc8opO1jKy/nlC"

--=-7i91+nqc8opO1jKy/nlC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Aurora/OE folks,


using `minimal` for `MACHINE =3D "beagleboard"` and doing `bitbake -k
aurora-fb-image` task configure of `aurora` fails with the following
error message.

        [=E2=80=A6]
        checking for FSOFRAMEWORK... yes
          Qt base directory explicitly set to qtopia
        checking for QT... no
        configure: error: Package requirements (QtCoreE >=3D 4.7.0
                QtGuiE >=3D 4.7.0
                QtDeclarativeE >=3D 4.7.0) were not met:
       =20
        No package 'QtCoreE' found
        No package 'QtGuiE' found
        No package 'QtDeclarativeE' found
        [=E2=80=A6]

`qt4-embedded-4.7.3-r33.1` is build as a dependency and I do not know
what Qt packages contain the needed dependencies.


Thanks,

Paul

--=-7i91+nqc8opO1jKy/nlC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4F1CcACgkQPX1aK2wOHVjsZwCeJRdrJBFXIxRGUFIbhFqmnLNJ
/PAAn2aQyDjOUmW1KUO9CcxQjf1Rtfrt
=mN2Q
-----END PGP SIGNATURE-----

--=-7i91+nqc8opO1jKy/nlC--
