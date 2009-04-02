Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LpQQS-0002g5-Vt
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 19:10:28 +0200
Received: (qmail invoked by alias); 02 Apr 2009 17:07:33 -0000
Received: from f053009085.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.85]
	by mail.gmx.net (mp008) with SMTP; 02 Apr 2009 19:07:33 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19vc5cseNpvUwOVprXi/JXb1MhMdzunapF+noGDNN
	apS8VbJNiXPeyJ
Message-ID: <49D4F0D8.8030904@gmx.net>
Date: Thu, 02 Apr 2009 19:07:36 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238607343.27167.1.camel@homestead>
In-Reply-To: <1238607343.27167.1.camel@homestead>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.75
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: theBohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: cmake
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
X-List-Received-Date: Thu, 02 Apr 2009 17:10:48 -0000
X-Groupsio-MsgNum: 9014
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigCB4091561E277CEA69AF2727"

--------------enigCB4091561E277CEA69AF2727
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Shane,

Shane Dixon schrieb:
> I'm considering changing my projects over to cmake, but before I do, I
> wanted to ask how good the cmake support is in OE.  I saw a recent
> proposal to allow out-of-tree builds for cmake, but I'm not sure if tha=
t
> happened or not.
>=20
> Can I move forward with changing my projects to cmake and expect that i=
t
> will build correctly in OE?
Go ahead, OE contains latest CMake release as well as out of tree build
functionality.

Regards
Robert


--------------enigCB4091561E277CEA69AF2727
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknU8NsACgkQG9cfwmwwEtrsuQCfVtB2PLHu6InKhJxUR4NENSGD
WpsAnA9/UGQ49b0407PGEdi8g7mCjYYl
=KUm9
-----END PGP SIGNATURE-----

--------------enigCB4091561E277CEA69AF2727--
