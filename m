Received: from col0-omc4-s1.col0.hotmail.com ([65.55.34.203])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RqBat-00019L-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 23:45:32 +0100
Received: from COL120-W44 ([65.55.34.200]) by col0-omc4-s1.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 25 Jan 2012 14:36:40 -0800
Message-ID: <COL120-W44C8BBA66A5989AFCDDD25DD880@phx.gbl>
X-Originating-IP: [70.137.132.86]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jan 2012 14:36:40 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Jan 2012 22:36:40.0555 (UTC)
	FILETIME=[CE687BB0:01CCDBB1]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Perl extension for OpenSSL - Net::SSLeay
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
X-List-Received-Date: Wed, 25 Jan 2012 22:45:32 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C

I am not sure if this is the right list.

Trying to add Net::SSLeay perl module=2C I get the following error.



 NOTE: Running task 204 of 315 (ID: 11=2C=20
/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackco=
re-common/recipes/

net-ssleay/net-ssleay_1.36.bb=2C do_compile)

ERROR: TaskFailed event exception=2C aborting

ERROR: Build of=20
/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackco=
re-common/recipes/net-ssleay/net-ssleay_1.36.bb

 do_compile failed

ERROR: Task 11=20
(/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackc=
ore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C

 do_compile) failed with 256

ERROR:=20
'/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackc=
ore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
 failed

NOTE: package net-ssleay-1.36-r0: task do_compile: Started

ERROR: Function do_compile failed

NOTE: Task failed: ('function do_compile failed'=2C=20
'/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds=
_release/work/

ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')

ERROR: Logfile of failure stored in:=20
/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_=
release/work/ppce500mc-

linux/net-ssleay-1.36-r0/temp/log.do_compile.22680

Log data follows:

| NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimizations=
=20
-frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive

-optimizations -frename-registers -fomit-frame-pointer -O2 -g0=20
LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return=20
--sysroot=3D/home/Simran/

Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysro=
ots/ppce500mc-linux

| Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release

/sysroots/i686-linux/usr/lib/perl/5.10.1=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release/sysroots/i686-linux/usr/lib

/perl/5.10.1=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
 /home/

jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023r=
ds_release/sysroots/i686-linux/usr/lib/perl .).

| BEGIN failed--compilation aborted.

| make: *** [blib/lib/Net/.exists] Error 2

| make: *** Waiting for unfinished jobs....

| Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/

build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release

/sysroots/i686-linux/usr/lib/perl/5.10.1=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release/sysroots/i686-linux/usr

/lib/perl/5.10.1=20
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release/sysroots/i686-linux/usr/lib/perl
 .).

| BEGIN failed--compilation aborted.

| make: *** [blib/arch/.exists] Error 2

| FATAL: oe_runmake failed

| ERROR: Function do_compile failed

NOTE: package net-ssleay-1.36-r0: task do_compile: Failed

ERROR: TaskFailed event exception=2C aborting





I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit archive.

Please advice and thanks.



Sim Gill 		 	   		  =

