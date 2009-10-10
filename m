Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1MwQel-0002tu-1L
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 03:22:02 +0200
Received: from dizzy-6.localnet ([::ffff:192.168.2.122])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Sat, 10 Oct 2009 02:08:02 +0200
	id 0000000000013E17.000000004ACFD062.000055D0
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Oct 2009 03:22:02 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31.1; KDE/4.3.1; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{)
	=?utf-8?q?=3Bh=0A=09=3Ds?=@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')
	=?utf-8?q?Ul8f=7DF=251vdg9=7C52W=3DXs=0A=09rR=5E/E/SPo=5E=7B-R22=5Ba?=
	=?utf-8?q?=7Dc=3F?=@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA;*0A,6>
	=?utf-8?q?=0A=09*GY?=(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(
	=?utf-8?q?32pVlT=3A=3D=26=0A=09i4l=5B3=25=3FZ?=<zzP~wGSke?1VJj\cd~Z(,Upc;
	nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
MIME-Version: 1.0
Message-Id: <200910100322.07608.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: libxml2-native build issue
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
X-List-Received-Date: Sat, 10 Oct 2009 01:22:02 -0000
X-Groupsio-MsgNum: 13393
Content-Type: multipart/signed; boundary="nextPart2171209.M4Ir0eK0Yt";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2171209.M4Ir0eK0Yt
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does someone have an idea, what could cause the following error?:
NOTE: Running task 1673 of 2261 (ID: 2181,=20
/mnt/sda/fso/openembedded/recipes/libxml/libxml2-native_2.7.3.bb, do_packag=
e)                                                                         =
                                           =20
objcopy: /mnt/sda/fso/build/tmp/work/x86_64-linux/libxml2-native-2.7.3-
r0/image/mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/lib/.debug/libxml2.=
a:=20
Invalid operation                                                          =
            =20
NOTE: the following files were installed but not shipped in any package:   =
                                                                           =
                                                                           =
           =20
NOTE:   /mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/bin/.debug/xmlcatal=
og                                                                         =
                                                                           =
           =20
NOTE:   /mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/bin/.debug/xmllint =
                                                                           =
                                                                           =
           =20
NOTE:   /mnt/sda/fso/build/tmp/staging/x86_64-
linux/usr/lib/.debug/libxml2.so.2.7.3                                      =
                                                                           =
                                        =20
NOTE:   /mnt/sda/fso/build/tmp/staging/x86_64-linux/usr/lib/.debug/libxml2.=
a                                                                          =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libdl.so.2                 =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libz.so.1                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libm.so.6                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libc.so.6                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libdl.so.2                 =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libz.so.1                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libm.so.6                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libc.so.6                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libdl.so.2                 =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libz.so.1                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libm.so.6                  =
                                                                           =
                                                                           =
           =20
NOTE: Couldn't find shared library provider for libc.so.6                  =
                                                                           =
                                                                           =
           =20
ERROR: Error in executing: /mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb                                                            =
                                                                           =
          =20
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'              =
                                                                           =
                                                                           =
           =20
ERROR: Printing the environment of the function                            =
                                                                           =
                                                                           =
           =20
ERROR:  0005:    packages =3D bb.data.getVar('PACKAGES',d, True)           =
                                                                           =
                                                                           =
             =20
ERROR:  0006:                                                              =
                                                                           =
                                                                           =
           =20
ERROR:  0007:    # no packages should be scanned                           =
                                                                           =
                                                                           =
           =20
ERROR:  0008:    if not packages:                                          =
                                                                           =
                                                                           =
           =20
ERROR:  0009:        return                                                =
                                                                           =
                                                                           =
           =20
ERROR:  0010:                                                              =
                                                                           =
                                                                           =
           =20
ERROR:  0011:    checks =3D [package_qa_check_rpath, package_qa_check_dev, =
                                                                           =
                                                                           =
             =20
ERROR:  0012:              package_qa_check_perm, package_qa_check_arch,   =
                                                                           =
                                                                           =
           =20
ERROR:  0013:              package_qa_check_desktop, package_qa_hash_style,=
                                                                           =
                                                                           =
           =20
ERROR: Error in executing: /mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb                                                            =
                                                                           =
          =20
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'              =
                                                                           =
                                                                           =
           =20
ERROR: Printing the environment of the function                            =
                                                                           =
                                                                           =
           =20
ERROR:  0005:           return                                             =
                                                                           =
                                                                           =
           =20
ERROR:  0006:                                                              =
                                                                           =
                                                                           =
           =20
ERROR:  0007:   for f in (bb.data.getVar('PACKAGEFUNCS', d, 1) or '').split=
():                                                                        =
                                                                           =
           =20
ERROR:  0008:           bb.build.exec_func(f, d)                           =
                                                                           =
                                                                           =
           =20
ERROR:  0009:           package_run_hooks(f, d)                            =
                                                                           =
                                                                           =
           =20
ERROR:  0010:                                                              =
                                                                           =
                                                                           =
           =20
ERROR: Error in executing: /mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb                                                            =
                                                                           =
          =20
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'              =
                                                                           =
                                                                           =
           =20
ERROR: Printing the environment of the function                            =
                                                                           =
                                                                           =
           =20
ERROR: Error in executing: /mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb                                                            =
                                                                           =
          =20
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'              =
                                                                           =
                                                                           =
           =20
ERROR: Printing the environment of the function                            =
                                                                           =
                                                                           =
           =20
ERROR: Build of /mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb do_package failed
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 140, in main
    cooker.cook()
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 644, in cook
    return self.buildTargets(pkgs_to_build)
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 551, in=20
buildTargets
    failures =3D rq.execute_runqueue()
  File "/usr/lib64/python2.6/site-packages/bb/runqueue.py", line 842, in=20
execute_runqueue
    self.execute_runqueue_internal()
  File "/usr/lib64/python2.6/site-packages/bb/runqueue.py", line 951, in=20
execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 137, in=20
tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/usr/lib64/python2.6/site-packages/bb/cooker.py", line 111, in=20
tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 278, in=20
exec_task
    exec_func(task, localdata)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 113, in=20
exec_func
    exec_func_python(func, d)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 136, in=20
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib64/python2.6/site-packages/bb/utils.py", line 171, in=20
better_exec
    exec code in context
  File "do_package", line 4, in <module>
  File "do_package", line 2, in do_package
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 113, in=20
exec_func
    exec_func_python(func, d)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 136, in=20
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib64/python2.6/site-packages/bb/utils.py", line 171, in=20
better_exec
    exec code in context
  File "package_ipk_do_package", line 4, in <module>
  File "package_ipk_do_package", line 2, in package_ipk_do_package
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 113, in=20
exec_func
    exec_func_python(func, d)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 136, in=20
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib64/python2.6/site-packages/bb/utils.py", line 171, in=20
better_exec
    exec code in context
  File "package_do_package", line 11, in <module>
  File "package_do_package", line 8, in package_do_package
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 113, in=20
exec_func
    exec_func_python(func, d)
  File "/usr/lib64/python2.6/site-packages/bb/build.py", line 136, in=20
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/usr/lib64/python2.6/site-packages/bb/utils.py", line 171, in=20
better_exec
    exec code in context
  File "do_package_qa", line 33, in <module>
  File "do_package_qa", line 24, in do_package_qa
  File "<bb>", line 9, in package_qa_walk
KeyError: 'linux'
ERROR: Task 2181 (/mnt/sda/fso/openembedded/recipes/libxml/libxml2-
native_2.7.3.bb, do_package) failed
NOTE: Tasks Summary: Attempted 1672 tasks of which 1653 didn't need to be=20
rerun and 1 failed.
ERROR: '/mnt/sda/fso/openembedded/recipes/libxml/libxml2-native_2.7.3.bb'=20
failed

--nextPart2171209.M4Ir0eK0Yt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrP4b8ACgkQAeZw77btGjp57QCeJLWZM3DctBswP7t5ogDofbUB
rfEAnixyxa6KH1Mrd/hqbnyqnUT7A6bR
=sr/C
-----END PGP SIGNATURE-----

--nextPart2171209.M4Ir0eK0Yt--
