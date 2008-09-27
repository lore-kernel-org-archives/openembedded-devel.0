Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1KjdIr-0004sb-TL
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 19:09:57 +0200
Received: from [10.0.0.200] (M9c31.m.pppool.de [89.49.156.49])
	by mrelayeu.kundenserver.de (node=mrelayeu6) with ESMTP (Nemesis)
	id 0ML29c-1KjdF62PWv-0001kv; Sat, 27 Sep 2008 19:06:05 +0200
Message-ID: <48DE67FC.4030505@linuxdevelopment.de>
Date: Sat, 27 Sep 2008 19:06:04 +0200
From: =?UTF-8?B?Um9iZXJ0IFfDtnJsZQ==?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48DE3D09.4090608@linuxdevelopment.de>
	<1222526214.8743.10.camel@lenovo.internal.reciva.com>
In-Reply-To: <1222526214.8743.10.camel@lenovo.internal.reciva.com>
X-Provags-ID: V01U2FsdGVkX1+E9+1UJjayrzmRXGVmY2sDINES1GfGNBBH4Oy
	M6T/iGs7Qw3VF4/Us1cEEjGpo/5HSiYO981TqwwzVxWyAiCalm
	vGfpJSO6+4IV33LQZN5mNpP8not9nf6hMxlmDojvU4=
Subject: Re: x86_64 host -- never ending story
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
X-List-Received-Date: Sat, 27 Sep 2008 17:09:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ok so here is a output for a i686-generic run

Will a i586 be better , but produce slower binary `s ??



OE Build Configuration:
BB_VERSION        =3D "1.8.11"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "4ac14ced8bc6330634ea2b24a201a4f6a556ef24"
TARGET_ARCH       =3D "i686"
TARGET_OS         =3D "linux"
MACHINE           =3D "i686-generic"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2008.1-test-20080927"
TARGET_FPU        =3D ""

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 181 of 790 (ID: 336,=20
/home/bob/oe/org.openembedded.dev/packages/glibc/glibc-intermediate_2.6.1=
=2Ebb,=20
do_compile)
NOTE: package glibc-intermediate-2.6.1: started
NOTE: package glibc-intermediate-2.6.1-r6: task do_compile: started
make[2]: Leaving directory=20
`/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-=
r6/glibc-2.6.1/elf'
cd=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux=20
&&=20
/home/bob/oe/i686/tmp/cross/lib/gcc/i686-angstrom-linux/4.2.4/../../../..=
/i686-angstrom-linux/bin/ar=20
cruv libc.a `cat csu/stamp.o iconv/stamp.o iconvdata/stamp.o=20
locale/stamp.o localedata/stamp.o assert/stamp.o ctype/stamp.o=20
intl/stamp.o catgets/stamp.o math/stamp.o setjmp/stamp.o signal/stamp.o=20
stdlib/stamp.o stdio-common/stamp.o libio/stamp.o dlfcn/stamp.o=20
malloc/stamp.o string/stamp.o wcsmbs/stamp.o timezone/stamp.o=20
time/stamp.o dirent/stamp.o grp/stamp.o pwd/stamp.o posix/stamp.o=20
io/stamp.o termios/stamp.o resource/stamp.o misc/stamp.o socket/stamp.o=20
sysvipc/stamp.o gmon/stamp.o gnulib/stamp.o wctype/stamp.o=20
manual/stamp.o shadow/stamp.o po/stamp.o argp/stamp.o crypt/stamp.o=20
nptl/stamp.o resolv/stamp.o nss/stamp.o rt/stamp.o conform/stamp.o=20
debug/stamp.o nptl_db/stamp.o inet/stamp.o hesiod/stamp.o sunrpc/stamp.o =

nis/stamp.o nscd/stamp.o streams/stamp.o login/stamp.o elf/stamp.o stamp.=
o`
r - locale/C-ctype.o
:=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc.a
i686-angstrom-linux-gcc -mcpu=3Dpentiumpro   -nostdlib -nostartfiles -r -=
o=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os=20
\
         -Wl,-d -Wl,--whole-archive=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.a
i686-angstrom-linux-gcc -mcpu=3Dpentiumpro   -shared -static-libgcc=20
-Wl,-O1  -Wl,-z,defs -Wl,-dynamic-linker=3D/lib/ld-linux.so.2 =20
-B/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/csu/ =20
-Wl,--version-script=3D/home/bob/oe/i686/tmp/work/i686-angstrom-linux/gli=
bc-intermediate-2.6.1-r6/build-i686-angstrom-linux/libc.map=20
-Wl,-soname=3Dlibc.so.6 -Wl,-z,combreloc -Wl,-z,relro=20
-Wl,--hash-style=3Dboth -nostdlib -nostartfiles -e __libc_main=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/math=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/elf=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/dlfcn=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/nss=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/nis=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/rt=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/resolv=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/crypt=20
-L/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1=
-r6/build-i686-angstrom-linux/nptl=20
-Wl,-rpath-link=3D/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-in=
termediate-2.6.1-r6/build-i686-angstrom-linux:/home/bob/oe/i686/tmp/work/=
i686-angstrom-linux/glibc-intermediate-2.6.1-r6/build-i686-angstrom-linux=
/math:/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2=
=2E6.1-r6/build-i686-angstrom-linux/elf:/home/bob/oe/i686/tmp/work/i686-a=
ngstrom-linux/glibc-intermediate-2.6.1-r6/build-i686-angstrom-linux/dlfcn=
:/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-=
r6/build-i686-angstrom-linux/nss:/home/bob/oe/i686/tmp/work/i686-angstrom=
-linux/glibc-intermediate-2.6.1-r6/build-i686-angstrom-linux/nis:/home/bo=
b/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r6/build-=
i686-angstrom-linux/rt:/home/bob/oe/i686/tmp/work/i686-angstrom-linux/gli=
bc-intermediate-2.6.1-r6/build-i686-angstrom-linux/resolv:/home/bob/oe/i6=
86/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r6/build-i686-an=
gstrom-linux/crypt:/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-i=
ntermediate-2.6.1-r6/build-i686-angstrom-linux/nptl=20
-o=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc.so=20
-T=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/shlib.lds=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/csu/abi-note.o=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/elf/soinit.os=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/elf/sofini.os=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/elf/interp.os=20
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/elf/ld.so=20
-lgcc
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `__fork':
(.text+0x78a9f): undefined reference to `__sync_bool_compare_and_swap_4'
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `nscd_getpw_r':
nscd_getpw_r.c:(.text+0xda2e1): undefined reference to=20
`__sync_fetch_and_add_4'
nscd_getpw_r.c:(.text+0xda326): undefined reference to=20
`__sync_fetch_and_add_4'
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `nscd_getgr_r':
nscd_getgr_r.c:(.text+0xda755): undefined reference to=20
`__sync_fetch_and_add_4'
nscd_getgr_r.c:(.text+0xda798): undefined reference to=20
`__sync_fetch_and_add_4'
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `nscd_gethst_r':
nscd_gethst_r.c:(.text+0xdae04): undefined reference to=20
`__sync_fetch_and_add_4'
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:nscd_gethst_r.c:(.text+0xdae49): =

more undefined references to `__sync_fetch_and_add_4' follow
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `__nscd_get_map_ref':
(.text+0xdce5f): undefined reference to `__sync_val_compare_and_swap_4'
/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-r=
6/build-i686-angstrom-linux/libc_pic.os:=20
In function `__GI___libc_freeres':
(__libc_freeres_fn+0x8ad): undefined reference to=20
`__sync_bool_compare_and_swap_4'
collect2: ld returned 1 exit status
make[1]: ***=20
[/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-=
r6/build-i686-angstrom-linux/libc.so]=20
Error 1
make[1]: Leaving directory=20
`/home/bob/oe/i686/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.1-=
r6/glibc-2.6.1'
make: *** [all] Error 2
FATAL: oe_runmake failed

Phil Blundell schrieb:
> On Sat, 2008-09-27 at 16:02 +0200, Robert W=C3=B6rle wrote:
>  =20
>> Can one give a quick and brief explanation why using oe on a x86_64 ho=
st=20
>> is sooo difficult.
>> I am having always a hard time to setup oe and build on that ... many =

>> architectures break on glibc-native or such stuff lile avr32.=20
>> i686-generic or even arm sometimes ?
>>    =20
>
> What exactly are the problems you've been seeing?  All the build hosts
> that I use for OE nowadays are x86-64 and I haven't experienced any
> breakage of the kind that you hint at.  I don't think I've ever tried t=
o
> build for an avr32 target but I do compile regularly for i586 and
> various kinds of arm.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20




