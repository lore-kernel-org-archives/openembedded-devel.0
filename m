Received: from smtp102.biz.mail.in2.yahoo.com ([203.104.17.250])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <tejas@picus.in>) id 1NeNfi-0007ls-0N
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 08:04:41 +0100
Received: (qmail 95881 invoked from network); 8 Feb 2010 06:55:25 -0000
Received: from 106.74.116.100.hathway.com (tejas@116.74.106.100 with login)
	by smtp102.biz.mail.in2.yahoo.com with SMTP;
	08 Feb 2010 12:25:24 +0530 IST
X-Yahoo-SMTP: vL6ZkSyswBA8eZdwmFTvr8l2__OJ14.9dJSX
X-YMail-OSG: LBJmSTcVM1lwRR2KKVzA3t79EoaCUhN9Rqk1K_vCL9WXn5jr4BBjJQ2v8ukcmufJdwMDHh73DP9o61dDjxrc8Qp7kqEACZitXgBmRBrleNIoDoFG3kBnU1LfOZC8z.glRJ0a9OQk5SHbERtZvOHd3eKh47H07ZQIbvve2vjFY_xXv140txx6gTHBAsbtO_p3b45qtlYm8hEpjrvDX0XMKWeKqCqnzX0dy.DPIcenjXXlm03kdJYJT.jRtT80gK0-
X-Yahoo-Newman-Property: ymail-3
From: "Tejas" <tejas@picus.in>
To: <openembedded-devel@lists.openembedded.org>
References: <000001caa883$7bdd6710$73983530$@in>
	<ac9c93b11002072239r263f727enf952d26c2bcf4204@mail.gmail.com>
In-Reply-To: <ac9c93b11002072239r263f727enf952d26c2bcf4204@mail.gmail.com>
Date: Mon, 8 Feb 2010 12:27:47 +0530
Message-ID: <000001caa88c$058aa2e0$109fe8a0$@in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqoiZqGsgPRbfUVSVmRkers/G71xQAAf/0Q
X-SA-Exim-Connect-IP: 203.104.17.250
X-SA-Exim-Mail-From: tejas@picus.in
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem while building Angstrom Image with help of	openembedded
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
X-List-Received-Date: Mon, 08 Feb 2010 07:04:41 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us

Sorry,
	I have tried hard to get out of this message and problems. After
thinking a much I posted such kind of log on this mailing list that some =
one
can help me to come out this problem.=20

	But I  think this is my mistake not to send this message on this
mailing list.

	Sorry once again if I have wasted time of anyone.

-Tejas.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Frans Meulenbroeks
Sent: Monday, February 08, 2010 12:10 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Facing problem while building Angstrom Image with help =
of
openembedded

Sorry for sounding harsh, but I am not going to help you with this.
The error is very obvious if you read the log.
I strongly suggest that before posting you first read the error
message and try to understand what it says instead of just dumping
your error messages to the mailing list.

Seriously, if you cannot understand problems like this one then
openembedded is not for you.

Frans.

PS: and notice this is a developer mailing list, not a support mailing =
list.


2010/2/8 Tejas <tejas@picus.in>:
> Hi All,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 I am following followed link to build =
angstrom image for
> beagle board.
>
>
>
> http://www.angstrom-distribution.org/building-angstrom
>
>
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 But at some how I am not getting success. =
I have attached my
> log file herewith. Please help me to resolve it.
>
>
>
> [neelam@Fedora openembedded]$ MACHINE=3Dbeagleboard =A0bitbake =
base-image
>
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install =
it
to
> increase performance.
>
> NOTE: Handling BitBake files: \ (6701/6701) [100 %]
>
> NOTE: Parsing finished. 6414 cached, 0 parsed, 287 skipped, 0 masked.
>
> NOTE: Cache is clean, not saving.
>
> NOTE: Resolving any missing task queue dependencies
>
> NOTE: preferred version git of u-boot not available (for item u-boot)
>
> NOTE: preferred version git of u-boot not available (for item u-boot)
>
> NOTE: Preparing runqueue
>
> NOTE: Executing runqueue
>
> NOTE: Running task 38 of 2946 (ID: 166,
>
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch)
>
> NOTE: Running task 40 of 2946 (ID: 39,
>
/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.b=
b,
> do_fetch)
>
> NOTE: Running task 42 of 2946 (ID: 1107,
>
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb, do_fetch)
>
> NOTE: Running task 44 of 2946 (ID: 1794,
> =
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch)
>
> NOTE: fetch ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> NOTE: fetch
> http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz
>
> --2010-02-08 11:21:49--
> ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving ftp.gnu.org... --2010-02-08 11:21:49--
> http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz
>
> Resolving download.savannah.gnu.org... NOTE: fetch
>
http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.o=
rg_
> _20050701.tar.gz
>
> --2010-02-08 11:21:49--
>
http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.o=
rg_
> _20050701.tar.gz
>
> Resolving www.angstrom-distribution.org... NOTE: fetch
> ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:21:49-- =A0ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving ftp.gnu.org... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.gnu.org'
>
> NOTE: fetch =
ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `download.savannah.gnu.org'
>
> NOTE: fetch
> =
http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> --2010-02-08 11:22:09--
> ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving mirrors.kernel.org... NOTE: Fetch
>
cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=3Dconfig;method=3Dps=
erver;d
> ate=3D20050701
>
> --2010-02-08 11:22:09--
> =
http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
>
> Resolving www.angstrom-distribution.org... failed: Temporary failure =
in
name
> resolution.
>
> wget: unable to resolve host address `ftp.gnu.org'
>
> NOTE: fetch ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:09-- =
=A0ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving mirrors.kernel.org... failed: Temporary failure in name
> resolution.
>
> wget: unable to resolve host address `mirrors.kernel.org'
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> NOTE: fetch =
ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> NOTE: Task failed: Fetch failed:
> http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
> =
/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.b=
b
> do_fetch failed
>
> --2010-02-08 11:22:29--
> ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving ftp.matrix.com.br... Unknown host cvs.sv.gnu.org.
>
> NOTE: Task failed: Fetch failed: config
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
>
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb do_fetch failed
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `mirrors.kernel.org'
>
> NOTE: fetch ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:29--
=A0ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving ftp.matrix.com.br... ERROR: Task 39
>
(/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.=
bb,
> do_fetch) failed
>
> NOTE: Waiting for 3 active tasks to finish
>
> NOTE: 1:
>
/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb, do_fetch (32456)
>
> NOTE: 2:
> =
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> NOTE: 3:
>
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch (32454)
>
> ERROR: Task 1107
>
(/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-na=
tiv
> e_20050701.bb, do_fetch) failed
>
> NOTE: Waiting for 2 active tasks to finish
>
> NOTE: 1:
> =
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> NOTE: 2:
>
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch (32454)
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.matrix.com.br'
>
> NOTE: fetch =
ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.gz
>
> --2010-02-08 11:22:49--
> ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving ftp.cs.ubc.ca... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `ftp.matrix.com.br'
>
> NOTE: fetch ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:49--
=A0ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving ftp.cs.ubc.ca... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `ftp.cs.ubc.ca'
>
> NOTE: fetch =
ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> --2010-02-08 11:23:09--
> ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving sunsite.ust.hk... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `ftp.cs.ubc.ca'
>
> NOTE: fetch ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:23:09-- =
=A0ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving sunsite.ust.hk... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `sunsite.ust.hk'
>
> NOTE: fetch =
ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> --2010-02-08 11:23:29--
> ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/coreutils-7.2.tar.gz'
>
> Resolving ftp.ayamura.org... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `sunsite.ust.hk'
>
> NOTE: fetch ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:23:29-- =
=A0ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> =
`/home/neelam/tejas_work/oe/downloads/m4-1.4.12.tar.gz'
>
> Resolving ftp.ayamura.org... failed: Temporary failure in name =
resolution.
>
> wget: unable to resolve host address `ftp.ayamura.org'
>
> NOTE: fetch
> =
http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.g=
z
>
> --2010-02-08 11:23:49--
> =
http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.g=
z
>
> Resolving www.angstrom-distribution.org... failed: Temporary failure =
in
name
> resolution.
>
> wget: unable to resolve host address `ftp.ayamura.org'
>
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/m4-1.4.12.tar.gz
>
> --2010-02-08 11:23:49--
> http://www.angstrom-distribution.org/unstable/sources/m4-1.4.12.tar.gz
>
> Resolving www.angstrom-distribution.org... failed: Temporary failure =
in
name
> resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> NOTE: Task failed: Fetch failed:
> ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
>
/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb do_fetch failed
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> NOTE: Task failed: Fetch failed: =
ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb
> do_fetch failed
>
> ERROR: Task 166
>
(/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nati=
ve_
> 7.2.bb, do_fetch) failed
>
> NOTE: Waiting for 1 active tasks to finish
>
> NOTE: 1:
> =
/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> ERROR: Task 1794
> =
(/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch) failed
>
> NOTE: Tasks Summary: Attempted 40 tasks of which 40 didn't need to be
rerun
> and 4 failed.
>
> ERROR:
>
'/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.=
bb'
> failed
>
> ERROR:
>
'/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-na=
tiv
> e_20050701.bb' failed
>
> ERROR:
>
'/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nati=
ve_
> 7.2.bb' failed
>
> ERROR:
> =
'/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb'
> failed
>
> [neelam@Fedora openembedded]$
>
>
>
> -Tejas.
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



