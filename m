Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJtYm-0004mL-G4 for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 22:29:39 +0200
Received: from f053032140.adsl.alicedsl.de ([78.53.32.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJtXO-0004HX-Hk for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 20:28:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201105101555.50984.sgh@sgh.dk>
References: <201105101555.50984.sgh@sgh.dk>
Date: Tue, 10 May 2011 22:26:51 +0200
Message-ID: <1305059211.9982.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: acpid-1.0.10-r5.1 fails compilation
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
X-List-Received-Date: Tue, 10 May 2011 20:29:40 -0000
X-Groupsio-MsgNum: 31885
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-e+N1/81TvfTafhH4bhsz"

--=-e+N1/81TvfTafhH4bhsz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear S=C3=B8ren,


Am Dienstag, den 10.05.2011, 15:55 +0200 schrieb S=C3=B8ren Holm:

> ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/=
work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235
> Log data follows:
> | ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc1=
6/tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235 =
for further information)
> | + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid=
-1.0.10-r5.1/acpid-1.0.10
> | + do_compile
> | + oe_runmake 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroo=
t=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
> | + oenote make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --=
sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux'=
 CROSS=3Di686-angstrom-linux-
> | + echo NOTE: 'make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpr=
o --sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-li=
nux CROSS=3Di686-angstrom-linux-'
> | NOTE: make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysr=
oot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux CROS=
S=3Di686-angstrom-linux-
> | + make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=
=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> acpid.o acpid.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> acpi_ids.o acpi_ids.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> connection_list.o connection_list.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> event.o event.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> input_layer.o input_layer.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> libnetlink.o libnetlink.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> netlink.o netlink.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> proc.o proc.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o=20
> sock.o sock.c
> | cc1: warnings being treated as errors
> | libnetlink.c: In function 'addraw_l':
> | libnetlink.c:521:56: error: comparison between signed and unsigned inte=
ger expressions
> | make: *** [libnetlink.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package acpid-1.0.10-r5.1: task do_compile: Failed

I could build it fine using `minimal` as distribution for `MACHINE =3D
"beagleboard"`. You seem to compile for i686. I do not know what differs
there.


Thanks,

Paul

--=-e+N1/81TvfTafhH4bhsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Jn34ACgkQPX1aK2wOHViA4gCfRfXWSrs4ZNRV1sgGG7lovUTy
NwwAnjlXlbB9Ax81tHcebQtU1EXKUpnE
=fUzm
-----END PGP SIGNATURE-----

--=-e+N1/81TvfTafhH4bhsz--
