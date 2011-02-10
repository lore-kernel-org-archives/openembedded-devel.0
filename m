Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PneiF-0006Aj-0p for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 23:10:07 +0100
Received: from f053040180.adsl.alicedsl.de ([78.53.40.180]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnehE-0005h1-5d for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 22:09:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1297370653.3877.26.camel@mattotaupa>
References: <1297363922.3877.24.camel@mattotaupa>
	<1297370653.3877.26.camel@mattotaupa>
Date: Thu, 10 Feb 2011 23:09:03 +0100
Message-ID: <1297375743.3877.29.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: libsdl-mixer_1.2.11: task compile fails with `/bin/sed: can't read =/usr/lib/libts.la: No such file or directory`
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
X-List-Received-Date: Thu, 10 Feb 2011 22:10:07 -0000
X-Groupsio-MsgNum: 29021
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tUReP1byADX4dLAytLXU"

--=-tUReP1byADX4dLAytLXU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.02.2011, 21:44 +0100 schrieb Paul Menzel:
> Am Donnerstag, den 10.02.2011, 19:52 +0100 schrieb Paul Menzel:
>=20
> > task compile of `libsdl-mixer_1.2.11.bb` fails with the following error
> > message using `angstrom-2010.x` for `MACHINE=3D"beagleboard"`.
> >=20
> >         NOTE: make -j4 SDL_LIBS=3D-lSDL -lpthread   -Wl,-rpath-link,/oe=
/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/lib
> >         /bin/sh ./build-scripts/mkinstalldirs build
> >        =20
> >         [=E2=80=A6]
> >        =20
> >         libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv=
7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork =
-mno-thumb -isystem/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-ang=
strom-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2 -ggdb2 -isystem/oe/build-angstrom-next/angstrom-=
dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D1 -D=
_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build-angstrom-next/angstrom-dev/sysroot=
s/armv7a-angstrom-linux-gnueabi/usr/include/SDL -DHAVE_FORK -DCMD_MUSIC -DW=
AV_MUSIC -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2=
\" -DMID_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=
=3D\"libFLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/playwave.lo -c playwave.=
c -o build/playwave.o >/dev/null 2>&1
> >         libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv=
7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork =
-mno-thumb -isystem/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-ang=
strom-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -O2 -ggdb2 -isystem/oe/build-angstrom-next/angstrom-=
dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D1 -D=
_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build-angstrom-next/angstrom-dev/sysroot=
s/armv7a-angstrom-linux-gnueabi/usr/include/SDL -DHAVE_FORK -DCMD_MUSIC -DW=
AV_MUSIC -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2=
\" -DMID_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=
=3D\"libFLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/playmus.lo -c playmus.c =
-o build/playmus.o >/dev/null 2>&1
> >         libtool: link: warning: library `/oe/build-angstrom-next/angstr=
om-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libSDL.la' was moved.
> >         ./libtool: line 6399: cd: =3D/usr/lib: No such file or director=
y
> >         libtool: link: warning: cannot determine absolute directory nam=
e of `=3D/usr/lib'
> >         /bin/grep: =3D/usr/lib/libts.la: No such file or directory
> >         /bin/sed: can't read =3D/usr/lib/libts.la: No such file or dire=
ctory
> >         libtool: link: `=3D/usr/lib/libts.la' is not a valid libtool ar=
chive
> >         make: *** [build/libSDL_mixer.la] Error 1
> >         make: *** Waiting for unfinished jobs....
> >         FATAL: oe_runmake failed
> >         ERROR: Function do_compile failed
> >=20
> > I suspect that commit 024e010e [1] has to do with it, but I have not
> > bisected it. If you need a bisection please tell me.
> >=20
> > Henning, do you know if this might be related?

I verified, that commit 024e010e indeed is the culprit. The recipe
builds just fine with d6e5809d [2].

> `libsdl-mixer_1.2.11.bb` builds fine using `angstrom-2008.1`. So it
> seems to be a Libtool issue.


Thanks,

Paul


> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D024=
e010e93704c5e6ba8276602b77b5ea59e40c5
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd6e5809=
d0874902ba951eb4b92338bbd61ecd533

--=-tUReP1byADX4dLAytLXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1UYf8ACgkQPX1aK2wOHVgLlACfUitbu5/51zKvFXBcbH02BitS
zQoAoINYbYa458J7J/nHI/hQ275fTSUA
=UzAP
-----END PGP SIGNATURE-----

--=-tUReP1byADX4dLAytLXU--
