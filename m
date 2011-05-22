Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOGBQ-0006rr-Vm for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 23:27:33 +0200
Received: from f053035096.adsl.alicedsl.de ([78.53.35.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOG8m-00021X-RZ for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 21:24:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 23:24:34 +0200
Message-ID: <1306099474.5994.112.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: =?UTF-8?B?aWNlZHRlYTYtbmF0aXZlOiB0YXNrIGNvbXBpbGUgZmFpbHMgd2l0aCBgdW56aXA6IGNhbm5vdCBmaW5kIHppcGZpbGUgZGlyZWN0b3J5IGluIG9uZSBvZiAvb2UvYnVpbGQtYW5nc3Ryb20tbmV4dC9hbmdzdHJvbS1kZXYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3IvYmluL3VuemlwIG9yIOKApmA=?=
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
X-List-Received-Date: Sun, 22 May 2011 21:27:33 -0000
X-Groupsio-MsgNum: 32241
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-u9KCKbVR32L3kJYmRBiR"

--=-u9KCKbVR32L3kJYmRBiR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


even with the latest patches send to the list [1].

        Importing binaries from component CORBA_DIST
        ( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6=
-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /oe/buil=
d-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip -o /oe/build=
-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7.10-r4.0/ice=
dtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip )
        Archive:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/=
usr/bin/unzip
          End-of-central-directory signature not found.  Either this file i=
s not
          a zipfile, or it constitutes one disk of a multi-part archive.  I=
n the
          latter case the central directory and zipfile comment will be fou=
nd on
          the last disk(s) of this archive.
        note:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr=
/bin/unzip may be a plain executable, not an archive
        unzip:  cannot find zipfile directory in one of /oe/build-angstrom-=
next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip or /oe/build-angstrom-n=
ext/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.zip, and cannot find /oe=
/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.ZIP, pe=
riod.
        make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-linux/=
icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/tmp=
/java/components_imported] Error 9

Running the command directly works fine though.

        $ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/=
unzip -o /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-nati=
ve-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/b=
in.zip
        Archive:  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/iced=
tea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/d=
ist/lib/bin.zip
          inflating: lib/orb.idl            =20
          inflating: lib/ir.idl


Thanks,

Paul


[1] http://patches.openembedded.org/patch/4621/

--=-u9KCKbVR32L3kJYmRBiR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ZfxIACgkQPX1aK2wOHVi4YwCcDpNIqPOCk7Zgk6MWTr2Ux6G9
ovkAniAuRsWQlR8l3a2LZsgXI22+23IR
=FBRt
-----END PGP SIGNATURE-----

--=-u9KCKbVR32L3kJYmRBiR--
