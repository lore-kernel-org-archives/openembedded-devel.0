Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OstbP-0006Er-Fg for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 10:32:28 +0200
Received: from f053042255.adsl.alicedsl.de ([78.53.42.255]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ostan-00030R-67 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:31:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201009070843.36066.schnitzeltony@gmx.de>
References: <201009070843.36066.schnitzeltony@gmx.de>
Date: Tue, 07 Sep 2010 10:31:45 +0200
Message-ID: <1283848305.3951.1.camel@mattotaupa>
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
Subject: Re: clutter patches status
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
X-List-Received-Date: Tue, 07 Sep 2010 08:32:29 -0000
X-Groupsio-MsgNum: 23240
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lWZvG2Aulhatm4skhHPk"

--=-lWZvG2Aulhatm4skhHPk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 07.09.2010, 08:43 +0200 schrieb Andreas Mueller:
> the patches I sent on Sep. 3rd were acked by Koen and are marked as 'appl=
ied' in patchwork but I can't find them in org.openembedded.dev or any othe=
r branch.
>=20
> I would like to send/implement further patches ontop:
>=20
> - workaround clutter font problem (implemented & tested - waiting for ups=
tream)
> - clutter-gegl (TBD / required by toys/attic/gcr)
> - clutter-helix (TBD / optionally required by toys/attic/woohaa)
> - toys: multiple configure done / update to 1.0 interface (hope to get th=
at upstream at clutter-project)
> - pyclutter: implemented but build fails for GLES (GL ok)
> - clutter-gesture (builds ok - don't know how to test yet)
>=20
> Please let me know the status of the patches sent.

Koen pushed them half an hour ago [1].=20


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2eca1eb=
59ccb0890e4db078a4af456c9f2d194ad

--=-lWZvG2Aulhatm4skhHPk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyF+GwACgkQPX1aK2wOHVjiMgCfcL8HV9/s/XbW+oM4Jp6cTTsC
iNUAn3n+3DLMIsadTgI7lfcTfZsXhjqD
=CMyD
-----END PGP SIGNATURE-----

--=-lWZvG2Aulhatm4skhHPk--
