Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4djb-0007DU-Iy for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 20:01:28 +0200
Received: from f053037130.adsl.alicedsl.de ([78.53.37.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4djF-0002Il-R8 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 18:01:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 09 Oct 2010 20:01:04 +0200
Message-ID: <1286647264.4684.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: =?UTF-8?B?UkRFUEVORFMvUlJFQ09NTUVORFMgb3Igb3RoZXJ3aXNlIHJlcXVpcmVzIHRoZSBydW50aW1lIGVudGl0eSAn4oCmLW5hdGl2ZScgYnV0IGl0IHdhc24ndCBmb3VuZCBpbiBhbnkgUEFDS0FHRSBvciBSUFJPVklERVMgdmFyaWFibGVz?=
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
X-List-Received-Date: Sat, 09 Oct 2010 18:01:28 -0000
X-Groupsio-MsgNum: 24578
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-evDbP2HeapelvBJ5n36m"

--=-evDbP2HeapelvBJ5n36m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


building `console-image` for destribution minimal for `MACHINE =3D
"beagleboard"` I noticed the following errors.

        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'cups-native' but it wasn't found in any PACKAGE or RPROVIDES variab=
les
        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'libxrandr-native' but it wasn't found in any PACKAGE or RPROVIDES v=
ariables
        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'libxdamage-native' but it wasn't found in any PACKAGE or RPROVIDES =
variables
        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'libxcomposite-native' but it wasn't found in any PACKAGE or RPROVID=
ES variables
        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'jasper-native' but it wasn't found in any PACKAGE or RPROVIDES vari=
ables
        ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'gtk+-nativelibpng-native' but it wasn't found in any PACKAGE or RPR=
OVIDES variables

I have not seen them before, but I did not pay much attention lately, so
I might have overlooked them.

Searching the WWW I found [1], but this was supposedly fixed in 755654
[2] and in between I did not see these errors.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/=
023680.html
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D755654d=
14e8fddc54ed739461bd529291c1e1230

--=-evDbP2HeapelvBJ5n36m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkywrdoACgkQPX1aK2wOHVhAtwCdFtiI5fu/9uUDnZGEPjagYcnO
Qx4Ani9P0u0y1ySwGk+ueI/x1A4MxRxx
=Bk25
-----END PGP SIGNATURE-----

--=-evDbP2HeapelvBJ5n36m--
