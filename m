Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PZ2ac-0007JU-Tf for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 15:37:50 +0100
Received: from f053036243.adsl.alicedsl.de ([78.53.36.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PZ2aL-000790-PH for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 14:37:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 01 Jan 2011 15:37:32 +0100
Message-ID: <1293892652.4179.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: binutils_2.21: ERROR: QA Issue with staging: libbfd.la failed sanity test (workdir) in path /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib
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
X-List-Received-Date: Sat, 01 Jan 2011 14:37:51 -0000
X-Groupsio-MsgNum: 27626
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Vsc1e05RV3789b+S0hVc"

--=-Vsc1e05RV3789b+S0hVc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`bitbake -k console-image` give the following error message in task
`qa_staging` for `binutils_2.21.bb`.

        $ more minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/binutils-=
2.21-r13.1/temp/log.do_qa_staging.19251=20
        ERROR: QA Issue with staging: libopcodes.la failed sanity test (wor=
kdir) in path /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-o=
e-linux-uclibceabi/usr/lib
        ERROR: QA Issue with staging: libbfd.la failed sanity test (workdir=
) in path /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/lib
        FATAL: QA staging was broken by the package built above
        ERROR: Error in executing python function in: /oe/openembedded/reci=
pes/binutils/binutils_2.21.bb
        ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
        ERROR: Printing the environment of the function
        ERROR: Function do_qa_staging failed


Thanks and a happy new year,

Paul

--=-Vsc1e05RV3789b+S0hVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0fPCwACgkQPX1aK2wOHVgxlQCeIgTwTnUaGTFzpreKZnIOkdiq
ay0AoIwfyhtax8urVRr6kZbIhScyH68E
=U/GX
-----END PGP SIGNATURE-----

--=-Vsc1e05RV3789b+S0hVc--
