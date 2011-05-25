Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPJ3E-0001P9-0f for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 20:43:24 +0200
Received: from f053034074.adsl.alicedsl.de ([78.53.34.74]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPJ0c-0002Vx-9b for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 18:40:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DDD43AA.2040107@gmx.net>
References: <1306099474.5994.112.camel@mattotaupa> <4DDD43AA.2040107@gmx.net>
Date: Wed, 25 May 2011 20:40:21 +0200
Message-ID: <1306348821.28917.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
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
X-List-Received-Date: Wed, 25 May 2011 18:43:24 -0000
X-Groupsio-MsgNum: 32297
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-L6E4he4M9auurTRik8Fa"

--=-L6E4he4M9auurTRik8Fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Robert,


Am Mittwoch, den 25.05.2011, 20:00 +0200 schrieb Robert Schuster:

> greetings from the GDB cave ....
>=20
> I now what is going wrong with unzip and ... whoa this is so weird ...
>=20
> Am 22.05.2011 23:24, schrieb Paul Menzel:
> >         Importing binaries from component CORBA_DIST
> >         ( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/iced=
tea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /oe/=
build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip -o /oe/b=
uild-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7.10-r4.0=
/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip )
> >         Archive:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/bin/unzip
> >           End-of-central-directory signature not found.  Either this fi=
le is not
> >           a zipfile, or it constitutes one disk of a multi-part archive=
.  In the
> >           latter case the central directory and zipfile comment will be=
 found on
> >           the last disk(s) of this archive.
> >         note:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux=
/usr/bin/unzip may be a plain executable, not an archive
> >         unzip:  cannot find zipfile directory in one of /oe/build-angst=
rom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip or /oe/build-angstr=
om-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.zip, and cannot find=
 /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.ZIP=
, period.
> >         make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-li=
nux/icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86=
/tmp/java/components_imported] Error 9
> >=20
> > Running the command directly works fine though.
> >=20
> >         $ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
bin/unzip -o /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-=
native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/l=
ib/bin.zip
> >         Archive:  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/=
icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/cor=
ba/dist/lib/bin.zip
> >           inflating: lib/orb.idl            =20
> >           inflating: lib/ir.idl
> The thing is. You are tweaking the IcedTea build by declaring the
> makefile variable UNZIP through the command-line. For programs that are
> called from this make process the variables turn into environment
> variables ...
> And this is where the shit hits the fan: As it turns out Info-Zip's
> unzip understand an arcane way of declaring the file to be unzipped.
> Through an environment variable called: UNZIP (!!!)
>=20
> To find this out I did nothing less than running an OE-called unzip and
> a manually called unzip process run under gdb and compare what they do
> in the beginning step by step.

Great analysis. I could not have done it and only used `gdb` to create a
backtrace for the developers.

> Here a shorter explanation of what I mean:
>=20
> UNZIP=3Dxyz /home/rschus-oe/panda/tmp/sysroots/x86_64-linux/usr/bin/unzip
> blablafoo
> unzip:  cannot find or open xyz, xyz.zip or xyz.ZIP.
>=20
> So apparently UNZIP is in our case set to the zip file executable
> already to please the openjdk build.
>=20
> I don't have an immediate idea how to fix it properly. I'd vote for
> patching our unzip not to use that variable (It still has another one
> called UNZIP_OPTS for the same use).

Well as far as I understand the manual, `UNZIP_OPTS` should be used for
VMS, but could also be used for other operating systems.

Actually I would think to solve this, by patching OpenJDK to use another
variable and report that upstream. I suggest for example UNZIP_EXE for
unzip executable.

I do not know how if the unzip developers have decided on this issue to
rename remove that variable and how many programs use this feature.

> Last but not least: Our unzip recipe sucks. It does not enforce OE build
> flags and does not prevent that the called makefile strips the binary.
> There are also newer version of unzip out there (ours is from 2005).
> I'll plan on fixing all of the above.

That would be awesome.

I am sorry for opening Pandora=E2=80=99s box.


Thanks,

Paul

--=-L6E4he4M9auurTRik8Fa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3dTRUACgkQPX1aK2wOHViTywCfYwErKNQU3LIDNsOpXCRanUzs
ZwEAoITXyQwsLee1j35NfOXicU3GB3y5
=I1Dw
-----END PGP SIGNATURE-----

--=-L6E4he4M9auurTRik8Fa--
