Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0YlF-0006Tp-C0 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 13:26:33 +0100
Received: from f053044006.adsl.alicedsl.de ([78.53.44.6] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0Yja-0003bA-4D for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 12:24:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 13:24:48 +0100
Message-ID: <1300451088.3830.53.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: qemu: `ERROR: QA Issue with qemu: Architecture did not match (3 to 20) on /work/i686-oe-linux/qemu-0.14.0-r3/packages-split/qemu/usr/share/qemu/openbios-ppc`
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
X-List-Received-Date: Fri, 18 Mar 2011 12:26:33 -0000
X-Groupsio-MsgNum: 30399
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Q5vr9g3PGd0IR7VWfyzx"

--=-Q5vr9g3PGd0IR7VWfyzx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


        $ MACHINE=3D"qemux86" bitbake -k qemu
        [=E2=80=A6]
        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "<unknown>"
        METADATA_REVISION =3D "e043f30"
        TARGET_ARCH       =3D "i686"
        TARGET_OS         =3D "linux"
        MACHINE           =3D "qemux86"
        DISTRO            =3D "minimal"
        DISTRO_VERSION    =3D "dev-snapshot-20110318"
        [=E2=80=A6]
        NOTE: package qemu-0.14.0-r3: task do_qa_staging: Succeeded
        ERROR: QA Issue with qemu: Architecture did not match (3 to 20) on =
/work/i686-oe-linux/qemu-0.14.0-r3/packages-split/qemu/usr/share/qemu/openb=
ios-ppc
        ERROR: QA Issue with qemu: Architecture did not match (3 to 2) on /=
work/i686-oe-linux/qemu-0.14.0-r3/packages-split/qemu/usr/share/qemu/openbi=
os-sparc32
        ERROR: QA run found fatal errors. Please consider fixing them.
        NOTE: package qemu-0.14.0-r3: task do_package_qa: Failed
        ERROR: Function 'do_package_qa' failed
        ERROR: Task 15 (/oe/openembedded/recipes/qemu/qemu_0.14.0.bb, do_pa=
ckage) failed with exit code '1'
        ERROR: '/oe/openembedded/recipes/qemu/qemu_0.14.0.bb' failed


Thanks,

Paul

--=-Q5vr9g3PGd0IR7VWfyzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2DTxAACgkQPX1aK2wOHVjC5ACfecg4N2uk3dcnLHYBkyMPmbB4
0VAAn3fiYYrmz7LJcvdaZlrfOMPlDAKM
=4y0c
-----END PGP SIGNATURE-----

--=-Q5vr9g3PGd0IR7VWfyzx--
