Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KI3qn-0005sB-Ku
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jul 2008 17:51:01 +0200
Received: (qmail invoked by alias); 13 Jul 2008 15:50:32 -0000
Received: from e178092237.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.92.237]
	by mail.gmx.net (mp043) with SMTP; 13 Jul 2008 17:50:32 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18sY/Urx64sTwSrSeDZhdq+oazoJFG9KvMwGIW9Yu
	HVkljM4omS6jPb
Message-ID: <487A245D.6090502@gmx.net>
Date: Sun, 13 Jul 2008 17:50:53 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: several versions of software packages not available in OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 13 Jul 2008 15:51:03 -0000
X-Groupsio-MsgNum: 5497
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig223C18618401C9B098CC8970"

--------------enig223C18618401C9B098CC8970
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
when building openmoko (using om-2007.2 as the distro) I get warnings
about missing versions:

NOTE: preferred version 0.16.999.041 of e-wm not available (for item e-wm=
)
NOTE: preferred version 0.9.5.1a of python-pyrex-native not available
(for item python-pyrex-native)
NOTE: preferred version 115 of udev not available (for item udev)

Perhaps those recipes are in someones sandbox or OM's private repo. If
so it would be nice if they could be placed in upstream OE, too.

Regards
Robert


--------------enig223C18618401C9B098CC8970
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIeiRdG9cfwmwwEtoRCNIwAJ0drP5QZ3F+Eu7GztPLS2bWAh/aZwCfUEsz
gXEarVnIYoBQzvlPY9t+OBs=
=ERUN
-----END PGP SIGNATURE-----

--------------enig223C18618401C9B098CC8970--
