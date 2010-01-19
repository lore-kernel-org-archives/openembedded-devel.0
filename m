Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXBmD-0007Bx-Vc for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 11:57:41 +0100
Received: from f053039068.adsl.alicedsl.de ([78.53.39.68]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXBk5-0001zB-4y for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 10:55:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 11:55:23 +0100
Message-ID: <1263898523.10980.76.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?W1JGQ11bQU5OT1VOQ0VdIFZEUiBhdmFpbGFibGUgYXMgcGFja2FnZSBpbiBPcGVuRW1iZWRkZWQgYW5kIGluIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Tue, 19 Jan 2010 10:57:41 -0000
X-Groupsio-MsgNum: 15874
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SoPAyN+/XujTO7CEHBNS"

--=-SoPAyN+/XujTO7CEHBNS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE developers,


I like to make an announcement on the VDR list. Could you please check
my draft for it, that I did not mess up any terminology (framework,
distribution) and that I gave correct credit to everyone.

If you would change something to promote OpenEmbedded or the embedded
world better or from a different point of view please tell me.


Thanks and sorry to bother you with this,

Paul

---
Dear VDR users,


VDR 1.7.10 is now also available as a package in OpenEmbedded (OE), a
build framework for embedded Linux [1][2]. I thank Henning Heinold who
did most of the work to get VDR included and the OE developers to answer
my questions on the openembedded-devel mailing list [3].

Around 30 hours ago, Koen Kooi added VDR also to =C3=85ngstr=C3=B6m [4][5][=
6], a
distribution using OE heavily.

With `opkg install vdr` it is now as easy as on other systems to install
VDR and get it running on embedded devices which because of their energy
efficiency and form factors, e. g. BeagleBoard [7], are predestined for
use as a server.

The next steps are going to be to improve the packaging in OE and to
send some patches to upstream VDR to adapt it for cross compilation [8].

As always especially the developers do not have much time, so help with
testing and writing patches is very welcomed.

Instructions will also be posted in the VDR Wiki [9] on how to get this
running.


Thanks again to everyone and happy testing,

Paul


[1] http://www.openembedded.org/
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/
[3] http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
[4] http://www.angstrom-distribution.org/
[5] http://www.angstrom-distribution.org/repo/?pkgname=3Dvdr
[6] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Ddfa0d36=
cac88fd6f3a451cc7bc9433629f4a2df00
[7] http://beagleboard.org/
[8] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/01=
6213.html
[9] http://www.linuxtv.org/vdrwiki/index.php/Main_Page

--=-SoPAyN+/XujTO7CEHBNS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktVj5sACgkQPX1aK2wOHVgDEwCeMpEI5U0sGOGK8IdwzpIZgjWC
SXMAnifhegpMBiO6go03Ohu4jUXEY7mm
=tq6u
-----END PGP SIGNATURE-----

--=-SoPAyN+/XujTO7CEHBNS--
