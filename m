Received: from smtp105.biz.mail.in2.yahoo.com ([203.104.19.14])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <tejas@picus.in>) id 1NeMiV-0005dU-K4
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 07:03:31 +0100
Received: (qmail 20647 invoked from network); 8 Feb 2010 05:54:15 -0000
Received: from 106.74.116.100.hathway.com (tejas@116.74.106.100 with login)
	by smtp105.biz.mail.in2.yahoo.com with SMTP;
	08 Feb 2010 11:24:15 +0530 IST
X-Yahoo-SMTP: vL6ZkSyswBA8eZdwmFTvr8l2__OJ14.9dJSX
X-YMail-OSG: 5iREXjsVM1k8k2o.06benyzsY9btWbd4W7r58aCFO5_HBKIkKKgIsW7qRBuBGjGCQ9UqCN8lLgGIZmXUNLXk5vU6kpNR5s3v8MT9incbDn2lsUDdicfFS7R.hoQuH62uGHOcEMDx15sbcdAWseLk.cAGC7QdHIujs4RYZcwcXkD94PNWiBqr1usmjYxvPdQbzijtJJp4WLZbKSoUgh0aSkiQjiSca8LO.BoHsBshw5ifkC1ecJqqGASa7xIhDFw-
X-Yahoo-Newman-Property: ymail-3
From: "Tejas" <tejas@picus.in>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Feb 2010 11:26:40 +0530
Message-ID: <000001caa883$7bdd6710$73983530$@in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acqog3rQohcXJzjgT8abr90LM8tO3w==
x-cr-hashedpuzzle: pss= AIox ALrS CkPv CwtR DcXr EyC5 FUbL FipQ FmBT GF5T GnYg
	HMzG H3vr ICEm IMp2; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {18659444-050D-4D50-9F77-64FDB19FC5AE};
	dABlAGoAYQBzAEAAcABpAGMAdQBzAC4AaQBuAA==;
	Mon, 08 Feb 2010 05:56:38 GMT;
	RgBhAGMAaQBuAGcAIABwAHIAbwBiAGwAZQBtACAAdwBoAGkAbABlACAAYgB1AGkAbABkAGkAbgBnACAAQQBuAGcAcwB0AHIAbwBtACAASQBtAGEAZwBlACAAdwBpAHQAaAAgAGgAZQBsAHAAIABvAGYAIABvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAA=
x-cr-puzzleid: {18659444-050D-4D50-9F77-64FDB19FC5AE}
X-SA-Exim-Connect-IP: 203.104.19.14
X-SA-Exim-Mail-From: tejas@picus.in
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Facing problem while building Angstrom Image with help of openembedded
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
X-List-Received-Date: Mon, 08 Feb 2010 06:03:31 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

               I am following followed link to build angstrom image for
beagle board.

 

http://www.angstrom-distribution.org/building-angstrom

 

               But at some how I am not getting success. I have attached my
log file herewith. Please help me to resolve it.

 

[neelam@Fedora openembedded]$ MACHINE=beagleboard  bitbake base-image

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to
increase performance.

NOTE: Handling BitBake files: \ (6701/6701) [100 %]

NOTE: Parsing finished. 6414 cached, 0 parsed, 287 skipped, 0 masked.

NOTE: Cache is clean, not saving.

NOTE: Resolving any missing task queue dependencies

NOTE: preferred version git of u-boot not available (for item u-boot)

NOTE: preferred version git of u-boot not available (for item u-boot)

NOTE: Preparing runqueue

NOTE: Executing runqueue

NOTE: Running task 38 of 2946 (ID: 166,
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_7
.2.bb, do_fetch)

NOTE: Running task 40 of 2946 (ID: 39,
/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.bb,
do_fetch)

NOTE: Running task 42 of 2946 (ID: 1107,
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-native
_20050701.bb, do_fetch)

NOTE: Running task 44 of 2946 (ID: 1794,
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
do_fetch)

NOTE: fetch ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz

NOTE: fetch
http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz

--2010-02-08 11:21:49--
ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving ftp.gnu.org... --2010-02-08 11:21:49--
http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz

Resolving download.savannah.gnu.org... NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.org_
_20050701.tar.gz

--2010-02-08 11:21:49--
http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.org_
_20050701.tar.gz

Resolving www.angstrom-distribution.org... NOTE: fetch
ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:21:49--  ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving ftp.gnu.org... failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.gnu.org'

NOTE: fetch ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz

failed: Temporary failure in name resolution.

wget: unable to resolve host address `download.savannah.gnu.org'

NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz

failed: Temporary failure in name resolution.

wget: unable to resolve host address `www.angstrom-distribution.org'

--2010-02-08 11:22:09--
ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving mirrors.kernel.org... NOTE: Fetch
cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=config;method=pserver;d
ate=20050701

--2010-02-08 11:22:09--
http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz

Resolving www.angstrom-distribution.org... failed: Temporary failure in name
resolution.

wget: unable to resolve host address `ftp.gnu.org'

NOTE: fetch ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:22:09--  ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving mirrors.kernel.org... failed: Temporary failure in name
resolution.

wget: unable to resolve host address `mirrors.kernel.org'

failed: Temporary failure in name resolution.

wget: unable to resolve host address `www.angstrom-distribution.org'

NOTE: fetch ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.gz

NOTE: Task failed: Fetch failed:
http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.bb
do_fetch failed

--2010-02-08 11:22:29--
ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving ftp.matrix.com.br... Unknown host cvs.sv.gnu.org.

NOTE: Task failed: Fetch failed: config

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-native
_20050701.bb do_fetch failed

failed: Temporary failure in name resolution.

wget: unable to resolve host address `mirrors.kernel.org'

NOTE: fetch ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:22:29--  ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving ftp.matrix.com.br... ERROR: Task 39
(/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.bb,
do_fetch) failed

NOTE: Waiting for 3 active tasks to finish

NOTE: 1:
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-native
_20050701.bb, do_fetch (32456)

NOTE: 2:
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
do_fetch (32457)

NOTE: 3:
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_7
.2.bb, do_fetch (32454)

ERROR: Task 1107
(/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nativ
e_20050701.bb, do_fetch) failed

NOTE: Waiting for 2 active tasks to finish

NOTE: 1:
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
do_fetch (32457)

NOTE: 2:
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_7
.2.bb, do_fetch (32454)

failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.matrix.com.br'

NOTE: fetch ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.gz

--2010-02-08 11:22:49--
ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving ftp.cs.ubc.ca... failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.matrix.com.br'

NOTE: fetch ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:22:49--  ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving ftp.cs.ubc.ca... failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.cs.ubc.ca'

NOTE: fetch ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz

--2010-02-08 11:23:09--
ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving sunsite.ust.hk... failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.cs.ubc.ca'

NOTE: fetch ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:23:09--  ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving sunsite.ust.hk... failed: Temporary failure in name resolution.

wget: unable to resolve host address `sunsite.ust.hk'

NOTE: fetch ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz

--2010-02-08 11:23:29--
ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'

Resolving ftp.ayamura.org... failed: Temporary failure in name resolution.

wget: unable to resolve host address `sunsite.ust.hk'

NOTE: fetch ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar.gz

--2010-02-08 11:23:29--  ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar.gz

           => `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'

Resolving ftp.ayamura.org... failed: Temporary failure in name resolution.

wget: unable to resolve host address `ftp.ayamura.org'

NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.gz

--2010-02-08 11:23:49--
http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.gz

Resolving www.angstrom-distribution.org... failed: Temporary failure in name
resolution.

wget: unable to resolve host address `ftp.ayamura.org'

NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/m4-1.4.12.tar.gz

--2010-02-08 11:23:49--
http://www.angstrom-distribution.org/unstable/sources/m4-1.4.12.tar.gz

Resolving www.angstrom-distribution.org... failed: Temporary failure in name
resolution.

wget: unable to resolve host address `www.angstrom-distribution.org'

NOTE: Task failed: Fetch failed:
ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_7
.2.bb do_fetch failed

failed: Temporary failure in name resolution.

wget: unable to resolve host address `www.angstrom-distribution.org'

NOTE: Task failed: Fetch failed: ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz

ERROR: TaskFailed event exception, aborting

ERROR: Build of
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb
do_fetch failed

ERROR: Task 166
(/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_
7.2.bb, do_fetch) failed

NOTE: Waiting for 1 active tasks to finish

NOTE: 1:
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
do_fetch (32457)

ERROR: Task 1794
(/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
do_fetch) failed

NOTE: Tasks Summary: Attempted 40 tasks of which 40 didn't need to be rerun
and 4 failed.

ERROR:
'/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.bb'
failed

ERROR:
'/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nativ
e_20050701.bb' failed

ERROR:
'/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-native_
7.2.bb' failed

ERROR:
'/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb'
failed

[neelam@Fedora openembedded]$

 

-Tejas.


