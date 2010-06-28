Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OTCj0-0001Ke-6u
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 13:42:07 +0200
Received: from mail59-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	8.1.436.0; Mon, 28 Jun 2010 11:22:20 +0000
Received: from mail59-db3 (localhost.localdomain [127.0.0.1])	by
	mail59-db3-R.bigfish.com (Postfix) with ESMTP id 797832082B3	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 11:22:20 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VPS-2(zcb8kz14ffO936eM1443Na1ffl8b9ck7cf0iace9izz1202hzzz32i2a8h45k)
X-FB-SS: 13,
Received: from mail59-db3 (localhost.localdomain [127.0.0.1]) by mail59-db3
	(MessageSwitch) id 1277724138604568_22790;
	Mon, 28 Jun 2010 11:22:18 +0000 (UTC)
Received: from DB3EHSMHS012.bigfish.com (unknown [10.3.81.249])	by
	mail59-db3.bigfish.com (Postfix) with ESMTP id 56D851180C9	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 11:22:05 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	DB3EHSMHS012.bigfish.com (10.3.87.112) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Mon, 28 Jun 2010 11:22:04 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Mon, 28 Jun 2010 16:52:00 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jun 2010 16:50:45 +0530
Thread-Topic: cc1plus: error: unrecognized command line option "-mmmx" 
Thread-Index: AQHLFrQgOMvjzOWBZk+SwBtvHmimEg==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFC9@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 213.199.154.140
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cc1plus: error: unrecognized command line option "-mmmx"
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
X-List-Received-Date: Mon, 28 Jun 2010 11:42:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

    I am using Ubuntu 10.4 LTS as a host machine and target is mipsel Au130=
0..
I am building my own image.. when i run bitbake  -D avn-image i
get the following error..

This is the Qt for Embedded Linux Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.

Type '3' to view the GNU General Public License version 3.
Type 'L' to view the Lesser GNU General Public License version 2.1.
Type 'yes' to accept this license offer.
Type 'no' to decline this license offer.

Do you accept the terms of either license?
floatmath auto-detection... ()
compiling floatmath.cpp
floatmath.cpp:44: warning: unused parameter 'argc'
floatmath.cpp:44: warning: unused parameter 'argv'
linking floatmath
/home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib=
/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/bin/ld: warning: l=
ibc.so, needed by /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tm=
p/cross/mipsel/lib/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/=
lib/libgcc_s.so, not found (try using -rpath or -rpath-link)
floatmath enabled.
mmx auto-detection... ()
compiling mmx.cpp
cc1plus: error: unrecognized command line option "-mmmx"
make: *** [mmx.o] Error 1
mmx disabled.
3dnow auto-detection... ()
compiling 3dnow.cpp
cc1plus: error: unrecognized command line option "-m3dnow"
make: *** [3dnow.o] Error 1
3dnow disabled.
sse auto-detection... ()
compiling sse.cpp
cc1plus: error: unrecognized command line option "-msse"
make: *** [sse.o] Error 1
sse disabled.
sse2 auto-detection... ()
compiling sse2.cpp
cc1plus: error: unrecognized command line option "-msse2"
make: *** [sse2.o] Error 1
sse2 disabled.
libtiff auto-detection... ()
compiling libtiff.cpp
libtiff.cpp:42:20: error: tiffio.h: No such file or directory
libtiff.cpp:50:6: error: #error "Required libtiff not found"
libtiff.cpp: In function 'int main(int, char**)':
libtiff.cpp:57: error: 'tdata_t' was not declared in this scope
libtiff.cpp:57: error: expected `;' before 'buffer'
libtiff.cpp:58: error: 'buffer' was not declared in this scope
libtiff.cpp:58: error: '_TIFFfree' was not declared in this scope
libtiff.cpp:62: error: 'TIFFReadRGBAImageOriented' was not declared in this=
 scope
make: *** [libtiff.o] Error 1
libtiff disabled.
libmng auto-detection... ()
compiling libmng.cpp
libmng.cpp:42:20: error: libmng.h: No such file or directory
libmng.cpp:50:2: error: #error System libmng version is less than 1.0.9; us=
ing built-in version instead.
libmng.cpp: In function 'int main(int, char**)':
libmng.cpp:46: error: 'mng_handle' was not declared in this scope
libmng.cpp:46: error: expected `;' before 'hMNG'
libmng.cpp:47: error: 'hMNG' was not declared in this scope
libmng.cpp:47: error: 'mng_cleanup' was not declared in this scope
make: *** [libmng.o] Error 1
libmng disabled.
DB2 auto-detection... ()
compiling db2.cpp
db2.cpp:42:20: error: sqlcli.h: No such file or directory
db2.cpp:43:21: error: sqlcli1.h: No such file or directory
make: *** [db2.o] Error 1
DB2 disabled.
MySQL (thread-safe) auto-detection... ()
compiling ../mysql/mysql.cpp
../mysql/mysql.cpp:42:19: error: mysql.h: No such file or directory
make: *** [mysql.o] Error 1
MySQL (thread-safe) disabled.
MySQL (thread-unsafe) auto-detection... ()
compiling mysql.cpp
mysql.cpp:42:19: error: mysql.h: No such file or directory
make: *** [mysql.o] Error 1
MySQL (thread-unsafe) disabled.
MySQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.

Thanks in advance:-)

Regards,
Soumya




