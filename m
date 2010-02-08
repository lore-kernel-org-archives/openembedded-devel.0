Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NeNJs-00079P-7P
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 07:42:07 +0100
Received: by yxe10 with SMTP id 10so5021996yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 22:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2zoKCKxHo+lLCSbxG+hlavDTY1wKfnyTPszUYopmQow=;
	b=WUnyLQvsNITo19uSWT0uR8V09bk2TQ/3EVKYR9M1nBFzC1m/xfnjNaM0oKFBLppn0D
	tdsTsyQ1Mi9YA86blvXJXYwhtorMmKDz5JrGXpD+TGfQfws6A6GwWS7buqd9Gf1A5TPS
	yBkPiTjjwoW7ih1QYGuvJn4q71UPdVmLAudXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AYhuNp7rTefhQp4pZYMNTMrKiWTaNKQSwhxEHPvAIphradTqTSnFv0X3Pn4jvy8g//
	VHghhSDJSQKIjaA/ytmHesUYqZW/2x7mGyvG5Hb5dRi2yzf3RMWTreHKyvQHeuP1OfBK
	wGEYTvVMZl2O4aPZfEU3rBRml+QFaRgSkdip0=
MIME-Version: 1.0
Received: by 10.101.184.38 with SMTP id l38mr7624635anp.81.1265611171658; Sun, 
	07 Feb 2010 22:39:31 -0800 (PST)
In-Reply-To: <000001caa883$7bdd6710$73983530$@in>
References: <000001caa883$7bdd6710$73983530$@in>
Date: Mon, 8 Feb 2010 07:39:31 +0100
Message-ID: <ac9c93b11002072239r263f727enf952d26c2bcf4204@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem while building Angstrom Image with help of openembedded
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
X-List-Received-Date: Mon, 08 Feb 2010 06:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry for sounding harsh, but I am not going to help you with this.
The error is very obvious if you read the log.
I strongly suggest that before posting you first read the error
message and try to understand what it says instead of just dumping
your error messages to the mailing list.

Seriously, if you cannot understand problems like this one then
openembedded is not for you.

Frans.

PS: and notice this is a developer mailing list, not a support mailing list=
.


2010/2/8 Tejas <tejas@picus.in>:
> Hi All,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 I am following followed link to build angstro=
m image for
> beagle board.
>
>
>
> http://www.angstrom-distribution.org/building-angstrom
>
>
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 But at some how I am not getting success. I h=
ave attached my
> log file herewith. Please help me to resolve it.
>
>
>
> [neelam@Fedora openembedded]$ MACHINE=3Dbeagleboard =A0bitbake base-image
>
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it =
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
> /home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch)
>
> NOTE: Running task 40 of 2946 (ID: 39,
> /home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.b=
b,
> do_fetch)
>
> NOTE: Running task 42 of 2946 (ID: 1107,
> /home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb, do_fetch)
>
> NOTE: Running task 44 of 2946 (ID: 1794,
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
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
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving ftp.gnu.org... --2010-02-08 11:21:49--
> http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz
>
> Resolving download.savannah.gnu.org... NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.o=
rg_
> _20050701.tar.gz
>
> --2010-02-08 11:21:49--
> http://www.angstrom-distribution.org/unstable/sources/config_cvs.sv.gnu.o=
rg_
> _20050701.tar.gz
>
> Resolving www.angstrom-distribution.org... NOTE: fetch
> ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:21:49-- =A0ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
>
> Resolving ftp.gnu.org... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.gnu.org'
>
> NOTE: fetch ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `download.savannah.gnu.org'
>
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> --2010-02-08 11:22:09--
> ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving mirrors.kernel.org... NOTE: Fetch
> cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=3Dconfig;method=3Dps=
erver;d
> ate=3D20050701
>
> --2010-02-08 11:22:09--
> http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
>
> Resolving www.angstrom-distribution.org... failed: Temporary failure in n=
ame
> resolution.
>
> wget: unable to resolve host address `ftp.gnu.org'
>
> NOTE: fetch ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:09-- =A0ftp://mirrors.kernel.org/gnu/m4/m4-1.4.12.tar.=
gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
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
> NOTE: fetch ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.g=
z
>
> NOTE: Task failed: Fetch failed:
> http://download.savannah.gnu.org/releases/quilt/quilt-0.46.tar.gz
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.b=
b
> do_fetch failed
>
> --2010-02-08 11:22:29--
> ftp://ftp.matrix.com.br/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving ftp.matrix.com.br... Unknown host cvs.sv.gnu.org.
>
> NOTE: Task failed: Fetch failed: config
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb do_fetch failed
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `mirrors.kernel.org'
>
> NOTE: fetch ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:29-- =A0ftp://ftp.matrix.com.br/pub/gnu/m4/m4-1.4.12.t=
ar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
>
> Resolving ftp.matrix.com.br... ERROR: Task 39
> (/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.=
bb,
> do_fetch) failed
>
> NOTE: Waiting for 3 active tasks to finish
>
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-nat=
ive
> _20050701.bb, do_fetch (32456)
>
> NOTE: 2:
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> NOTE: 3:
> /home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch (32454)
>
> ERROR: Task 1107
> (/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-na=
tiv
> e_20050701.bb, do_fetch) failed
>
> NOTE: Waiting for 2 active tasks to finish
>
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> NOTE: 2:
> /home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb, do_fetch (32454)
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.matrix.com.br'
>
> NOTE: fetch ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.g=
z
>
> --2010-02-08 11:22:49--
> ftp://ftp.cs.ubc.ca/mirror2/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving ftp.cs.ubc.ca... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.matrix.com.br'
>
> NOTE: fetch ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:22:49-- =A0ftp://ftp.cs.ubc.ca/mirror2/gnu/m4/m4-1.4.12.t=
ar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
>
> Resolving ftp.cs.ubc.ca... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.cs.ubc.ca'
>
> NOTE: fetch ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> --2010-02-08 11:23:09--
> ftp://sunsite.ust.hk/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving sunsite.ust.hk... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `ftp.cs.ubc.ca'
>
> NOTE: fetch ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:23:09-- =A0ftp://sunsite.ust.hk/pub/gnu/m4/m4-1.4.12.tar.=
gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
>
> Resolving sunsite.ust.hk... failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `sunsite.ust.hk'
>
> NOTE: fetch ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> --2010-02-08 11:23:29--
> ftp://ftp.ayamura.org/pub/gnu/coreutils/coreutils-7.2.tar.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/coreutils-=
7.2.tar.gz'
>
> Resolving ftp.ayamura.org... failed: Temporary failure in name resolution=
.
>
> wget: unable to resolve host address `sunsite.ust.hk'
>
> NOTE: fetch ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar.gz
>
> --2010-02-08 11:23:29-- =A0ftp://ftp.ayamura.org/pub/gnu/m4/m4-1.4.12.tar=
.gz
>
> =A0 =A0 =A0 =A0 =A0 =3D> `/home/neelam/tejas_work/oe/downloads/m4-1.4.12.=
tar.gz'
>
> Resolving ftp.ayamura.org... failed: Temporary failure in name resolution=
.
>
> wget: unable to resolve host address `ftp.ayamura.org'
>
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.g=
z
>
> --2010-02-08 11:23:49--
> http://www.angstrom-distribution.org/unstable/sources/coreutils-7.2.tar.g=
z
>
> Resolving www.angstrom-distribution.org... failed: Temporary failure in n=
ame
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
> Resolving www.angstrom-distribution.org... failed: Temporary failure in n=
ame
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
> /home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nativ=
e_7
> .2.bb do_fetch failed
>
> failed: Temporary failure in name resolution.
>
> wget: unable to resolve host address `www.angstrom-distribution.org'
>
> NOTE: Task failed: Fetch failed: ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.g=
z
>
> ERROR: TaskFailed event exception, aborting
>
> ERROR: Build of
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb
> do_fetch failed
>
> ERROR: Task 166
> (/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nati=
ve_
> 7.2.bb, do_fetch) failed
>
> NOTE: Waiting for 1 active tasks to finish
>
> NOTE: 1:
> /home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch (32457)
>
> ERROR: Task 1794
> (/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb,
> do_fetch) failed
>
> NOTE: Tasks Summary: Attempted 40 tasks of which 40 didn't need to be rer=
un
> and 4 failed.
>
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/quilt/quilt-native_0.46.=
bb'
> failed
>
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/gnu-config/gnu-config-na=
tiv
> e_20050701.bb' failed
>
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/coreutils/coreutils-nati=
ve_
> 7.2.bb' failed
>
> ERROR:
> '/home/neelam/tejas_work/oe/openembedded/recipes/m4/m4-native_1.4.12.bb'
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


