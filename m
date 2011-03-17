Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0Lzb-0007WD-KJ for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 23:48:32 +0100
Received: from f053044253.adsl.alicedsl.de ([78.53.44.253]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0Lxw-0001av-3I for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 22:46:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300364903.3950.21.camel@mattotaupa>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
	<1300364903.3950.21.camel@mattotaupa>
Date: Thu, 17 Mar 2011 23:46:46 +0100
Message-ID: <1300402006.17833.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: xfce4-session: task configure fails with `checking for iceauth... no`
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
X-List-Received-Date: Thu, 17 Mar 2011 22:48:33 -0000
X-Groupsio-MsgNum: 30374
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1JZy+XorDQiqiQcaGfZJ"

--=-1JZy+XorDQiqiQcaGfZJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 17.03.2011, 13:28 +0100 schrieb Paul Menzel:
> Am Dienstag, den 15.03.2011, 09:24 -0700 schrieb Khem Raj:
> > On Tue, Mar 15, 2011 at 9:06 AM, Paul Menzel wrote:
>=20
> > > Am Dienstag, den 08.03.2011, 14:34 +0100 schrieb Paul Menzel:
> > >
> > >> task configure of `xfce4-session_4.6.2.bb` fails with the following
> > >> error message using any distribution (`minimal`, `angstrom-2008.1`).
> > >>
> > >>         checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=3D=
/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is =
GNU ld... (cached) yes
> > >>         checking whether to build with profiling support... no
> > >>         checking whether to compile with coverage profiling instrume=
ntation... no
> > >>         checking whether to disable assertions... no
> > >>         checking whether to build final version... yes
> > >>         checking whether arm-oe-linux-gnueabi-ld --sysroot=3D/oe/bui=
ld-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1=
... yes
> > >>         checking for iceauth... no
> > >>         configure: error: iceauth missing, please check your X11 ins=
tallation
> > >>
> > >> In my build directory I get the following hits for =C2=BB*iceauth*=
=C2=AB.
> > >>
> > >>         $ find . -iname *iceauth*
> > >>         ./minimal-dev/deploy/sources/MIT-X/iceauth
> > >>         ./minimal-dev/deploy/sources/MIT-X/iceauth/iceauth-1.0.4.tar=
.bz2
> > >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-dbg_1.0.4-r5.0_armv=
5te.ipk
> > >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-dev_1.0.4-r5.0_armv=
5te.ipk
> > >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-doc_1.0.4-r5.0_armv=
5te.ipk
> > >>         ./minimal-dev/deploy/ipk/armv5te/iceauth_1.0.4-r5.0_armv5te.=
ipk
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_patch
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_package_stage
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_configure
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_unpack
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_setscene
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_compile
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_rm_work
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_package_stage_all
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_fetch
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_package_write
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_qa_configure
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_build
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_install
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_qa_staging
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_package
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_distribute_sources
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_package_write_ipk
> > >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.=
4-r5.0.do_populate_sysroot
> > >>         ./minimal-dev/pstage/minimaleglibc/staging-iceauth-armv5te-o=
e-linux-gnueabi_1.0.4-r5.0_armv5te-linux-gnueabi.ipk
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/iceauth
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th.packaged
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-doc
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-dbg.packaged
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-dev
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-dbg
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-doc.packaged
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-locale
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-dev.packaged
> > >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceau=
th-static
> > >>         ./minimal-dev/sysroots/armv5te-oe-linux-gnueabi/usr/share/ma=
n/man1/iceauth.1
> > >>         ./minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0
> > >>         ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-l=
inux-gnueabi.control
> > >>         ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-l=
inux-gnueabi.list
> > >>
> > >> So nothing is in the `sysroot`. Building without `INHERIT +=3D "rm_w=
ork"`
> > >> I find the following.
> > >>
> > >>         $ ls -l minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_=
1.0.4-r5.0/package/usr/bin/iceauth
> > >>         -rwxr-xr-x 1 x x 16264 Mar  7 11:55 minimal-dev/work/armv5te=
-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0/package/usr/bin/iceauth
> > >>
> > >> Does anyone have an idea how this can be solved. `git grep iceauth`
> > >> indicates that only `xfce4-session_4.*` depends on `iceauth`.
> > >
> > > Any ideas?
> >=20
> > look at the config.log of this package
>=20
>         $ more config.log
>         [=E2=80=A6]
>         configure:15938: checking for iceauth
>         configure:15971: result: no
>         configure:15983: error: iceauth missing, please check your X11 in=
stallation
>         [=E2=80=A6]
>=20
> > and see what is it looking for in iceauth and make sure that its staged
>=20
> Well I am not sure.
>=20
>         $ more configure.in
>         [=E2=80=A6]
>         dnl Check for iceauth
>         AC_PATH_PROG([ICEAUTH], [iceauth])
>         if test x"$ICEAUTH" !=3D x""; then
>           AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceaut=
h])
>         else
>           AC_MSG_ERROR([iceauth missing, please check your X11 installati=
on])
>         fi
>         [=E2=80=A6]
>=20
>         $ less configure
>           15936 # Extract the first word of "iceauth", so it can be a pro=
gram name with args.
>           15937 set dummy iceauth; ac_word=3D$2
>           15938 { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac=
_word" >&5
>           15939 $as_echo_n "checking for $ac_word... " >&6; }
>           15940 if test "${ac_cv_path_ICEAUTH+set}" =3D set; then :
>           15941   $as_echo_n "(cached) " >&6
>           15942 else
>           15943   case $ICEAUTH in
>           15944   [\\/]* | ?:[\\/]*)
>           15945   ac_cv_path_ICEAUTH=3D"$ICEAUTH" # Let the user override=
 the test with a path.
>           15946   ;;
>           15947   *)
>           15948   as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
>           15949 for as_dir in $PATH
>           15950 do
>           15951   IFS=3D$as_save_IFS
>           15952   test -z "$as_dir" && as_dir=3D.
>           15953     for ac_exec_ext in '' $ac_executable_extensions; do
>           15954   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test=
_x "$as_dir/$ac_word$ac_exec_ext"; }; then
>           15955     ac_cv_path_ICEAUTH=3D"$as_dir/$ac_word$ac_exec_ext"
>           15956     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/=
$ac_word$ac_exec_ext" >&5
>           15957     break 2
>           15958   fi
>           15959 done
>           15960   done
>           15961 IFS=3D$as_save_IFS
>           15962=20
>           15963   ;;
>           15964 esac
>           15965 fi
>           15966 ICEAUTH=3D$ac_cv_path_ICEAUTH
>           15967 if test -n "$ICEAUTH"; then
>           15968   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ICEAU=
TH" >&5
>           15969 $as_echo "$ICEAUTH" >&6; }
>           15970 else
>           15971   { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&=
5
>           15972 $as_echo "no" >&6; }
>           15973 fi
>           15974=20
>           15975=20
>           15976 if test x"$ICEAUTH" !=3D x""; then
>           15977=20
>           15978 cat >>confdefs.h <<_ACEOF
>           15979 #define ICEAUTH_CMD "$ICEAUTH"
>           15980 _ACEOF
>           15981=20
>           15982 else
>           15983   as_fn_error "iceauth missing, please check your X11 ins=
tallation" "$LINENO" 5
>           15984 fi
>=20
> I guess I need to somehow package the iceauth binary.

I am still confused. As written in the beginning the package `iceauth`
contains the binary.

        $ dpkg -c /oe/build-minimal-uclibc/minimal-uclibc-dev/deploy/ipk/ar=
mv7a/iceauth_1.0.4-r5.0_armv7a.ipk
        drwxr-xr-x root/root         0 2011-03-17 22:38 ./
        drwxr-xr-x root/root         0 2011-03-17 22:38 ./usr/
        drwxr-xr-x root/root         0 2011-03-17 22:38 ./usr/bin/
        -rwxr-xr-x root/root     18944 2011-03-17 22:38 ./usr/bin/iceauth

`xfce4-session_4.6.2.bb` depends on `iceauth` (`DEPENDS =3D "=E2=80=A6 icea=
uth"`),
so I am confused why it is not staged. Could someone enlighten me
please?


Thanks,

Paul

--=-1JZy+XorDQiqiQcaGfZJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2Cj1YACgkQPX1aK2wOHVhZtACfW9obFrYiT1LLxyxDDZGlUH6g
Gq0An0GA/ajly7y8z3QXMFqRJs9kvj66
=ehx5
-----END PGP SIGNATURE-----

--=-1JZy+XorDQiqiQcaGfZJ--
