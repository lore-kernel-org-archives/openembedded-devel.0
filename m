Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D21A473216
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:49:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g141so7669038wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JyCZVES85mrz+Va9EyqoEfMuTAZ2uR+sKlukCGl3Pz4=;
	b=YfPKA5sL3v3oPiAX0SMFXU4J7PuS4BKm32mWZoFHFcmP8CAFYLOjR19aEWM7EJerS7
	pnI6KU6ZUJH/tg4AGMDVcsM87nKlHxASvSLw/N9ow4auL4AmuOdbVR32JWVn5bacbp4N
	KbPLCSS9Cw2dD5hRl4dFLxBRoJ9Q8O6NcPXXj7G+aP7Wkb+XaL2fUpGr9x1Lf/48BTQL
	56Yv0cMnMpssgtZrZEY6lA62xPmoj2oMVRESAYVAvEKvnWeYJy43Xb4iXVt1dGcMJhcZ
	CiKOmWGd16TiRP1nMOxHHv8a7T8bg3tBiWgmvnUE1CTPg8WHcLU38WsJyv+kUt4BGhMd
	s9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JyCZVES85mrz+Va9EyqoEfMuTAZ2uR+sKlukCGl3Pz4=;
	b=goXqcoNhds87YfTxWBscrcmXYcPImHb6+H4gXNJ4I24Mtrao4qzQer4ahIYWbvqgeD
	8ZUU/y5lBHPXy3pFy6SjlmlES5FKJbwQsAh8mVxV8hh9D/kh/YY6zfdgk58W6uQY7Bgu
	6ceGHcS2ONJ9ABjyDmnEGiDIUxfmrnNvw+Osr5ccrMIaHWpDocfRhWP5vDvgs9VIf1Ht
	LcxVH1wPPiFwgwwJmH84HOO4PS55Dpi5u84/YoMXeFoyCb/WjGz/mHwEwREyynd1kuwt
	OWskRfaIrwcxsK34psXWRSmssYTNu9Juh2mJXcXs/an6LF4fKgP1qDfVWJFLBpAYbCem
	xj8Q==
X-Gm-Message-State: AE9vXwMm1vBh9gud0kaj9rOYcOLjvXOesdlM5NCMUTCSlTDVX3FB/1e7sYWRImd3EaJ6vQ==
X-Received: by 10.194.61.72 with SMTP id n8mr10998660wjr.74.1473778196168;
	Tue, 13 Sep 2016 07:49:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f10sm23276585wje.14.2016.09.13.07.49.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Sep 2016 07:49:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Sep 2016 16:49:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160913144954.GC2701@jama>
References: <20160912082002.41576-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20160912082002.41576-1-liezhi.yang@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-filesystems][PATCH 1/2] xfsprogs: 3.2.3 -> 4.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 14:49:57 -0000
X-Groupsio-MsgNum: 63098
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline

--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2016 at 01:20:01AM -0700, Robert Yang wrote:
> The 3.2.3 doesn't work with kernel 4.8 any more.
>=20
> * Update remove-install-as-user.patch and xfsprogs-generate-crctable-whic=
h-is-moved-into-runti.patch
> * Remove drop-configure-check-for-aio.patch which was for uclibc, and
>   uclibc is not supported by oe-core any more.

Thanks for update (instead of blacklist), but there is one more issue
when building with gold:

| Building growfs
|     [CC]     xfs_growfs.o
|     [LD]     xfs_growfs
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_new_probe_from=
_filename'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_a=
lignment_offset'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_get_topo=
logy'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_do_fullprobe'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_l=
ogical_sector_size'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_o=
ptimal_io_size'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_lookup_v=
alue'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_free_probe'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_p=
hysical_sector_size'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_probe_enable_p=
artitions'
| ../libxcmd/.libs/libxcmd.so: undefined reference to `blkid_topology_get_m=
inimum_io_size'
| collect2: error: ld returned 1 exit status
| make[2]: *** [xfs_growfs] Error 1
| make[1]: *** [growfs] Error 2

>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20160912
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../files/drop-configure-check-for-aio.patch       | 93 ----------------=
------
>  .../xfsprogs/files/remove-install-as-user.patch    | 53 +++++-------
>  ...nerate-crctable-which-is-moved-into-runti.patch | 40 ++++------
>  .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       | 52 ------------
>  .../recipes-utils/xfsprogs/xfsprogs_4.7.0.bb       | 51 ++++++++++++
>  5 files changed, 90 insertions(+), 199 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/drop-co=
nfigure-check-for-aio.patch
>  delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.=
3.bb
>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.=
0.bb
>=20
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure=
-check-for-aio.patch b/meta-filesystems/recipes-utils/xfsprogs/files/drop-c=
onfigure-check-for-aio.patch
> deleted file mode 100644
> index 7601095..0000000
> --- a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-=
for-aio.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -xfsprogs: drop configure check for aio
> -
> -It's unused and breaks compilation with uclibc.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - configure.ac         |  6 +++---
> - m4/Makefile          |  1 -
> - m4/package_aiodev.m4 | 36 ------------------------------------
> - 3 files changed, 3 insertions(+), 40 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b968977..4e2a263 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -47,6 +47,9 @@ AC_ARG_ENABLE(lib64,
> - 	enable_lib64=3Dyes)
> - AC_SUBST(enable_lib64)
> -=20
> -+librt=3D"-lrt"
> -+AC_SUBST(librt)
> -+
> - #
> - # If the user specified a libdir ending in lib64 do not append another
> - # 64 to the library names.
> -@@ -92,9 +95,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
> - AC_PACKAGE_UTILITIES(xfsprogs)
> - AC_MULTILIB($enable_lib64)
> -=20
> --AC_PACKAGE_NEED_AIO_H
> --AC_PACKAGE_NEED_LIO_LISTIO
> --
> - AC_PACKAGE_NEED_UUID_H
> - AC_PACKAGE_NEED_UUIDCOMPARE
> -=20
> -diff --git a/m4/Makefile b/m4/Makefile
> -index 654a4fb..d282f0a 100644
> ---- a/m4/Makefile
> -+++ b/m4/Makefile
> -@@ -14,7 +14,6 @@ CONFIGURE =3D \
> -=20
> - LSRCFILES =3D \
> - 	manual_format.m4 \
> --	package_aiodev.m4 \
> - 	package_blkid.m4 \
> - 	package_globals.m4 \
> - 	package_libcdev.m4 \
> -diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
> -index 490d9c8..8b13789 100644
> ---- a/m4/package_aiodev.m4
> -+++ b/m4/package_aiodev.m4
> -@@ -1,37 +1 @@
> --#
> --# Check if we have a libaio.h installed
> --#
> --AC_DEFUN([AC_PACKAGE_WANT_AIO],
> --  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=3Dtrue ], [ have_aio=3Dfalse =
])
> --    AC_SUBST(have_aio)
> --  ])
> --
> --#
> --# Check if we have an aio.h installed
> --#
> --AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
> --  [ AC_CHECK_HEADERS(aio.h)
> --    if test $ac_cv_header_aio_h =3D no; then
> --	echo
> --	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
> --	exit 1
> --    fi
> --  ])
> --
> --#
> --# Check if we have the lio_listio routine in either libc/librt
> --#
> --AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
> --  [ AC_CHECK_FUNCS(lio_listio)
> --    if test $ac_cv_func_lio_listio =3D yes; then
> --	librt=3D""
> --    else
> --	AC_CHECK_LIB(rt, lio_listio,, [
> --	    echo
> --	    echo 'FATAL ERROR: could not find a library with lio_listio.'
> --	    exit 1],[-lpthread])
> --	librt=3D"-lrt"
> --    fi
> --    AC_SUBST(librt)
> --  ])
> -=20
> ---=20
> -1.8.1.2
> -
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install=
-as-user.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove-insta=
ll-as-user.patch
> index e761db3..43eacd4 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-use=
r.patch
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-use=
r.patch
> @@ -5,11 +5,10 @@ Upstream-Status: Inappropriate [configuration]
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   include/buildmacros |  2 +-
> - include/install-sh  | 95 ++++++++--------------------------------------=
-------
> - 2 files changed, 14 insertions(+), 83 deletions(-)
> + include/install-sh  | 88 +++++++++++++---------------------------------=
------------------------------------------
> + 2 files changed, 14 insertions(+), 76 deletions(-)
> =20
>  diff --git a/include/buildmacros b/include/buildmacros
> -index 7a01880..0840d55 100644
>  --- a/include/buildmacros
>  +++ b/include/buildmacros
>  @@ -30,7 +30,7 @@ OBJECTS =3D $(ASFILES:.s=3D.o) \
> @@ -22,7 +21,6 @@ index 7a01880..0840d55 100644
>   IMAGES_DIR =3D $(TOPDIR)/all-images
>   DIST_DIR =3D $(TOPDIR)/dist
>  diff --git a/include/install-sh b/include/install-sh
> -index c952a71..b9d66f7 100755
>  --- a/include/install-sh
>  +++ b/include/install-sh
>  @@ -24,11 +24,11 @@
> @@ -41,7 +39,7 @@ index c952a71..b9d66f7 100755
>       echo ""
>       echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables aff=
ect the"
>       echo "behaviour of this command - see comments in the script."
> -@@ -38,32 +38,6 @@ _usage() {
> +@@ -38,35 +38,10 @@ _usage() {
>       exit 1
>   }
>  =20
> @@ -63,7 +61,7 @@ index c952a71..b9d66f7 100755
>  -		    fi
>  -		fi
>  -	       _st=3D0
> --	    fi    =20
> +-	    fi
>  -	fi
>  -    fi
>  -
> @@ -72,9 +70,13 @@ index c952a71..b9d66f7 100755
>  -
>  -
>   _manifest ()
> - {=20
> + {
>       echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
> -@@ -77,9 +51,6 @@ Sflag=3Dfalse
> ++    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
> + }
> +=20
> + prog=3D`basename $0`
> +@@ -77,9 +52,6 @@ Sflag=3Dfalse
>   Tflag=3Dfalse
>   DIRMODE=3D755
>   FILEMODE=3D644
> @@ -84,7 +86,7 @@ index c952a71..b9d66f7 100755
>  =20
>   # default is to install and don't append manifest
>   INSTALL=3Dtrue
> -@@ -94,24 +65,16 @@ MANIFEST=3D:
> +@@ -94,24 +66,16 @@ MANIFEST=3D:
>  =20
>   if $INSTALL
>   then
> @@ -112,27 +114,19 @@ index c952a71..b9d66f7 100755
>      m)
>   	DIRMODE=3D`expr $OPTARG`
>   	FILEMODE=3D$DIRMODE
> -@@ -146,18 +109,7 @@ then
> -     # first usage
> -     #
> -     $MKDIR -p $dir=20
> --    status=3D$?
> --    if [ $status -eq 0 ]
> --    then
> --	$CHMOD $DIRMODE $dir
> --	status=3D$?
> --    fi
> +@@ -152,11 +116,6 @@ then
> + 	$CHMOD $DIRMODE $dir
> + 	status=3D$?
> +     fi
>  -    if [ $status -eq 0 ]
>  -    then
>  -	$CHOWN $OWNER $GROUP $dir
>  -	status=3D$?
>  -    fi
> --    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
> -+    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
> +     $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
>   elif $Sflag
>   then
> -     #
> -@@ -203,7 +155,7 @@ then
> +@@ -203,7 +162,7 @@ then
>   			install_name=3D$target/$solib
>   			$CP $solib $install_name
>   			status=3D$?
> @@ -141,7 +135,7 @@ index c952a71..b9d66f7 100755
>   			break
>   		fi
>   	done
> -@@ -254,7 +206,7 @@ then
> +@@ -254,7 +213,7 @@ then
>   	install_name=3D$target/$old_library
>   	$CP $old_library $install_name
>   	status=3D$?
> @@ -150,7 +144,7 @@ index c952a71..b9d66f7 100755
>   	;;
>       *)
>   	echo "$prog: -T $lt_install invalid"
> -@@ -267,7 +219,6 @@ then
> +@@ -267,7 +226,6 @@ then
>   	if [ $status -eq 0 ]
>   	then
>   		$CHMOD $FILEMODE $install_name
> @@ -158,8 +152,8 @@ index c952a71..b9d66f7 100755
>   	fi
>   	;;
>       esac
> -@@ -292,23 +243,10 @@ else
> - 	then=20
> +@@ -292,23 +250,10 @@ else
> + 	then
>   	    if [ -f $dir/$f ]
>   	    then
>  -		$CHMOD $FILEMODE $dir/$f
> @@ -184,7 +178,7 @@ index c952a71..b9d66f7 100755
>   	    fi
>   	fi
>       else
> -@@ -334,14 +272,7 @@ else
> +@@ -334,14 +279,7 @@ else
>   	    status=3D$?
>   	    if [ $status -eq 0 ]
>   	    then
> @@ -200,6 +194,3 @@ index c952a71..b9d66f7 100755
>   	    fi
>   	    [ $status -ne 0 ] && break
>   	done
> ---=20
> -1.8.1.2
> -
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-gener=
ate-crctable-which-is-moved-into-runti.patch b/meta-filesystems/recipes-uti=
ls/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
> index b204195..e04a21f 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crc=
table-which-is-moved-into-runti.patch
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crc=
table-which-is-moved-into-runti.patch
> @@ -13,24 +13,22 @@ Upstream-Status: Pending
> =20
>  Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>  ---
> - libxfs/Makefile | 23 ++----------------
> - libxfs/crc32.c  | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++--
> - 2 files changed, 75 insertions(+), 23 deletions(-)
> + libxfs/Makefile | 22 +---------------------
> + libxfs/crc32.c  | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++--
> + 2 files changed, 74 insertions(+), 23 deletions(-)
> =20
>  diff --git a/libxfs/Makefile b/libxfs/Makefile
> -index ae15a5d..7670159 100644
>  --- a/libxfs/Makefile
>  +++ b/libxfs/Makefile
> -@@ -10,7 +10,7 @@ LT_CURRENT =3D 0
> - LT_REVISION =3D 0
> - LT_AGE =3D 0
> +@@ -43,7 +43,6 @@ HFILES =3D \
> + 	libxfs_api_defs.h \
> + 	init.h \
> + 	crc32defs.h \
> +-	crc32table.h \
> + 	libxfs_priv.h \
> + 	xfs_dir2_priv.h
>  =20
> --HFILES =3D xfs.h init.h xfs_dir2_priv.h crc32defs.h crc32table.h
> -+HFILES =3D xfs.h init.h xfs_dir2_priv.h crc32defs.h
> - CFILES =3D cache.c \
> - 	crc32.c \
> - 	init.c kmem.c logitem.c radix-tree.c rdwr.c trans.c util.c \
> -@@ -43,7 +43,6 @@ CFILES =3D cache.c \
> +@@ -87,7 +86,6 @@ CFILES =3D cache.c \
>   CFILES +=3D $(PKG_PLATFORM).c
>   PCFILES =3D darwin.c freebsd.c irix.c linux.c
>   LSRCFILES =3D $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
> @@ -38,7 +36,7 @@ index ae15a5d..7670159 100644
>  =20
>   #
>   # Tracing flags:
> -@@ -61,25 +60,7 @@ LTLIBS =3D $(LIBPTHREAD) $(LIBRT)
> +@@ -105,25 +103,7 @@ LTLIBS =3D $(LIBPTHREAD) $(LIBRT)
>   # don't try linking xfs_repair with a debug libxfs.
>   DEBUG =3D -DNDEBUG
>  =20
> @@ -48,7 +46,7 @@ index ae15a5d..7670159 100644
>  -
>  -crc32table.h: gen_crc32table.c
>  -	@echo "    [CC]     gen_crc32table"
> --	$(Q) $(CC) $(CFLAGS) -o gen_crc32table $<
> +-	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
>  -	@echo "    [GENERATE] $@"
>  -	$(Q) ./gen_crc32table > crc32table.h
>  -
> @@ -59,17 +57,16 @@ index ae15a5d..7670159 100644
>  -# disk.
>  -crc32selftest: gen_crc32table.c crc32table.h crc32.c
>  -	@echo "    [TEST]    CRC32"
> --	$(Q) $(CC) $(CFLAGS) -D CRC32_SELFTEST=3D1 crc32.c -o $@
> +-	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=3D1 crc32.c -o $@
>  -	$(Q) ./$@
>  +default: ltdepend $(LTLIBRARY)
>  =20
> + # set up include/xfs header directory
>   include $(BUILDRULES)
> -=20
>  diff --git a/libxfs/crc32.c b/libxfs/crc32.c
> -index 0f847d2..be5fbc3 100644
>  --- a/libxfs/crc32.c
>  +++ b/libxfs/crc32.c
> -@@ -55,8 +55,6 @@ typedef __u32	u64;
> +@@ -57,8 +57,6 @@ typedef __u32	u64;
>   # define tobe(x) (x)
>   #endif
>  =20
> @@ -78,7 +75,7 @@ index 0f847d2..be5fbc3 100644
>   #if CRC_LE_BITS > 8 || CRC_BE_BITS > 8
>  =20
>   /* implements slicing-by-4 or slicing-by-8 algorithm */
> -@@ -183,13 +181,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const =
*p, size_t len)
> +@@ -185,13 +183,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const =
*p, size_t len)
>   	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
>   }
>   #else
> @@ -165,6 +162,3 @@ index 0f847d2..be5fbc3 100644
>   	return crc32_le_generic(crc, p, len,
>   			(const u32 (*)[256])crc32ctable_le, CRC32C_POLY_LE);
>   }
> ---=20
> -1.9.1
> -
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/=
meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> deleted file mode 100644
> index f38239c..0000000
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -SUMMARY =3D "XFS Filesystem Utilities"
> -HOMEPAGE =3D "http://oss.sgi.com/projects/xfs"
> -SECTION =3D "base"
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> -LICENSE_libhandle =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Ddbdb5f4329b7e7145de650e9e=
cd4ac2a"
> -DEPENDS =3D "util-linux"
> -
> -SRC_URI =3D "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
> -    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
> -    file://remove-install-as-user.patch \
> -    file://drop-configure-check-for-aio.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "9f383e36682709e62b12c125e5d8b895"
> -SRC_URI[sha256sum] =3D "7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce=
3f4de30827109ac9"
> -
> -inherit autotools-brokensep
> -
> -PACKAGES =3D+ "${PN}-fsck ${PN}-mkfs libhandle"
> -
> -RDEPENDS_${PN} =3D "${PN}-fsck ${PN}-mkfs"
> -
> -FILES_${PN}-fsck =3D "${base_sbindir}/fsck.xfs"
> -FILES_${PN}-mkfs =3D "${base_sbindir}/mkfs.xfs"
> -FILES_libhandle =3D "${base_libdir}/libhandle${SOLIBS}"
> -
> -EXTRA_OECONF =3D "--enable-gettext=3Dno"
> -do_configure () {
> -    # Prevent Makefile from calling configure without arguments,
> -    # when do_configure gets called for a second time.
> -    rm -f include/builddefs include/platform_defs.h
> -    # Recreate configure script.
> -    rm -f configure
> -    oe_runmake configure
> -    # Configure.
> -    export DEBUG=3D"-DNDEBUG"
> -    gnu-configize --force
> -    oe_runconf
> -}
> -
> -LIBTOOL =3D "${HOST_SYS}-libtool"
> -EXTRA_OEMAKE =3D "'LIBTOOL=3D${LIBTOOL}'"
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -PARALLEL_MAKE =3D ""
> -
> -do_install () {
> -    export DIST_ROOT=3D${D}
> -    oe_runmake install
> -    # needed for xfsdump
> -    oe_runmake install-dev
> -}
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb b/=
meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb
> new file mode 100644
> index 0000000..2fce9eb
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.7.0.bb
> @@ -0,0 +1,51 @@
> +SUMMARY =3D "XFS Filesystem Utilities"
> +HOMEPAGE =3D "http://oss.sgi.com/projects/xfs"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LICENSE_libhandle =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Ddbdb5f4329b7e7145de650e9e=
cd4ac2a"
> +DEPENDS =3D "util-linux"
> +
> +SRC_URI =3D "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
> +    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
> +    file://remove-install-as-user.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "ae82b0ab63e89cfda52fb9859855bafa"
> +SRC_URI[sha256sum] =3D "88580bb3e6847c3edef436703a4fae403fc19b20739db4c3=
1166ee4b256178d7"
> +
> +inherit autotools-brokensep
> +
> +PACKAGES =3D+ "${PN}-fsck ${PN}-mkfs libhandle"
> +
> +RDEPENDS_${PN} =3D "${PN}-fsck ${PN}-mkfs"
> +
> +FILES_${PN}-fsck =3D "${base_sbindir}/fsck.xfs"
> +FILES_${PN}-mkfs =3D "${base_sbindir}/mkfs.xfs"
> +FILES_libhandle =3D "${base_libdir}/libhandle${SOLIBS}"
> +
> +EXTRA_OECONF =3D "--enable-gettext=3Dno"
> +do_configure () {
> +    # Prevent Makefile from calling configure without arguments,
> +    # when do_configure gets called for a second time.
> +    rm -f include/builddefs include/platform_defs.h
> +    # Recreate configure script.
> +    rm -f configure
> +    oe_runmake configure
> +    # Configure.
> +    export DEBUG=3D"-DNDEBUG"
> +    gnu-configize --force
> +    oe_runconf
> +}
> +
> +LIBTOOL =3D "${HOST_SYS}-libtool"
> +EXTRA_OEMAKE =3D "'LIBTOOL=3D${LIBTOOL}'"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +PARALLEL_MAKE =3D ""
> +
> +do_install () {
> +    export DIST_ROOT=3D${D}
> +    oe_runmake install
> +    # needed for xfsdump
> +    oe_runmake install-dev
> +}
> --=20
> 2.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfYEhEACgkQN1Ujt2V2gBwC0wCgsvQ+S87rgi1CTJrSSvBKUNj2
3GEAnj9L/4lwjSXSZtBjTfB3CBCgVXKB
=PJqS
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
