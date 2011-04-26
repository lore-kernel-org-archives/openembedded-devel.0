Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEiin-0002x3-EV for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:54:33 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEih9-00032n-G5 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 13:52:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 15:52:04 +0200
Message-ID: <1303825924.4073.50.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: tcp-wrappers: What kind of license? Custom or BSD?
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
X-List-Received-Date: Tue, 26 Apr 2011 13:54:33 -0000
X-Groupsio-MsgNum: 31480
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qKuuScB78hSM6oBE2yhV"

--=-qKuuScB78hSM6oBE2yhV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


is =C2=BBtcp-wrapper=C2=AB the correct value [1] to assign to `LICENSE`? Wi=
kipedia
says this is a BSD license [2]. The license is the following [3].

        As of June 1, 2001, the text below constitutes the TCP Wrappers lic=
ense.
       =20
        /******************************************************************=
******
        * Copyright 1995 by Wietse Venema.  All rights reserved.  Some indi=
vidual
        * files may be covered by other copyrights.
        *
        * This material was originally written and compiled by Wietse Venem=
a at
        * Eindhoven University of Technology, The Netherlands, in 1990, 199=
1,
        * 1992, 1993, 1994 and 1995.
        *
        * Redistribution and use in source and binary forms, with or withou=
t
        * modification, are permitted provided that this entire copyright n=
otice
        * is duplicated in all such copies.
        *
        * This software is provided "as is" and without any expressed or im=
plied
        * warranties, including, without limitation, the implied warranties=
 of
        * merchantibility and fitness for any particular purpose.
        *******************************************************************=
*****/


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/tcp-wra=
ppers/tcp-wrappers_7.6.bb?id=3D0393bec46ca556be6845221b701dcf8f9508eb0c#n3
[2] https://secure.wikimedia.org/wikipedia/en/wiki/TCP_Wrapper
[3] ftp://ftp.porcupine.org/pub/security/tcp_wrappers_license

--=-qKuuScB78hSM6oBE2yhV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22zgQACgkQPX1aK2wOHVgHZwCeMqL4NI2oDAWgBgAmsMZdUB+8
yxwAn03Bf8CH4BuVp449HsH5Um9VI3D9
=8zFz
-----END PGP SIGNATURE-----

--=-qKuuScB78hSM6oBE2yhV--
