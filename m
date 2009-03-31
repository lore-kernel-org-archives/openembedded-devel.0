Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LokMi-0003lT-OD
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 22:15:20 +0200
Received: (qmail invoked by alias); 31 Mar 2009 20:13:04 -0000
Received: from f053009074.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.74]
	by mail.gmx.net (mp067) with SMTP; 31 Mar 2009 22:13:04 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/6JUM3b636pbvAv/xUuIOIVth2s7lqdZA7i8Oln8
	LQNSwpLtgK5ZeB
Message-ID: <49D27952.6060806@gmx.net>
Date: Tue, 31 Mar 2009 22:13:06 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6899999999999999
Subject: [stable] floating revisions or _svn/_git/_cvs recipes
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
X-List-Received-Date: Tue, 31 Mar 2009 20:15:20 -0000
X-Groupsio-MsgNum: 8881
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig527D11BC5B3E16AEA6FA6558"

--------------enig527D11BC5B3E16AEA6FA6558
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
the new stable branch has been created. Soon we will see an influx of
$BIG_COMPANY making use it. ;)

All great. :)

However I see a problem with those recipes which do not have a fixed
version. I mean those that have _svn, _git or _cvs as the version number
and are configured to autorev.

Can we come to an agreement and say: "Only limited support for those
recipes."

Attached to this topic is the wish to introduce a server containing the
source tarballs for the recipes we provide.

I think everybody knows the trouble that we have with various tarballs
which we take right from the Debian repos. As soon as a new tarball is
uploaded the old one vanishes. I think this will cause grief for our
stable branch and I would like to avoid this.

Regards
Robert


--------------enig527D11BC5B3E16AEA6FA6558
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknSeVIACgkQG9cfwmwwEtoT3ACdFPNInVp4Tw0rHDUwAx3fWfGZ
1TgAoJX5V6KTf+zDFzmlnVhpE9O91Jjw
=1j32
-----END PGP SIGNATURE-----

--------------enig527D11BC5B3E16AEA6FA6558--
