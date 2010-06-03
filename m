Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.15]
	helo=VA3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OK9bi-0006Nt-Qk
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 14:33:14 +0200
Received: from mail150-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	8.1.340.0; Thu, 3 Jun 2010 12:13:47 +0000
Received: from mail150-va3 (localhost.localdomain [127.0.0.1])	by
	mail150-va3-R.bigfish.com (Postfix) with ESMTP id 2720DE50425	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 12:13:47 +0000 (UTC)
X-SpamScore: -48
X-BigFish: VPS-48(zz542N1432P14e3M98dN14ffO1443Na2dbK9371Pzz1202hz4fhzz32i2a8h43h61h)
Received: from mail150-va3 (localhost.localdomain [127.0.0.1]) by mail150-va3
	(MessageSwitch) id 1275567224969328_18726;
	Thu,  3 Jun 2010 12:13:44 +0000 (UTC)
Received: from VA3EHSMHS028.bigfish.com (unknown [10.7.14.250])	by
	mail150-va3.bigfish.com (Postfix) with ESMTP id E8E44102804D	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 12:13:44 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	VA3EHSMHS028.bigfish.com (10.7.99.38) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 3 Jun 2010 12:13:43 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Thu, 3 Jun 2010 17:43:11 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Jun 2010 17:43:10 +0530
Thread-Topic: [oe] (no subject)
Thread-Index: AcsC220SqLxjXigjQFeoP6+jL/BRYQAOWtxB
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF8C@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>
	<AEB54AFF070EB34A921BC7E006B711BE11905D1147@SRV10.nortechonline.net>
	<76E258664B189C4CBEF125491CA11ECC9445E0CF88@KCINPUNHJCMS01.kpit.com>,
	<AANLkTinJcbZ3ApaSpSvsrte40TWF8f5Rz3NIIXX8ZhCR@mail.gmail.com>
In-Reply-To: <AANLkTinJcbZ3ApaSpSvsrte40TWF8f5Rz3NIIXX8ZhCR@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 216.32.180.15
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Thu, 03 Jun 2010 12:33:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
   =20
MACHINE =3D "at91sam9263ek"
DISTRO =3D "angstrom-2008.1"
   =20
  I am new to this open embedded so you may seem may question is silly..
I need to know wat i need to deploy to my target and where the final image =
is stored..
Please help me out.. Thanks in advance :-)

Regards,
Soumya
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Khem Raj [raj.khem@gmail.com]
Sent: Thursday, June 03, 2010 10:40 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] (no subject)

On Wed, Jun 2, 2010 at 7:37 PM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Ya you are right i am using Ubuntu 10.4..
> Thanks a lot for the reply it worked..
>
> Thank you so much:-)

are you using .dev ?. I don't see this issue here locally on ubuntu
10.04. whats your distro
and machine.it could be issue in ipkg-utils-native

Thx
-Khem

> home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/=
arfile.py
>
> Change the line:
> size =3D int(descriptor[5])
>
> To:
> size =3D int(descriptor[3])
>
> I'm afraid I can't explain why you need to do this, only that it works fo=
r me.
>
> Simon
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Soumya R
> Sent: 02 June 2010 10:20
> To: openembedded-devel@lists.openembedded.org
> Cc: angstrom-distro-devel@linuxtogo.org
> Subject: [oe] (no subject)
>
> Hi All,
>
>   I am running bibake micro-image i got the following error,
>
> NOTE: Running task 965 of 970 (ID: 93, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_write)
> NOTE: Running task 966 of 970 (ID: 18, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/images/micro-image.bb, do_package_update_index_ipk)
> ERROR: function do_package_update_index_ipk failed
> ERROR: log data follows (/home/likewise-open/KPIT/soumyar/oe/build/tmp/wo=
rk/at91sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_pack=
age_update_index_ipk.24831)
> | + ipkgarchs=3D'all any noarch arm  armv4 armv4t armv5te at91sam9263ek'
> | + '[' '!' -z '' ']'
> | + mkdir -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/i=
pk
> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/=
Packages
> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages.filelist -m /home/likewise-open/KPIT/soumyar/oe/build=
/tmp/deploy/glibc/ipk
> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/b=
in/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashli=
b instead
> |   import md5
> |
> | + for arch in '$ipkgarchs'
> | + '[' -e /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk=
/all/ ']'
> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/=
all/Packages
> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/all/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/=
deploy/glibc/ipk/all/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/=
tmp/deploy/glibc/ipk/all/Packages.filelist -m /home/likewise-open/KPIT/soum=
yar/oe/build/tmp/deploy/glibc/ipk/all/
> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/b=
in/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashli=
b instead
> |   import md5
> | Traceback (most recent call last):
> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-lin=
ux/usr/bin/ipkg-make-index", line 114, in <module>
> |     pkg =3D ipkg.Package(filename)
> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-lin=
ux/usr/bin/ipkg.py", line 161, in __init__
> |     tarStream =3D ar.open("control.tar.gz")
> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-lin=
ux/usr/bin/arfile.py", line 59, in open
> |     f =3D self._scan(fname)
> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-lin=
ux/usr/bin/arfile.py", line 79, in _scan
> |     size =3D int(descriptor[5])
> | IndexError: list index out of range
> NOTE: Task failed: /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/at9=
1sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_package_up=
date_index_ipk.24831
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/=
images/micro-image.bb do_package_update_index_ipk failed
> NOTE: Running task 967 of 970 (ID: 95, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_stage)
> ERROR: Task 18 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/=
images/micro-image.bb, do_package_update_index_ipk) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd=
-utils-native_1.3.1.bb, do_package_stage (24841)
> NOTE: Tasks Summary: Attempted 965 tasks of which 927 didn't need to be r=
erun and 1 failed.
> ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/m=
icro-image.bb' failed
> KPIT\soumyar@d-5289lnx:~/oe/build$
>
>   Anybody can help me out to resolve this.Any suggestions are welcome:-)
>
> Thanks in advance:-)
>
> Regards,
> Soumya
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




