Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=552e172a1@cirsa.com>)
	id 1N5gRX-0005kh-RJ for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 15:02:38 +0100
X-IronPort-AV: E=Sophos;i="4.44,680,1249250400"; 
   d="scan'208";a="3770618"
Received: from unknown (HELO NTCASA.central.cirsa.com) ([172.17.102.9])
	by pegasus.cirsa.com with ESMTP; 04 Nov 2009 15:01:23 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASA.central.cirsa.com (172.17.102.9) with Microsoft SMTP Server id
	8.2.176.0; Wed, 4 Nov 2009 15:01:23 +0100
In-Reply-To: <hcrnsl$ec8$1@ger.gmane.org>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OFFF5496A3.0A09B325-ONC1257664.004CE2E8-C1257664.004D1F00@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Wed, 4 Nov 2009 15:01:22 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 04/11/2009 15:01:22,
	Serialize complete at 04/11/2009 15:01:22
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
X-List-Received-Date: Wed, 04 Nov 2009 14:02:39 -0000
Content-Type: text/plain; charset="US-ASCII"

> On 04-11-09 11:27, jorge fernandez monteagudo wrote:
> > Hi OE list members!
> >
> > It's my first message on this list, and it's related to the problems I
> > have building
> > OE for my beagleboard. My host machine is a mandriva 2008.0.
> >
> > I'm following the steps from
> > http://elinux.org/BeagleBoardAndOpenEmbeddedGit
> 
> If you're going to build for beagleboard, don't use that guide, but use 
> http://www.angstrom-distribution.org/building-angstrom
> 
> regards,
> 
> Koen
> 

Thank you!

It's seems it works! I'm still building but that packages has been built 
ok.

regards
Jorge
From prvs=jorgefm=552e172a1@cirsa.com Wed Nov 04 16:51:02 2009
Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=552e172a1@cirsa.com>)
	id 1N5i8R-0008LC-8Z for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 16:51:02 +0100
X-IronPort-AV: E=Sophos;i="4.44,680,1249250400"; 
   d="scan'208";a="3771848"
Received: from unknown (HELO NTCASB.central.cirsa.com) ([172.17.102.10])
	by pegasus.cirsa.com with ESMTP; 04 Nov 2009 16:49:46 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASB.central.cirsa.com (172.17.102.10) with Microsoft SMTP Server id
	8.2.176.0; Wed, 4 Nov 2009 16:49:46 +0100
In-Reply-To: <hcrpid$jbi$1@ger.gmane.org>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OF989014BA.63B33D1E-ONC1257664.00568597-C1257664.00570B60@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Wed, 4 Nov 2009 16:49:45 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 04/11/2009 16:49:45,
	Serialize complete at 04/11/2009 16:49:45
X-SA-Exim-Connect-IP: 195.77.234.26
X-SA-Exim-Mail-From: prvs=jorgefm=552e172a1@cirsa.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Content-Type: text/plain; charset="US-ASCII"
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe] Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Wed, 04 Nov 2009 15:51:02 -0000

> On 04-11-09 12:17, Koen Kooi wrote:
> > On 04-11-09 11:27, jorge fernandez monteagudo wrote:
> >> Hi OE list members!
> >>
> >> It's my first message on this list, and it's related to the problems 
I
> >> have building
> >> OE for my beagleboard. My host machine is a mandriva 2008.0.
> >>
> >> I'm following the steps from
> >> http://elinux.org/BeagleBoardAndOpenEmbeddedGit
> >
> > If you're going to build for beagleboard, don't use that guide, but 
use
> > http://www.angstrom-distribution.org/building-angstrom
> 
> Before someone says "it's a wiki, fix it!" I must point that this it's a 

> wiki and people have already unfixed it multiple times. The amount of 
> unfixing is just too vast, which is why the official angstrom 
> instructions aren't in a wiki!
> 
> regards,
> 
> Koen
> 

Hi again!

I think I was so fast saying that it was ok!

I get the same error:


NOTE: Running task 570 of 2946 (ID: 2357, 
/mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb, 
do_configure)
NOTE: Running task 571 of 2946 (ID: 1256, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_qa_configure)
NOTE: Running task 572 of 2946 (ID: 1257, 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_compile)
NOTE: Running task 573 of 2946 (ID: 1765, 
/mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb, 
do_install)
NOTE: Running task 574 of 2946 (ID: 1766, 
/mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb, 
do_populate_staging)
ERROR: function do_compile failed
ERROR: see log in 
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.26067
NOTE: Task failed: 
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.26067
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb 
do_compile failed
ERROR: Task 1257 
(/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb, 
do_compile) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: 
/mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb, 
do_configure (25414)
NOTE: 2: 
/mnt/hdb1/arm-beagle/openembedded/recipes/glib-2.0/glib-2.0-native_2.18.0.bb, 
do_configure (21833)
NOTE: 3: 
/mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb, 
do_populate_staging (2781)
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: 
/mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb, 
do_configure (25414)
NOTE: 2: 
/mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb, 
do_populate_staging (2781)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: 
/mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb, 
do_populate_staging (2781)
NOTE: Tasks Summary: Attempted 570 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: 
'/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.18.50.0.7.bb' 
failed


and the error log:

NOTE: make configure-build-libiberty all
make[1]: Entering directory 
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
make[2]: Entering directory 
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
if [ x"" != x ]; then \
          gcc -c -DHAVE_CONFIG_H 
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include 
-O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-
        else true; fi
gcc -c -DHAVE_CONFIG_H 
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include 
-O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-l
Use of uninitialized value in concatenation (.) or string at 
/usr/share/colorgcc/gcc line 200.
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:151: 
warning: implicit
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: 'LONG_MIN'
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: (Each unde
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258: 
error: for each f
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c: 
In function 'fibheap_
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360: 
warning: implicit
/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360: 
warning: incompat
make[2]: *** [fibheap.o] Error 1
make[2]: Leaving directory 
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
make[1]: *** [all-libiberty] Error 2
make[1]: Leaving directory 
`/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
make: *** [all] Error 2
FATAL: oe_runmake failed


I've check the 'fibheap.c' file and I've seen:


#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_LIMITS_H
#include <limits.h>
#endif
#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif
#ifdef HAVE_STRING_H
#include <string.h>
#endif
#include "libiberty.h"
#include "fibheap.h"


#define FIBHEAPKEY_MIN  LONG_MIN

The problem is that HAVE_LIMITS_H is undefined in config.h then LONG_MIN 
is undefined. Where can I check how the 'config.h' 
is generated?

Regards,
Jorge

