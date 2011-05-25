Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QPIQQ-0000am-6r
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 20:03:18 +0200
Received: (qmail invoked by alias); 25 May 2011 18:00:15 -0000
Received: from 230.118.101.84.rev.sfr.net (EHLO [192.168.42.72])
	[84.101.118.230]
	by mail.gmx.net (mp070) with SMTP; 25 May 2011 20:00:15 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+cSvQimoacvt7oA+212pQQownJw8SLmviX3R+jgP
	A+fhHOZ6cevfPO
Message-ID: <4DDD43AA.2040107@gmx.net>
Date: Wed, 25 May 2011 20:00:10 +0200
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
X-List-Received-Date: Wed, 25 May 2011 18:03:18 -0000
X-Groupsio-MsgNum: 32293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig46D67A467F9616A100C6D2C5"

--------------enig46D67A467F9616A100C6D2C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,
greetings from the GDB cave ....

I now what is going wrong with unzip and ... whoa this is so weird ...

Am 22.05.2011 23:24, schrieb Paul Menzel:
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
>=20
> Running the command directly works fine though.
>=20
>         $ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
bin/unzip -o /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea=
6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/di=
st/lib/bin.zip
>         Archive:  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/=
icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/c=
orba/dist/lib/bin.zip
>           inflating: lib/orb.idl            =20
>           inflating: lib/ir.idl
The thing is. You are tweaking the IcedTea build by declaring the
makefile variable UNZIP through the command-line. For programs that are
called from this make process the variables turn into environment
variables ...
And this is where the shit hits the fan: As it turns out Info-Zip's
unzip understand an arcane way of declaring the file to be unzipped.
Through an environment variable called: UNZIP (!!!)

To find this out I did nothing less than running an OE-called unzip and
a manually called unzip process run under gdb and compare what they do
in the beginning step by step.

Here a shorter explanation of what I mean:

UNZIP=3Dxyz /home/rschus-oe/panda/tmp/sysroots/x86_64-linux/usr/bin/unzip=

blablafoo
unzip:  cannot find or open xyz, xyz.zip or xyz.ZIP.

So apparently UNZIP is in our case set to the zip file executable
already to please the openjdk build.

I don't have an immediate idea how to fix it properly. I'd vote for
patching our unzip not to use that variable (It still has another one
called UNZIP_OPTS for the same use).

Last but not least: Our unzip recipe sucks. It does not enforce OE build
flags and does not prevent that the called makefile strips the binary.
There are also newer version of unzip out there (ours is from 2005).
I'll plan on fixing all of the above.

Regards,
Robert



--------------enig46D67A467F9616A100C6D2C5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3dQ64ACgkQG9cfwmwwEtoLTQCfSUJVYZDt1D7dNj5+aKGXQiPx
mLkAnijfCMy0xVFTs8aso+jXzi4EtgoL
=AMeM
-----END PGP SIGNATURE-----

--------------enig46D67A467F9616A100C6D2C5--
