Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QPAXe-0003tf-KE
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 11:38:14 +0200
Received: (qmail invoked by alias); 25 May 2011 09:35:12 -0000
Received: from 230.118.101.84.rev.sfr.net (EHLO [192.168.42.72])
	[84.101.118.230]
	by mail.gmx.net (mp052) with SMTP; 25 May 2011 11:35:12 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/4Oh4XbxH4GuIM3ekn/Tcnretsss0g/5Ab8uKHga
	Za91i1YzZ+/K+l
Message-ID: <4DDCCD4C.1080902@gmx.net>
Date: Wed, 25 May 2011 11:35:08 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306099474.5994.112.camel@mattotaupa>
In-Reply-To: <1306099474.5994.112.camel@mattotaupa>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: =?UTF-8?B?UmU6IGljZWR0ZWE2LW5hdGl2ZTogdGFzayBjb21waWxlIGZhaWxzIHdpdGggYHVuemlwOiBjYW5ub3QgZmluZCB6aXBmaWxlIGRpcmVjdG9yeSBpbiBvbmUgb2YgL29lL2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jpbi91bnppcCBvciDigKZg?=
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
X-List-Received-Date: Wed, 25 May 2011 09:38:14 -0000
X-Groupsio-MsgNum: 32274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig8E893B8DCE6D98F3DF645D88"

--------------enig8E893B8DCE6D98F3DF645D88
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

>         Importing binaries from component CORBA_DIST
>         ( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/iced=
tea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /o=
e/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip -o /=
oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7.1=
0-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip=
 )
>         Archive:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/bin/unzip
>           End-of-central-directory signature not found.  Either this fi=
le is not
>           a zipfile, or it constitutes one disk of a multi-part archive=
=2E  In the
>           latter case the central directory and zipfile comment will be=
 found on
>           the last disk(s) of this archive.
>         note:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux=
/usr/bin/unzip may be a plain executable, not an archive
>         unzip:  cannot find zipfile directory in one of /oe/build-angst=
rom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip or /oe/build-angs=
trom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.zip, and cannot =
find /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unz=
ip.ZIP, period.
>         make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-li=
nux/icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x=
86/tmp/java/components_imported] Error 9
Did you notice that somehow the makefile tries to unpack the file
'/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip'.=
 I
smell some shell-quoting problem or similar.

Regards,
Robert


--------------enig8E893B8DCE6D98F3DF645D88
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3czU8ACgkQG9cfwmwwEtq67ACcCD+FRzqUXb+ZWJRrsCUYc9Le
sTcAnA4o9vjSLOzVk9sHlOh9z0bAE5Ou
=xnNR
-----END PGP SIGNATURE-----

--------------enig8E893B8DCE6D98F3DF645D88--
