Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I2K8Z-0003DB-5M
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2007 06:55:47 +0200
Received: by an-out-0708.google.com with SMTP id b33so228597ana
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2007 21:51:42 -0700 (PDT)
Received: by 10.100.128.8 with SMTP id a8mr2473954and.1182660702401;
	Sat, 23 Jun 2007 21:51:42 -0700 (PDT)
Received: by 10.100.38.3 with HTTP; Sat, 23 Jun 2007 21:51:42 -0700 (PDT)
Message-ID: <ae36f8040706232151g2a3b2bdbw9954f99ae1b752f@mail.gmail.com>
Date: Sun, 24 Jun 2007 01:51:42 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: problems building cups
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jun 2007 04:55:47 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

someone know how to fix this :
 bitbake cups
NOTE: Handling BitBake files: / (4619/4619) [100 %]
NOTE: Parsing finished. 4397 cached, 0 parsed, 222 skipped, 0 masked.
NOTE: build 200706240150: started

OE Build Configuration:
BB_VERSION     =3D "1.8.4"
OE_REVISION    =3D "ef8c722889bd5cf7ded674cfc20d139a00318a1c"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-gnueabi"
MACHINE        =3D "omap5912osk"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "test-20070624"
TARGET_FPU     =3D "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 490 of 494 (ID: 5,
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/c=
ups/cups_1.2.10.bb,
do_package)
NOTE: package cups-1.2.10: started
NOTE: package cups-1.2.10-r0: task do_package: started
!!! Failed to move ./var/run/cups/certs to
/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-angstrom-linux=
-gnueabi/cups-
1.2.10-r0/install/cups/./var/run/cups/certs
!!! [Errno 13] Permission denied
NOTE: Task failed: File population failed
NOTE: package cups-1.2.10-r0: task do_package: failed
ERROR: TaskFailed event exception, aborting
NOTE: package cups-1.2.10: failed
ERROR: Build of
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/c=
ups/cups_1.2.10.bb
do_package failed
ERROR: Task 5
(/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
cups/cups_1.2.10.bb,
do_package) failed
NOTE: Tasks Summary: Attempted 489 tasks of which 489 didn't need to be
rerun and 1 failed.
ERROR:
'/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
cups/cups_1.2.10.bb'
failed


--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

