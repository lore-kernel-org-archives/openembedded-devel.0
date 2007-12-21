Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5W8c-0007MV-Ei
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 01:53:18 +0100
Received: (qmail invoked by alias); 21 Dec 2007 00:48:06 -0000
Received: from e178116109.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.116.109]
	by mail.gmx.net (mp054) with SMTP; 21 Dec 2007 01:48:06 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+hMkwMXfKhPnJuWcbWx7uPz93LxZ4ykPyV6SbVBA
	iOqp/mZt3CacgI
Message-ID: <476B0D45.4020209@gmx.net>
Date: Fri, 21 Dec 2007 01:48:05 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <fkc9de$365$1@ger.gmane.org> <476A26BB.1010602@student.utwente.nl>
	<1871890373.20071220150812@gmail.com>
In-Reply-To: <1871890373.20071220150812@gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: drop quilt version 0.39
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
X-List-Received-Date: Fri, 21 Dec 2007 00:53:18 -0000
X-Groupsio-MsgNum: 3719
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig91F854127DCAA1507EF9F22D"

--------------enig91F854127DCAA1507EF9F22D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.

Paul Sokolovsky schrieb:
> Hello Koen,
> To elaborate, I hope that we'll revamp OE support for using external
> toolchains for building single packages, because it seems that people
> have got a stereotype that OE is for building entire system from
> scratch (at that would be too limiting - why I'd use top-notch
> solution to build a whole distro while revert to using adhoc tools to
> build packages for 3rd-party systems?)
I second this. At jalimo we heavily use OE to build packages for Maemo.
I find this much more sane than endlessly fighting with scratchbox ...

> For example, I just pushed openwrt-sdk distro config, which allows
> to build packages against OpenWRT SDK. Due to OpenWRT dependencies, it
> may be required to build older than the latest versions of some
> packages.
Would be fun to bring OpenWRT people to a point where they only manage a
small set of core packages and create every other package using OE ...

Regards
Robert


--------------enig91F854127DCAA1507EF9F22D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHaw1FG9cfwmwwEtoRCKIHAJ9Fd9JeWCshLantT5Dam7OIYfXl9ACfVSCA
i3oChCDqONHgMDeP9ysCD8I=
=IWKc
-----END PGP SIGNATURE-----

--------------enig91F854127DCAA1507EF9F22D--
