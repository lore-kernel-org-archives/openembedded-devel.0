Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LnhqY-0007y0-9G
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Mar 2009 00:21:50 +0100
Received: (qmail invoked by alias); 28 Mar 2009 23:19:52 -0000
Received: from f053011046.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.11.46]
	by mail.gmx.net (mp036) with SMTP; 29 Mar 2009 00:19:52 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18ONvBFV6MO2tD283Q5HCDxpkLmw4hQDN5R+Eu65j
	BwHOkHaVr+u3dT
Message-ID: <49CEB099.4020009@gmx.net>
Date: Sun, 29 Mar 2009 00:19:53 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Using OE <openembedded-users@lists.openembedded.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
Subject: FYI: cmake introduction
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
X-List-Received-Date: Sat, 28 Mar 2009 23:21:50 -0000
X-Groupsio-MsgNum: 8787
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig408D365AC83A64FFBA9E88FB"

--------------enig408D365AC83A64FFBA9E88FB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I just found a recording of the talk about cmake at FOSDEM 2009. I was
at this presentation and it helped me a lot understanding how to use it.

=2E.. and now just weeks later I can fumble around with our cmake.bbclass=

and add a recipe that is using it (llvm 2.5).

Highly recommended:
http://free-electrons.com/pub/video/2009/fosdem/fosdem2009-neundorf-cmake=
=2Eogv

Regards
Robert


--------------enig408D365AC83A64FFBA9E88FB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknOsJkACgkQG9cfwmwwEtrlHQCgmd3RGsCFaMRr+/wzOygajkfJ
BwQAn1a/AU2uZTHNrjKR4zFy3kkQZ9Ih
=Rpjn
-----END PGP SIGNATURE-----

--------------enig408D365AC83A64FFBA9E88FB--
