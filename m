Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1PAHtR-0005gB-Uk
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 09:54:59 +0200
Received: (qmail invoked by alias); 25 Oct 2010 07:54:16 -0000
Received: from 251.118.101-84.rev.gaoland.net (EHLO [192.168.1.71])
	[84.101.118.251]
	by mail.gmx.net (mp025) with SMTP; 25 Oct 2010 09:54:16 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19bKOItp+Fb8JJYcC8TsNzBbEhye5uZiBBYZC+qgJ
	cLYE8lu0viBtbF
Message-ID: <4CC537A4.5080909@gmx.net>
Date: Mon, 25 Oct 2010 09:54:12 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
	<AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
In-Reply-To: <AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: empty strings
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
X-List-Received-Date: Mon, 25 Oct 2010 07:55:00 -0000
X-Groupsio-MsgNum: 25434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigE791A7C93AB63D055D3B7CBE"

--------------enigE791A7C93AB63D055D3B7CBE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 22.10.2010 11:00, schrieb Frans Meulenbroeks:
>> classpath/classpath.inc:RPROVIDES_${PN} =3D ""
It would not be a good idea to blindly remove this. The effect of this
can only be seen at runtime. I don't have the time to look into this
deeply now but we definitely did this because we don't like the default
RPROVIDES that OE sets for classpath and classpath-minimal.

Regards
Robert




--------------enigE791A7C93AB63D055D3B7CBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkzFN6cACgkQG9cfwmwwEtrSfwCgiuNZ9M88ooX1dEiodiRIL0UB
e8MAnjkcmoLkcO9KhzqpSdVEUEIyoebA
=NOcu
-----END PGP SIGNATURE-----

--------------enigE791A7C93AB63D055D3B7CBE--
