Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=552e172a1@cirsa.com>)
	id 1N5iBw-00006v-Cb for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 16:54:39 +0100
X-IronPort-AV: E=Sophos;i="4.44,680,1249250400"; 
   d="scan'208";a="3771878"
Received: from unknown (HELO NTCASB.central.cirsa.com) ([172.17.102.10])
	by pegasus.cirsa.com with ESMTP; 04 Nov 2009 16:53:23 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASB.central.cirsa.com (172.17.102.10) with Microsoft SMTP Server id
	8.2.176.0; Wed, 4 Nov 2009 16:53:23 +0100
In-Reply-To: <OF989014BA.63B33D1E-ONC1257664.00568597-C1257664.00570B60@cirsa.com>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OF1FFB6143.17AC4B58-ONC1257664.005737F1-C1257664.0057601B@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Wed, 4 Nov 2009 16:53:22 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 04/11/2009 16:53:22,
	Serialize complete at 04/11/2009 16:53:22
X-SA-Exim-Connect-IP: 195.77.234.26
X-SA-Exim-Mail-From: prvs=jorgefm=552e172a1@cirsa.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Wed, 04 Nov 2009 15:54:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, the error log was truncated!

NOTE: make configure-build-libiberty all
make[1]: Entering directory=20
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binut=
ils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstrom=
-linux-gnueabi'
make[2]: Entering directory=20
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binut=
ils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstrom=
-linux-gnueabi/libiberty'
if [ x"" !=3D x ]; then \
          gcc -c -DHAVE=5FCONFIG=5FH=20
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include=20
-O2 -I.=20
-I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include=20
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic=20
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c=20
-o pic/fibheap.o; \
        else true; fi
gcc -c -DHAVE=5FCONFIG=5FH=20
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include=20
-O2 -I.=20
-I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include=20
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic=20
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c=20
-o fibheap.o
Use of uninitialized value in concatenation (.) or string at=20
/usr/share/colorgcc/gcc line 200.
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:=20
In function 'fibheap=5Funion':
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:151:=20
warning: implicit declaration of function 'free'
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:=20
In function 'fibheap=5Fdelete=5Fnode':
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:=20
error: 'LONG=5FMIN' undeclared (first use in this function)
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:=20
error: (Each undeclared identifier is reported only once
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:=20
error: for each function it appears in.)
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:=20
In function 'fibheap=5Fconsolidate':
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360:=20
warning: implicit declaration of function 'memset'
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binuti=
ls-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360:=20
warning: incompatible implicit declaration of built-in function 'memset'
make[2]: *** [fibheap.o] Error 1
make[2]: Leaving directory=20
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binut=
ils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstrom=
-linux-gnueabi/libiberty'
make[1]: *** [all-libiberty] Error 2
make[1]: Leaving directory=20
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binut=
ils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstrom=
-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe=5Frunmake failed

Regards,
Jorge


<openembedded-devel-bounces@lists.openembedded.org> escribi=F3 el 04/11/200=
9=20
16:49:45:

> > On 04-11-09 12:17, Koen Kooi wrote:
> > > On 04-11-09 11:27, jorge fernandez monteagudo wrote:
> > >> Hi OE list members!
> > >>
> > >> It's my first message on this list, and it's related to the=20
problems=20
> I
> > >> have building
> > >> OE for my beagleboard. My host machine is a mandriva 2008.0.
> > >>
> > >> I'm following the steps from
> > >> http://elinux.org/BeagleBoardAndOpenEmbeddedGit
> > >
> > > If you're going to build for beagleboard, don't use that guide, but=20
> use
> > > http://www.angstrom-distribution.org/building-angstrom
> >=20
> > Before someone says "it's a wiki, fix it!" I must point that this it's =

a=20
>=20
> > wiki and people have already unfixed it multiple times. The amount of=20
> > unfixing is just too vast, which is why the official angstrom=20
> > instructions aren't in a wiki!
> >=20
> > regards,
> >=20
> > Koen
> >=20
>=20
> Hi again!
>=20
> I think I was so fast saying that it was ok!
>=20
> I get the same error:
>=20
>=20
> NOTE: Running task 570 of 2946 (ID: 2357,=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native=5F5.8.8.bb,=20
> do=5Fconfigure)
> NOTE: Running task 571 of 2946 (ID: 1256,=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross=5F2.
> 18.50.0.7.bb,=20
> do=5Fqa=5Fconfigure)
> NOTE: Running task 572 of 2946 (ID: 1257,=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross=5F2.
> 18.50.0.7.bb,=20
> do=5Fcompile)
> NOTE: Running task 573 of 2946 (ID: 1765,=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native=5F2.6.1.bb=
,=20

> do=5Finstall)
> NOTE: Running task 574 of 2946 (ID: 1766,=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native=5F2.6.1.bb=
,=20

> do=5Fpopulate=5Fstaging)
> ERROR: function do=5Fcompile failed
> ERROR: see log in=20
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do=5Fcompile.26067
> NOTE: Task failed:=20
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do=5Fcompile.26067
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross=5F2.
> 18.50.0.7.bb=20
> do=5Fcompile failed
> ERROR: Task 1257=20
> (/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-
> cross=5F2.18.50.0.7.bb,=20
> do=5Fcompile) failed
> NOTE: Waiting for 3 active tasks to finish
> NOTE: 1:=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native=5F5.8.8.bb,=20
> do=5Fconfigure (25414)
> NOTE: 2:=20
>=20
/mnt/hdb1/arm-beagle/openembedded/recipes/glib-2.0/glib-2.0-native=5F2.18.0=
.bb,=20

> do=5Fconfigure (21833)
> NOTE: 3:=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native=5F2.6.1.bb=
,=20

> do=5Fpopulate=5Fstaging (2781)
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1:=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native=5F5.8.8.bb,=20
> do=5Fconfigure (25414)
> NOTE: 2:=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native=5F2.6.1.bb=
,=20

> do=5Fpopulate=5Fstaging (2781)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1:=20
> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native=5F2.6.1.bb=
,=20

> do=5Fpopulate=5Fstaging (2781)
> NOTE: Tasks Summary: Attempted 570 tasks of which 0 didn't need to be=20
> rerun and 1 failed.
> ERROR:=20
> '/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-
> cross=5F2.18.50.0.7.bb'=20
> failed
>=20
>=20
> and the error log:
>=20
> NOTE: make configure-build-libiberty all
> make[1]: Entering directory=20
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
> make[2]: Entering directory=20
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
> if [ x"" !=3D x ]; then \
>           gcc -c -DHAVE=5FCONFIG=5FH=20
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include =


> -O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-
>         else true; fi
> gcc -c -DHAVE=5FCONFIG=5FH=20
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include =


> -O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-l
> Use of uninitialized value in concatenation (.) or string at=20
> /usr/share/colorgcc/gcc line 200.
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:=20
> In function 'fibheap=5F
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:151:=20
> warning: implicit
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:=20
> In function 'fibheap=5F
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:258:=20
> error: 'LONG=5FMIN'
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:258:=20
> error: (Each unde
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:258:=20
> error: for each f
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:=20
> In function 'fibheap=5F
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:360:=20
> warning: implicit
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
> 7/libiberty/fibheap.c:360:=20
> warning: incompat
> make[2]: *** [fibheap.o] Error 1
> make[2]: Leaving directory=20
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>=20
gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
> make[1]: *** [all-libiberty] Error 2
> make[1]: Leaving directory=20
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>=20
gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
> make: *** [all] Error 2
> FATAL: oe=5Frunmake failed
>=20
>=20
> I've check the 'fibheap.c' file and I've seen:
>=20
>=20
> #ifdef HAVE=5FCONFIG=5FH
> #include "config.h"
> #endif
> #ifdef HAVE=5FLIMITS=5FH
> #include <limits.h>
> #endif
> #ifdef HAVE=5FSTDLIB=5FH
> #include <stdlib.h>
> #endif
> #ifdef HAVE=5FSTRING=5FH
> #include <string.h>
> #endif
> #include "libiberty.h"
> #include "fibheap.h"
>=20
>=20
> #define FIBHEAPKEY=5FMIN  LONG=5FMIN
>=20
> The problem is that HAVE=5FLIMITS=5FH is undefined in config.h then LONG=
=5FMIN=20

> is undefined. Where can I check how the 'config.h'=20
> is generated?
>=20
> Regards,
> Jorge
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

