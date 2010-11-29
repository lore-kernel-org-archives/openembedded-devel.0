Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PNAH1-0002C7-OY for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 21:24:32 +0100
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PNAFm-0000fl-6T for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 20:23:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=vVQAdAt8xn=xervkgoqbddkucX+qa1ot5Yd-1@mail.gmail.com>
References: <1290773704.28296.30.camel@mattotaupa>
	<AANLkTi=vVQAdAt8xn=xervkgoqbddkucX+qa1ot5Yd-1@mail.gmail.com>
Date: Mon, 29 Nov 2010 21:23:12 +0100
Message-ID: <1291062192.3975.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xbmc: task `compile` fails with `/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'`
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
X-List-Received-Date: Mon, 29 Nov 2010 20:24:32 -0000
X-Groupsio-MsgNum: 26701
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uyj8p41DYd+6rv8ZVBg/"

--=-uyj8p41DYd+6rv8ZVBg/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 29.11.2010, 11:43 -0800 schrieb Khem Raj:
> On Fri, Nov 26, 2010 at 4:15 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> >        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-=
a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/=
oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -f=
expensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 =
-fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEF=
ILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Ds=
oftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dn=
eon -mvectorize-with-neon-quad -isystem/oe/build/angstrom-dev/sysroots/armv=
7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-re=
gisters -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-h=
idden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D=
64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-ma=
rch=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isy=
stem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/inclu=
de -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -g=
gdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_L=
ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-ab=
i=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfp=
u=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTFWriter.o XBMCTex.o ../=
../guilib/XBTF.o      -L/oe/build/angstrom-dev/sysroots/armv7a-angstrom-lin=
ux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu ../../xbmc/lib=
/libsquish/libsquish-arm.a -lSDL_image -lSDL -llzo2 -o TexturePacker
> >        XBMCTex.o: In function `main':
> >        /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-1=
0.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git/tools/TexturePac=
ker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'
> >        collect2: ld returned 1 exit status
> >        make[1]: *** [TexturePacker] Error 1
> >        make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-a=
ngstrom-linux-gnueabi/xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c7=
14adcbe/git/tools/TexturePacker'
> >        make: *** [tools/TexturePacker/TexturePacker] Error 2
>=20
> It seems link line has -llzo2 and liblzo2 should contain this
> function, you could investigate.
> 1. If liblzo2 exists in the staging area

        /oe/build/angstrom-dev$ find sysroots/ -iname *liblzo*
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo.so.1
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo.a
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.a
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.so.2
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.la
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo.la
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.so.2.0.0
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo.so.1.0.0
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo.so
        sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/liblzo2.so

> 2. If it does then dump the symbols it has exported as globals

        /oe/build/angstrom-dev$ objdump -t sysroots/armv7a-angstrom-linux-g=
nueabi/usr/lib/liblzo.so | grep lzo_init
        00000000 l    df *ABS*  00000000              lzo_init.c
        0000274c g     F .text  000000c8              __lzo_init2
        00024ba8 g     O .bss   00000004              __lzo_init_done
        00002814 g     F .text  00000054              __lzo_init
        /oe/build/angstrom-dev$ objdump -t sysroots/armv7a-angstrom-linux-g=
nueabi/usr/lib/liblzo2.so | grep lzo_init
        00000000 l    df *ABS*  00000000              lzo_init.c
        000021fc g     F .text  000000c8              __lzo_init_v2
        000247a0 g     O .bss   00000004              __lzo_init_done

> 3. If the symbol __lzo_init2 is not exported then find out if
> something is wrong with liblzo2 builds that can result in this
> exlusion

Sorry, I do not know how to do that.


Thanks,

Paul

--=-uyj8p41DYd+6rv8ZVBg/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkz0C6oACgkQPX1aK2wOHVjuSwCfTdifEQo/od8LlZKi7/hiUjqA
A7EAnRIfTrHGpwjtIJ8vyzqE0OH/WQjK
=Aqz3
-----END PGP SIGNATURE-----

--=-uyj8p41DYd+6rv8ZVBg/--
