Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KpKvS-0003MA-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 12:45:22 +0200
Received: (qmail invoked by alias); 13 Oct 2008 10:40:20 -0000
Received: from e178094106.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.94.106]
	by mail.gmx.net (mp036) with SMTP; 13 Oct 2008 12:40:20 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/KZy8Xg2nKI3X54IpRWqJN8BSpzHxCol8xCFjFia
	MCciOH1zn6af0I
Message-ID: <48F325C6.9040206@gmx.net>
Date: Mon, 13 Oct 2008 12:41:10 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081012031612.E518B189328@amethyst.openembedded.net>
In-Reply-To: <20081012031612.E518B189328@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.63
Cc: xjqian@openembedded.org
Subject: Re: [oe-commits] : libxml2: bump to 2.7.2
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
X-List-Received-Date: Mon, 13 Oct 2008 10:45:22 -0000
X-Groupsio-MsgNum: 6176
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig48C043454332B9F4AE990C65"

--------------enig48C043454332B9F4AE990C65
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
first: I am completely open to updating to newer program and or library
versions.

However

OE GIT Trial schrieb:

>  packages/libxml/libxml2_2.6.27.bb                  |    3 ---
>  packages/libxml/libxml2_2.6.29.bb                  |    4 ----

Running

	grep -r "libxml2" *

in conf/

results in:

distro/chinook-compat.conf:PREFERRED_VERSION_libxml2          =3D "2.6.27=
"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxml2
?=3D "2.6.29"
distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxml2-n=
ative
?=3D "2.6.29"

I would like to be asked or informed before stuff is removed from the
repository that is used by distros I maintain.

Regards
Robert


--------------enig48C043454332B9F4AE990C65
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkjzJccACgkQG9cfwmwwEtpWywCgn+Y1heNMUOpvn51q2CNoykqG
qRIAoIEXxZTfj0ut4NzAJRtGSoFE5Y/f
=kzcm
-----END PGP SIGNATURE-----

--------------enig48C043454332B9F4AE990C65--
