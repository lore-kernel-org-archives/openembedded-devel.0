Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IVjRk-0008It-SS
	for openembedded-devel@openembedded.org; Thu, 13 Sep 2007 09:49:09 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B0305B1CC for openembedded-devel@openembedded.org;
	Thu, 13 Sep 2007 09:44:44 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Thu, 13 Sep 2007 10:45:54 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHOEBKMEAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <OFB8999CA2.0BBAD7B1-ON48257355.001FC285-48257355.0020C9CC@aaeon.com.tw>
Importance: Normal
Subject: Re: hal-info-20070913
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
X-List-Received-Date: Thu, 13 Sep 2007 07:49:09 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Victor,

I think you are either having network issues=20
> fatal: unable to connect a socket (Connection timed out)

or the git repo was down or had problems


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> VictorLai@aaeon.com.tw
> Sent: Thursday, September 13, 2007 8:58 AM
> To: openembedded-devel@openembedded.org
> Subject: [oe] hal-info-20070913
>=20
>=20
>=20
> Hi,
> After 2 days of downloading and compiling, I have successfully =
compiled a
> image using "bitbake angstrom-x11-gpe-image". However, when I set up =
the
> same environment start download and compiling on my other PC, it fails =
at
> the following:
>=20
> It seems it is using a hal-info package updated today. How can I=20
> solve this
> issue?
>=20
> Thanks.
>=20
> ------------------------------------------------------------------
> --------------------------------------------------------
> root@victorlai-desktop:/OE# ./compileall
> Setting up dev env for =C3=85ngstr=C3=B6m
> Altered environment for OE Development
> mtn: doing anonymous pull; use -kKEYNAME if you need authentication
> mtn: connecting to monotone.openembedded.org
> mtn: network error: name resolution failure for =
monotone.openembedded.org:
> Name or service not known
> mtn: updating along branch 'org.openembedded.dev'
> mtn: already up to date at e672e671c803c6418e7dafffe4c149fa8480620a
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.=20
> Install it to
> increase performance.
> NOTE: Handling BitBake files: / (4640/4640) [100 %]
> NOTE: Parsing finished. 4419 cached, 3 parsed, 218 skipped, 0 masked.
> NOTE: build 200709131317: started
>=20
> OE Build Configuration:
> BB_VERSION     =3D "1.8.8"
> OE_REVISION    =3D "e672e671c803c6418e7dafffe4c149fa8480620a"
> TARGET_ARCH    =3D "arm"
> TARGET_OS      =3D "linux-gnueabi"
> MACHINE        =3D "akita"
> DISTRO         =3D "angstrom"
> DISTRO_VERSION =3D "2007.9-test-20070913"
> TARGET_FPU     =3D "soft"
>=20
> NOTE: Resolving missing task queue dependencies
> NOTE: preferred version 2.5 of glibc not available (for item
> virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1757 of 3075 (ID: 1327,
> /OE/org.openembedded.dev/packages/hal/hal-info_git.bb, do_fetch)
> NOTE: package hal-info-20070913+git: started
> NOTE: package hal-info-20070913+git-r1: task do_fetch: started
> fatal: unable to connect a socket (Connection timed out)
> ERROR: Error in executing:
> ERROR: Exception:<class 'bb.fetch.FetchError'> Message:Fetch=20
> command export
> PATH=3D/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/arm-angst
> rom-linux-gnueabi:/OE/org.openembedded.dev/tmp/staging/i686-linux/
> bin:/OE/org.openembedded.dev/tmp/cross/bin:/OE/bitbake-1.8.8
> /bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:
> /usr/games;
>  git ls-remote git://anongit.freedesktop.org/hal-info/ failed with =
signal
> 1, output:
>=20
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> ERROR: Exception:<class 'bb.fetch.FetchError'> Message:Fetch=20
> command export
> PATH=3D/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/arm-angst
> rom-linux-gnueabi:/OE/org.openembedded.dev/tmp/staging/i686-linux/
> bin:/OE/org.openembedded.dev/tmp/cross/bin:/OE/bitbake-1.8.8
> /bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:
> /usr/games;
>  git ls-remote git://anongit.freedesktop.org/hal-info/ failed with =
signal
> 1, output:
>=20
> ERROR: Printing the environment of the function
> ERROR: Build of /OE/org.openembedded.dev/packages/hal/hal-info_git.bb
> do_fetch failed
> Traceback (most recent call last):
>   File "/OE/bitbake-1.8.8/bin/bitbake", line 134, in <module>
>     main()
>   File "/OE/bitbake-1.8.8/bin/bitbake", line 131, in main
>     cooker.cook()
>   File "/OE/bitbake-1.8.8/lib/bb/cooker.py", line 552, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/OE/bitbake-1.8.8/lib/bb/cooker.py", line 466, in buildTargets
>     failures =3D rq.execute_runqueue()
>   File "/OE/bitbake-1.8.8/lib/bb/runqueue.py", line 403, in
> execute_runqueue
>     self.execute_runqueue_internal()
>   File "/OE/bitbake-1.8.8/lib/bb/runqueue.py", line 531, in
> execute_runqueue_internal
>     self.cooker.tryBuild(fn, False)
>   File "/OE/bitbake-1.8.8/lib/bb/cooker.py", line 125, in tryBuild
>     return self.tryBuildPackage(fn, item, self.configuration.cmd,=20
> the_data,
> build_depends)
>   File "/OE/bitbake-1.8.8/lib/bb/cooker.py", line 98, in =
tryBuildPackage
>     bb.build.exec_task('do_%s' % task, the_data)
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 292, in exec_task
>     execute(None, task)
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 281, in execute
>     exec_func(item, localdata)
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 117, in =
exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/OE/bitbake-1.8.8/lib/bb/utils.py", line 144, in better_exec
>     exec code in context
>   File "do_fetch", line 4, in <module>
>   File "do_fetch", line 2, in do_fetch
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 98, in exec_func
>     exec_func_python(func, d)
>   File "/OE/bitbake-1.8.8/lib/bb/build.py", line 117, in =
exec_func_python
>     utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
>   File "/OE/bitbake-1.8.8/lib/bb/utils.py", line 144, in better_exec
>     exec code in context
>   File "base_do_fetch", line 63, in <module>
>   File "base_do_fetch", line 12, in base_do_fetch
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/__init__.py", line 123, in init
>     urldata[url].setup_localpath(d)
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/__init__.py", line 278, in
> setup_localpath
>     self.localpath =3D self.method.localpath(self.url, self, d)
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/git.py", line 59, in localpath
>     ud.tag =3D self.latest_revision(url, ud, d)
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/__init__.py", line 424, in
> latest_revision
>     rev =3D self._latest_revision(url, ud, d)
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/git.py", line 129, in
> _latest_revision
>     output =3D runfetchcmd("git ls-remote %s://%s%s" % (ud.proto, =
ud.host,
> ud.path), d, True)
>   File "/OE/bitbake-1.8.8/lib/bb/fetch/__init__.py", line 252, in
> runfetchcmd
>     raise FetchError("Fetch command %s failed with signal %s, =
output:\n%s"
> % (pathcmd, signal, output))
> bb.fetch.FetchError: Fetch command export
> PATH=3D/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/arm-angst
> rom-linux-gnueabi:/OE/org.openembedded.dev/tmp/staging/i686-linux/
> bin:/OE/org.openembedded.dev/tmp/cross/bin:/OE/bitbake-1.8.8
> /bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:
> /usr/games;
>  git ls-remote git://anongit.freedesktop.org/hal-info/ failed with =
signal
> 1, output:
>=20
> ERROR: Task 1327 =
(/OE/org.openembedded.dev/packages/hal/hal-info_git.bb,
> do_fetch) failed
> NOTE: Tasks Summary: Attempted 1756 tasks of which 1756 didn't need to =
be
> rerun and 1 failed.
> ERROR: '/OE/org.openembedded.dev/packages/hal/hal-info_git.bb' failed
> root@victorlai-desktop:/OE#
>=20
> Best Regards,
>=20
> -------------------------------------------------
> =E8=B3=B4=E7=AB=8B=E5=87=B1 / Victor Lai
> =E7=A0=94=E7=99=BC=E8=99=95 =E8=BB=9F=E9=AB=94=E9=83=A8 / RD Software
> =E7=A0=94=E6=8F=9A=E7=A7=91=E6=8A=80 / AAEON Technology Inc.
> Tel:886-2-89191234  ext:738
> Fax: 886-2-89191054
> E-mail: VictorLai@aaeon.com.tw
> -------------------------------------------------
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20




