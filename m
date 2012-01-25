Received: from col0-omc4-s18.col0.hotmail.com ([65.55.34.220])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RqBkw-0001Qc-LE
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 23:55:55 +0100
Received: from COL120-W64 ([65.55.34.199]) by col0-omc4-s18.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 25 Jan 2012 14:47:04 -0800
Message-ID: <COL120-W645DB7C0C0B94E04DE82C7DD880@phx.gbl>
X-Originating-IP: [70.137.132.86]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jan 2012 14:47:03 -0800
Importance: Normal
In-Reply-To: <COL120-W44C8BBA66A5989AFCDDD25DD880@phx.gbl>
References: <COL120-W44C8BBA66A5989AFCDDD25DD880@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Jan 2012 22:47:04.0213 (UTC)
	FILETIME=[42232450:01CCDBB3]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Perl extension for OpenSSL - Net::SSLeay
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
X-List-Received-Date: Wed, 25 Jan 2012 22:55:55 -0000
X-Groupsio-MsgNum: 36696
Content-Type: multipart/mixed;
	boundary="_c505ccb4-7b5c-4829-bd59-71f19b104648_"

--_c505ccb4-7b5c-4829-bd59-71f19b104648_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Forgot to attach the recipe. Please find attached.
> From: kyoonn@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> Date: Wed=2C 25 Jan 2012 14:36:40 -0800
> Subject: [oe] Perl extension for OpenSSL - Net::SSLeay
>=20
>=20
> Hello=2C
>=20
> I am not sure if this is the right list.
>=20
> Trying to add Net::SSLeay perl module=2C I get the following error.
>=20
>=20
>=20
>  NOTE: Running task 204 of 315 (ID: 11=2C=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-black=
core-common/recipes/
>=20
> net-ssleay/net-ssleay_1.36.bb=2C do_compile)
>=20
> ERROR: TaskFailed event exception=2C aborting
>=20
> ERROR: Build of=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-black=
core-common/recipes/net-ssleay/net-ssleay_1.36.bb
>=20
>  do_compile failed
>=20
> ERROR: Task 11=20
> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blac=
kcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C
>=20
>  do_compile) failed with 256
>=20
> ERROR:=20
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blac=
kcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
>  failed
>=20
> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
>=20
> ERROR: Function do_compile failed
>=20
> NOTE: Task failed: ('function do_compile failed'=2C=20
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080=
ds_release/work/
>=20
> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
>=20
> ERROR: Logfile of failure stored in:=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080d=
s_release/work/ppce500mc-
>=20
> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
>=20
> Log data follows:
>=20
> | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimization=
s=20
> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive
>=20
> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0=20
> LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return=20
> --sysroot=3D/home/Simran/
>=20
> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sys=
roots/ppce500mc-linux
>=20
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release
>=20
> /sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib
>=20
> /perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>  /home/
>=20
> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p102=
3rds_release/sysroots/i686-linux/usr/lib/perl .).
>=20
> | BEGIN failed--compilation aborted.
>=20
> | make: *** [blib/lib/Net/.exists] Error 2
>=20
> | make: *** Waiting for unfinished jobs....
>=20
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
>=20
> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release
>=20
> /sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr
>=20
> /lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>  .).
>=20
> | BEGIN failed--compilation aborted.
>=20
> | make: *** [blib/arch/.exists] Error 2
>=20
> | FATAL: oe_runmake failed
>=20
> | ERROR: Function do_compile failed
>=20
> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
>=20
> ERROR: TaskFailed event exception=2C aborting
>=20
>=20
>=20
>=20
>=20
> I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit archive=
.
>=20
> Please advice and thanks.
>=20
>=20
>=20
> Sim Gill 		 	   		 =20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =

--_c505ccb4-7b5c-4829-bd59-71f19b104648_
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="net-ssleay_1.36.bb"

REVTQ1JJUFRJT04gPSAiTmV0OjpTU0xlYXkgLSBQZXJsIGV4dGVuc2lvbiBmb3IgdXNpbmcgT3Bl
blNTTCIKU0VDVElPTiA9ICJsaWJzIgpMSUNFTlNFID0gIk9wZW5TU0wiCkRFUEVORFMgPSAib3Bl
bnNzbCB6bGliIgpSREVQRU5EU18ke1BOfSArPSAiIFwKCXBlcmwtbW9kdWxlLWNhcnAgXAoJcGVy
bC1tb2R1bGUtZXJybm8gXAoJcGVybC1tb2R1bGUtZXh0dXRpbHMtbWFrZW1ha2VyIFwKCXBlcmwt
bW9kdWxlLW1pbWUtYmFzZTY0IFwKCXBlcmwtbW9kdWxlLXNvY2tldCBcCgkiCgpCQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSIKUFIgPSAicjAiCgpTUkNfVVJJID0gImh0dHA6Ly9zZWFyY2guY3Bhbi5v
cmcvQ1BBTi9hdXRob3JzL2lkL0YvRkwvRkxPUkEvTmV0LVNTTGVheS0ke1BWfS50YXIuZ3o7bmFt
ZT1uZXQtc3NsZWF5LSR7UFZ9IgpTUkNfVVJJW25ldC1zc2xlYXktMS4zNi5tZDVzdW1dID0gIjU0
MDYxNjM4NzIwZGQ2YTMyNTM5NTMzMWM3N2YyMWQ4IgpTUkNfVVJJW25ldC1zc2xlYXktMS4zNi5z
aGEyNTZzdW1dID0gImUyNjI4OTcyNjNjNWFhOTA5NmUzOWY3ODEzYzdjYjdkNGQwNTUwOGNhNDA2
YjE3Mzg3OGM0ZWNkZGIyYzUzY2UiCgpTID0gIiR7V09SS0RJUn0vTmV0LVNTTGVheS0ke1BWfSIK
CmV4cG9ydCBPUEVOU1NMX1BSRUZJWD0iJHtTVEFHSU5HX0lOQ0RJUn0vLi4iCgppbmhlcml0IGNw
YW4KCgoKCgoKCiNERVNDUklQVElPTiA9ICJOZXQ6OlNTTGVheSBwZXJsIG1vZHVsZSIKI1BSID0g
InIwIgoKI2luaGVyaXQgY3BhbgoKI0RFUEVORFMgPSAicGVybCBvcGVuc3NsIHpsaWIiCiNSREVQ
RU5EU18ke1BOfSArPSAiIFwKIyAgICAgICAgICAgIHBlcmwtbW9kdWxlLWNhcnAgXAojICAgICAg
ICAgICAgcGVybC1tb2R1bGUtZXJybm8gXAojICAgICAgICAgICAgcGVybC1tb2R1bGUtZXh0dXRp
bHMtbWFrZW1ha2VyIFwKIyAgICAgICAgICAgIHBlcmwtbW9kdWxlLW1pbWUtYmFzZTY0IFwKIyAg
ICAgICAgICAgIHBlcmwtbW9kdWxlLXNvY2tldCBcCiMJICAgIHBlcmwtbW9kdWxlLWV4dHV0aWxz
LWNvbW1hbmQgXAojCSAgICBwZXJsLW1vZHVsZS1leHR1dGlscy1jb21tYW5kLW1tIFwKIyAJICAg
ICIKCiNCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKCiNTUkNfVVJJID0gImZpbGU6Ly8ke1BOfS0k
e1BWfS50YXIuZ3oiCgojUyA9ICIke1dPUktESVJ9L05ldC1TU0xlYXktMS4zNiIKCiNleHBvcnQg
T1BFTlNTTF9QUkVGSVg9IiR7U1RBR0lOR19JTkNESVJ9Ly4uIgoKI2Zha2Vyb290IGRvX2luc3Rh
bGwoKSB7CgojCW1rZGlyIC1wICR7RH0vdXNyL2Jpbi9OZXQtU1NMZWF5LTEuMzYKCiMJY2QgTmV0
LVNTTGVheS0xLjM2CiMJcGVybCBNYWtlZmlsZS5QTCBJTlNUQUxMX0JBU0U9JHtXT1JLRElSfS9p
bWFnZS91c3IvYmluL05ldC1TU0xlYXktMS4zNgojCXBlcmwgTWFrZWZpbGUuUEwKIwlwZXJsICct
VjppbnN0YWxsLionCiMJbWFrZSBpbnN0YWxsCgojfQoKI0ZJTEVTXyR7UE59ICs9ICIvdXNyL2Jp
bi9uZXQtc3NsZWF5Igo=

--_c505ccb4-7b5c-4829-bd59-71f19b104648_--
