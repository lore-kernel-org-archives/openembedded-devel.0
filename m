Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J2A8P-0007Pq-6X
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2007 19:47:13 +0100
Received: (qmail invoked by alias); 11 Dec 2007 18:42:56 -0000
Received: from e178094202.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.94.202]
	by mail.gmx.net (mp054) with SMTP; 11 Dec 2007 19:42:56 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+/kt0vz6u/Ti3So3WIyXr5Hvmp2cYVq8JRCwHvhJ
	hOkDPQMJmi3OYE
Message-ID: <475EDA2B.8080109@gmx.net>
Date: Tue, 11 Dec 2007 19:42:51 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: RFC: merging recipes from Jalimo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2007 18:47:13 -0000
X-Groupsio-MsgNum: 3599
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig497AC83FC0CAC155201F8166"

--------------enig497AC83FC0CAC155201F8166
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
since I've gotten r/w access to the repo (thanks again!) I have begun to
slowly merge the Jalimo recipes. It all starts with this one:

http://bugs.openembedded.org/show_bug.cgi?id=3D3457

The recipe that builts the initial Java5-capable Java compiler.

Please comment on the bug and tell me whether it should go in or what
you would like to see changed.

Regards
Robert


--------------enig497AC83FC0CAC155201F8166
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHXtouG9cfwmwwEtoRCFSfAJsGuF432DNcxJYSpCI3WaAmJf1FzgCfdtaE
O/k3TPL40Vi9G1Y8lLwViAU=
=LDCF
-----END PGP SIGNATURE-----

--------------enig497AC83FC0CAC155201F8166--
