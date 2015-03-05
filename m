Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E71871F1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:54:43 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so3475474wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y8iwvaCmvFIu7+ukBcxpjEb5rIuF1D97j3A/HnjbUtc=;
	b=c2reMt54vGnGmzNjepr/yTEod2oz/LBb5LUXKXNJ2ZdVeHWkGUdTComFxakUov42ne
	rRFcrm1NP+QlaONI/AYGLZMYNi9wqY76sboymDT+zRHv6oOwXWPsE/5YanISWDZfESfk
	iNK4xH4Qi2sOV8sGMdel9dmoV+B+iC+l7bWOFwdjSYjVGeJoh7NVLwR1YYSI1xBj3/OO
	odtN+6bkFCMx8Tli8ucM9ywwsruJBGmrOuKX88EzIrG0x6q79OMmPtnz3X/4k0uU3Ufi
	sR2+Hz9kQVX5pCc4AUHBpyxQVy2iy0EbYn+pXt6V5uDduh3IqBXHR5KKDg/LNT/XkWg/
	3VpQ==
X-Received: by 10.180.221.232 with SMTP id qh8mr22992518wic.19.1425567284115; 
	Thu, 05 Mar 2015 06:54:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s19sm30061243wik.18.2015.03.05.06.54.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:54:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 15:54:48 +0100
To: Baptiste Durand <baptiste.durand@gmail.com>
Message-ID: <20150305145448.GV2337@jama>
References: <1425559979-15196-1-git-send-email-baptiste.durand@gmail.com>
	<20150305131826.GQ2337@jama>
	<CAB0T2v84Lagh0zqm2zcbQ9qkG1HpESyjTQZVkCk2XSALtHOmgw@mail.gmail.com>
	<CAB0T2v-ubnfJiiYEff9Q9h4+2oQPp2LHA_H6xv28QDQ9VT3ThA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB0T2v-ubnfJiiYEff9Q9h4+2oQPp2LHA_H6xv28QDQ9VT3ThA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] minidlna: Fix package and bump to version 1.1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2015 14:54:44 -0000
X-Groupsio-MsgNum: 54654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMefDzZywwCHZelG"
Content-Disposition: inline

--DMefDzZywwCHZelG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 03:42:08PM +0100, Baptiste Durand wrote:
> Sorry Martin
>=20
> I have just seen your recent change on mplayer2 recipes.
> http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D522ee507725c0e5300af1856c481e93938be313f
>=20
> You probably means LICENSE_FLAGS not LICENSE_FLAGS_WHITELIST

Ah right, sorry for confusion.

> I will resend an update

Thanks for quick update.

>=20
> 2015-03-05 15:30 GMT+01:00 Baptiste Durand <baptiste.durand@gmail.com>:
>=20
> >
> >
> > 2015-03-05 14:18 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> >
> >> On Thu, Mar 05, 2015 at 01:52:59PM +0100, Baptiste DURAND wrote:
> >> > Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> >  meta-oe/recipes-multimedia/minidlna/minidlna.inc   | 36 +++++++++++=
++++
> >> >  .../minidlna/minidlna/minidlna-daemon.init.d       | 54
> >> ++++++++++++++++++++++
> >> >  .../minidlna/minidlna/minidlna.service             | 10 ++++
> >> >  .../recipes-multimedia/minidlna/minidlna_1.1.4.bb  |  6 +++
> >> >  .../minidlna/minidlna/fix-makefile.patch           | 41
> >> ----------------
> >> >  .../search-for-headers-in-staging-dir.patch        | 48
> >> -------------------
> >> >  .../nonworking/minidlna/minidlna_1.0.25.bb         | 19 --------
> >> >  7 files changed, 106 insertions(+), 108 deletions(-)
> >> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
> >> >  create mode 100644
> >> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> >> >  create mode 100644
> >> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> >> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/
> >> minidlna_1.1.4.bb
> >> >  delete mode 100644
> >> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.p=
atch
> >> >  delete mode 100644
> >> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-hea=
ders-in-staging-dir.patch
> >> >  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/
> >> minidlna_1.0.25.bb
> >> >
> >> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> >> b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> >> > new file mode 100644
> >> > index 0000000..f553acb
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> >> > @@ -0,0 +1,36 @@
> >> > +DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with t=
he
> >> aim of \
> >> > +being fully compliant with DLNA/UPnP-AV clients."
> >> > +LICENSE =3D "GPL-2.0|BSD"
> >> > +DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag
> >> libvorbis"
> >>
> >> Please set LICENSE_FLAGS_WHITELIST because of libav dependency, otherw=
ise
> >> the build
> >> will fail with:
> >>
> >> ERROR: Nothing PROVIDES 'libav' (but
> >> meta-oe/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb DEPENDS =
on
> >> or otherwise requires it)
> >> ERROR: libav was skipped: because it has a restricted license not
> >> whitelisted in LICENSE_FLAGS_WHITELIST
> >>
> >>
> >
> > Hello Martin
> > I'm not sure to understand what do you mean exactly :S
> >
> > I thought this variable (LICENSE_FLAGS_WHITELIST)  should be used only =
in
> > distro configuration or local.conf, not in a recipe.
> >
> >
> > The purpose of this varaibel is to be able to build rootfs with or with=
out
> > commercial packages, is it correct?
> >
> > In my point of view , setting this variable to the value commercial
> > directly in a recipe is not a good idea.
> >
> >
> > BR
> >
> > Baptiste
> >
> >
> >
> > > +
> >> > +inherit gettext autotools-brokensep update-rc.d systemd
> >> > +
> >> > +SRC_URI =3D "git://
> >> git.code.sf.net/p/minidlna/git;branch=3Dmaster;module=3Dgit \
> >> > +           file://minidlna-daemon.init.d \
> >> > +           file://minidlna.service "
> >> > +
> >> > +S =3D "${WORKDIR}/git"
> >> > +
> >> > +# This remove "--exclude=3Dautopoint" option from autoreconf argume=
nt to
> >> avoid
> >> > +# configure.ac:30: error: required file './ABOUT-NLS' not found
> >> > +EXTRA_AUTORECONF =3D ""
> >> > +
> >> > +do_install_append(){
> >> > +     install -d ${D}${sysconfdir}
> >> > +     install -m 0755 minidlna.conf ${D}${sysconfdir}
> >> > +
> >> > +# Systemd script
> >> > +     install -d ${D}${nonarch_base_libdir}/systemd/system
> >> > +     install -m 0755 ${WORKDIR}/minidlna.service
> >> ${D}${nonarch_base_libdir}/systemd/system
> >> > +
> >> > +# Sysvinit script
> >> > +     install -d ${D}${sysconfdir}/init.d
> >> > +     install -m 0755 ${WORKDIR}/minidlna-daemon.init.d
> >> ${D}${sysconfdir}/init.d/minidlna
> >> > +
> >> > +}
> >> > +
> >> > +SYSTEMD_SERVICE_${PN} =3D "minidlna.service"
> >> > +
> >> > +INITSCRIPT_NAME =3D "minidlna"
> >> > +INITSCRIPT_PARAMS =3D "defaults 90"
> >> > +
> >> > diff --git
> >> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> >> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> >> > new file mode 100644
> >> > index 0000000..9e64a20
> >> > --- /dev/null
> >> > +++
> >> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> >> > @@ -0,0 +1,54 @@
> >> > +#!/bin/sh
> >> > +
> >> > +NAME=3D"minidlna"
> >> > +DAEMON=3D/usr/sbin/minidlnad
> >> > +SCRIPTNAME=3D/etc/init.d/$NAME
> >> > +PIDFILE=3D/var/run/$NAME.pid
> >> > +CONF=3D/etc/$NAME.conf
> >> > +ARGS=3D"-f $CONF"
> >> > +
> >> > +# Exit if the package is not installed
> >> > +[ -x "$DAEMON" ] || exit 0
> >> > +
> >> > +start_function() {
> >> > +
> >> > +    export PATH=3D$PWD:$PATH
> >> > +
> >> > +    if [ -f ${PIDFILE} ]; then
> >> > +        echo "$SCRIPTNAME already running with PID #`cat $PIDFILE` (
> >> according to ${PIDFILE} )";
> >> > +        exit 0
> >> > +    fi
> >> > +
> >> > +    $DAEMON $ARGS
> >> > +
> >> > +    pid=3D$!
> >> > +
> >> > +    if [ "$pid" !=3D "" ]; then
> >> > +        echo -n "$pid" > ${PIDFILE}
> >> > +    fi
> >> > +}
> >> > +
> >> > +stop_function() {
> >> > +
> >> > +    export PATH=3D$PWD:$PATH
> >> > +
> >> > +    if [ ! -e "${PIDFILE}" ]; then
> >> > +        echo "${SCRIPTNAME} not running ( according to ${PIDFILE} )=
";
> >> > +        exit 1;
> >> > +    fi
> >> > +    PID=3D`cat ${PIDFILE}`
> >> > +    kill -INT ${PID}
> >> > +    rm -f ${PIDFILE}
> >> > +}
> >> > +
> >> > +case $1 in
> >> > +    "start")
> >> > +        start_function
> >> > +        ;;
> >> > +    "stop")
> >> > +        stop_function
> >> > +        ;;
> >> > +    *)
> >> > +    echo "Usage: $0 {start | stop}"
> >> > +
> >> > +esac
> >> > diff --git
> >> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> >> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> >> > new file mode 100644
> >> > index 0000000..656100b
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
> >> > @@ -0,0 +1,10 @@
> >> > +[Unit]
> >> > +Description=3DMinidlna Daemon
> >> > +After=3Dnetwork.target
> >> > +
> >> > +[Service]
> >> > +Type=3Dnotify
> >> > +ExecStart=3D/usr/sbin/minidlnad -f /etc/minidlna.conf
> >> > +
> >> > +[Install]
> >> > +WantedBy=3Dmulti-user.target
> >> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> >> b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> >> > new file mode 100644
> >> > index 0000000..0531e69
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> >> > @@ -0,0 +1,6 @@
> >> > +require ${BPN}.inc
> >> > +
> >> > +SRCREV =3D "v1_1_4"
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://LICENCE.miniupnpd;md5=3Db0dabf9d8e0f871554e309d62ead8d2b"
> >> > +SRC_URI[md5sum] =3D "d966256baf2f9b068b9de871ab5dade5"
> >> > +SRC_URI[sha256sum] =3D
> >> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
> >> > diff --git
> >> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile=
=2Epatch
> >> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile=
=2Epatch
> >> > deleted file mode 100644
> >> > index 96429fd..0000000
> >> > ---
> >> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile=
=2Epatch
> >> > +++ /dev/null
> >> > @@ -1,41 +0,0 @@
> >> > -Fix Makefile:
> >> > -* don't overwrite CFLAGS but append to it
> >> > -* use gcc as CC only if CC is not already defined
> >> > -* use -I=3D to include paths
> >> > -* fix compile of minidlna binary by removing ${LIBS} dependency
> >> > -
> >> > -Upstream-status: Pending
> >> > -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >> > -
> >> > -Index: minidlna-1.0.25/Makefile
> >> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > ---- minidlna-1.0.25.orig/Makefile    2012-01-18 00:49:01.000000000
> >> +0200
> >> > -+++ minidlna-1.0.25/Makefile 2013-02-10 17:46:49.000000000 +0200
> >> > -@@ -12,13 +12,13 @@
> >> > - #
> >> > - #CFLAGS =3D -Wall -O -D_GNU_SOURCE -g -DDEBUG
> >> > - #CFLAGS =3D -Wall -g -Os -D_GNU_SOURCE
> >> > --CFLAGS =3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \
> >> > --     -I/usr/include/ffmpeg \
> >> > --     -I/usr/include/libavutil -I/usr/include/libavcodec
> >> -I/usr/include/libavformat \
> >> > --     -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavco=
dec
> >> -I/usr/include/ffmpeg/libavformat
> >> > -+CFLAGS +=3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \
> >> > -+     -I=3D/usr/include/ffmpeg \
> >> > -+     -I=3D/usr/include/libavutil -I=3D/usr/include/libavcodec
> >> -I=3D/usr/include/libavformat \
> >> > -+     -I=3D/usr/include/ffmpeg/libavutil
> >> -I=3D/usr/include/ffmpeg/libavcodec -I=3D/usr/include/ffmpeg/libavform=
at
> >> > - #STATIC_LINKING: CFLAGS +=3D -DSTATIC
> >> > - #STATIC_LINKING: LDFLAGS =3D -static
> >> > --CC =3D gcc
> >> > -+CC ?=3D gcc
> >> > - RM =3D rm -f
> >> > - INSTALL =3D install
> >> > -
> >> > -@@ -64,7 +64,7 @@
> >> > -     $(INSTALL) -d $(ETCINSTALLDIR)
> >> > -     $(INSTALL) --mode=3D0644 minidlna.conf $(ETCINSTALLDIR)
> >> > -
> >> > --minidlna:   $(BASEOBJS) $(LNXOBJS) $(LIBS)
> >> > -+minidlna:   $(BASEOBJS) $(LNXOBJS)
> >> > -     @echo Linking $@
> >> > -     @$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIB=
S)
> >> > -
> >> > diff --git
> >> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-h=
eaders-in-staging-dir.patch
> >> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-h=
eaders-in-staging-dir.patch
> >> > deleted file mode 100644
> >> > index 573d88c..0000000
> >> > ---
> >> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-h=
eaders-in-staging-dir.patch
> >> > +++ /dev/null
> >> > @@ -1,48 +0,0 @@
> >> > -Search for headers in STAGING_DIR_GOST.
> >> > -
> >> > -Upstream-status: Pending
> >> > -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >> > -
> >> > -Index: minidlna-1.0.25/genconfig.sh
> >> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > ---- minidlna-1.0.25.orig/genconfig.sh        2012-01-21
> >> 02:34:13.000000000 +0200
> >> > -+++ minidlna-1.0.25/genconfig.sh     2013-02-10 17:12:06.000000000
> >> +0200
> >> > -@@ -40,22 +40,22 @@
> >> > -
> >> > - # Detect if there are missing headers
> >> > - # NOTE: This check only works with a normal distro
> >> > --[ ! -e "/usr/include/sqlite3.h" ] && MISSING=3D"libsqlite3 $MISSIN=
G"
> >> > --[ ! -e "/usr/include/jpeglib.h" ] && MISSING=3D"libjpeg $MISSING"
> >> > --[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING=3D"libexif
> >> $MISSING"
> >> > --[ ! -e "/usr/include/id3tag.h" ] && MISSING=3D"libid3tag $MISSING"
> >> > --[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING=3D"libogg $MISSING"
> >> > --[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING=3D"libvorbis $MI=
SSING"
> >> > --[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING=3D"libflac $MIS=
SING"
> >> > --[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
> >> > --  ! -e "/usr/include/libavutil/avutil.h" -a \
> >> > --  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] &&
> >> MISSING=3D"libavutil $MISSING"
> >> > --[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
> >> > --  ! -e "/usr/include/libavformat/avformat.h" -a \
> >> > --  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] &&
> >> MISSING=3D"libavformat $MISSING"
> >> > --[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
> >> > --  ! -e "/usr/include/libavcodec/avcodec.h" -a \
> >> > --  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] &&
> >> MISSING=3D"libavcodec $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] &&
> >> MISSING=3D"libsqlite3 $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] &&
> >> MISSING=3D"libjpeg $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] &&
> >> MISSING=3D"libexif $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] &&
> >> MISSING=3D"libid3tag $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING=3D"l=
ibogg
> >> $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] &&
> >> MISSING=3D"libvorbis $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] &&
> >> MISSING=3D"libflac $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ]=
 &&
> >> MISSING=3D"libavutil $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.=
h"
> >> ] && MISSING=3D"libavformat $MISSING"
> >> > -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
> >> > -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h"=
 ]
> >> && MISSING=3D"libavcodec $MISSING"
> >> > - if [ -n "$MISSING" ]; then
> >> > -     echo -e "\nERROR!  Cannot continue."
> >> > -     echo -e "The following required libraries are either missing, =
or
> >> are missing development headers:\n"
> >> > diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/
> >> minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/
> >> minidlna_1.0.25.bb
> >> > deleted file mode 100644
> >> > index 9264bc2..0000000
> >> > --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25=
=2Ebb
> >> > +++ /dev/null
> >> > @@ -1,19 +0,0 @@
> >> > -DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with t=
he
> >> aim of \
> >> > -being fully compliant with DLNA/UPnP-AV clients."
> >> > -LICENSE =3D "GPL-2.0"
> >> > -LIC_FILES_CHKSUM =3D
> >> "file://LICENCE;md5=3Db1a795ac1a06805cf8fd74920bc46b5c"
> >> > -
> >> > -DEPENDS =3D "flac libav jpeg sqlite3 libexif libogg libid3tag"
> >> > -
> >> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
> >> > -    file://search-for-headers-in-staging-dir.patch \
> >> > -    file://fix-makefile.patch \
> >> > -"
> >> > -
> >> > -SRC_URI[md5sum] =3D "d966256baf2f9b068b9de871ab5dade5"
> >> > -SRC_URI[sha256sum] =3D
> >> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
> >> > -
> >> > -export STAGING_DIR_HOST
> >> > -
> >> > -inherit autotools
> >> > -
> >> > --
> >> > 1.8.1.4
> >> >
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >
> >
> >
> > --
> > Baptiste DURAND
> >
> >
>=20
>=20
> --=20
> Baptiste DURAND

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DMefDzZywwCHZelG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4bjgACgkQN1Ujt2V2gBxmqwCdEZG8HLLyhEXSyi+yWZNnS1ua
a9MAoKzkBAsu5V9aVMwhif8X4X2YYlzV
=k74c
-----END PGP SIGNATURE-----

--DMefDzZywwCHZelG--
