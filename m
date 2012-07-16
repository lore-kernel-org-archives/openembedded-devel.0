Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqh8A-0005pX-Pd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 10:58:14 +0200
Received: by bkcik5 with SMTP id ik5so3327956bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bqjf+Ro/EAwbfizsTlXTwuUMsaQWeoLhWaLWYEcDplI=;
	b=HAWjB/uLE1uqP0gl+Lk54lyRiVdjo/vUh3ShK0T4E4/bs9q9tSFf94jP/v6DgEfcd1
	m43OTEhntX/dv/Rv6zbv93v6nAZgnBaZfflml7LIwNAlG5mOAgGcl3ady4N9BqQMbjlc
	YKavVVPPLdMUVi5XqapbYuXUv9h5oQ9WLnULFx6p/DR/70ke1xbuxwU7MLcclhXIBnrC
	/j8v263TNqcc9upCWB4CGAAejBdSPUgD3PLK7T4Fyntx8qUHhpwVuwz33/WU/aetx9Ao
	5CurfFwROneAwimBsY2TAgWypWpZNoxE4cDw3Pf0wG3OtSX3afQKiCjaanGpGmKYG8si
	xXYw==
Received: by 10.205.139.6 with SMTP id iu6mr4590925bkc.20.1342428416767;
	Mon, 16 Jul 2012 01:46:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm7476638bkc.13.2012.07.16.01.46.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 01:46:55 -0700 (PDT)
Date: Mon, 16 Jul 2012 10:47:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716084701.GD3729@jama.jama.net>
References: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Mon, 16 Jul 2012 08:58:14 -0000
X-Groupsio-MsgNum: 39673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline

--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 05:26:45PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

I'm also tracking bitbake master and 100 lines of warnings on every
build is quite annoying.. so I'm fine with this in (would be even better=20
with new bitbake release and required bitbake version bump as Paul said..)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Cheers,

> ---
>  meta-efl/recipes-devtools/python/python-efl.inc    |    2 +-
>  meta-efl/recipes-efl/e17/e-module.inc              |    2 +-
>  .../e17/e-wm-theme-illume-efenniht_svn.bb          |    2 +-
>  meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
>  meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |    2 +-
>  meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |    2 +-
>  meta-efl/recipes-efl/e17/elmdentica_svn.bb         |    2 +-
>  meta-efl/recipes-efl/e17/emprint_svn.bb            |    2 +-
>  meta-efl/recipes-efl/e17/enjoy_svn.bb              |    2 +-
>  meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +-
>  meta-efl/recipes-efl/e17/exalt_svn.bb              |    2 +-
>  meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
>  meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    2 +-
>  meta-efl/recipes-efl/e17/exquisite_svn.bb          |    2 +-
>  meta-efl/recipes-efl/e17/rage_svn.bb               |    2 +-
>  meta-efl/recipes-efl/e17/waker_svn.bb              |    2 +-
>  meta-efl/recipes-efl/efl/azy_svn.bb                |    2 +-
>  meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
>  meta-efl/recipes-efl/efl/edb_svn.bb                |    2 +-
>  meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
>  meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
>  meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
>  meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/eio_svn.bb                |    2 +-
>  .../efl/elementary-theme-efenniht_svn.bb           |    4 ++--
>  meta-efl/recipes-efl/efl/elementary_svn.bb         |    2 +-
>  meta-efl/recipes-efl/efl/elsa_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
>  meta-efl/recipes-efl/efl/emotion_svn.bb            |    2 +-
>  meta-efl/recipes-efl/efl/engrave_svn.bb            |    2 +-
>  meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/epeg_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
>  meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
>  meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
>  meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    2 +-
>  meta-efl/recipes-efl/efl/libeweather_svn.bb        |    2 +-
>  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    6 +++---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     |    2 +-
>  meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    |    2 +-
>  .../recipes-support/opencv/opencv-samples_2.4.bb   |    2 +-
>  meta-oe/recipes-support/opencv/opencv_2.4.bb       |    2 +-
>  toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc   |    2 +-
>  45 files changed, 48 insertions(+), 48 deletions(-)
>=20
> diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/r=
ecipes-devtools/python/python-efl.inc
> index fe4521c..6ca5e3f 100644
> --- a/meta-efl/recipes-devtools/python/python-efl.inc
> +++ b/meta-efl/recipes-devtools/python/python-efl.inc
> @@ -15,7 +15,7 @@ export HOST_SYS
> =20
>  inherit e-base autotools pkgconfig distutils-base
> =20
> -SRC_URI =3D "${E_SVN}/trunk/BINDINGS/python;module=3D${SRCNAME};proto=3D=
http"
> +SRC_URI =3D "${E_SVN}/trunk/BINDINGS/python;module=3D${SRCNAME};protocol=
=3Dhttp"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> =20
> diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl=
/e17/e-module.inc
> index 2c1706e..d3f6e1b 100644
> --- a/meta-efl/recipes-efl/e17/e-module.inc
> +++ b/meta-efl/recipes-efl/e17/e-module.inc
> @@ -8,7 +8,7 @@ INC_PR =3D "r0"
>  SRCNAME =3D "E-MODULES-EXTRA/${PN}"
> =20
>  inherit e gettext
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b=
/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
> index 038a19f..5ff0681 100644
> --- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
> +++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
> @@ -18,7 +18,7 @@ PV =3D "0.0+svnr${SRCPV}"
>  inherit e-base allarch
> =20
>  SRCNAME =3D "efenniht"
> -SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};proto=3Dhttp \
> +SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};protocol=3Dhttp \
>             file://LICENSE \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/=
e17/e-wm_svn.bb
> index dd62eeb..0c9ad93 100644
> --- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
> +++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
> @@ -10,7 +10,7 @@ inherit e update-alternatives gettext
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp \
>    file://enlightenment_start.oe \
>    file://applications.menu \
>  "
> diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recip=
es-efl/e17/edje-viewer_svn.bb
> index f59cbb1..c2670e0 100644
> --- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
> +++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
> @@ -7,7 +7,7 @@ SRCREV =3D "${EFL_SRCREV}"
>  inherit e
> =20
>  SRCNAME =3D "edje_viewer"
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  FILES_${PN} +=3D "${datadir}"
> diff --git a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb b/meta-efl/=
recipes-efl/e17/elementary-alarm_svn.bb
> index e25ced6..6c44109 100644
> --- a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
> +++ b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
> @@ -6,7 +6,7 @@ PV =3D "0.0.0+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e
> -SRC_URI =3D "${E_SVN}/trunk/TMP/st;module=3D${SRCNAME};proto=3Dhttp;scmd=
ata=3Dkeep"
> +SRC_URI =3D "${E_SVN}/trunk/TMP/st;module=3D${SRCNAME};protocol=3Dhttp;s=
cmdata=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  RDEPENDS_${PN} =3D "waker"
> diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipe=
s-efl/e17/elmdentica_svn.bb
> index 5235dee..c965b68 100644
> --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> +++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://elmdentica.googlecode.com"
>  AUTHOR =3D "seabra"
> =20
>  inherit e gettext
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-e=
fl/e17/emprint_svn.bb
> index d5c4769..777e302 100644
> --- a/meta-efl/recipes-efl/e17/emprint_svn.bb
> +++ b/meta-efl/recipes-efl/e17/emprint_svn.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f=
38e182dcaf30fe8a35"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  FILES_${PN}-dbg +=3D "${libdir}/${PN}/modules/.debug"
> diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl=
/e17/enjoy_svn.bb
> index e1facd7..81be734 100644
> --- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
> +++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
> @@ -21,7 +21,7 @@ RDEPENDS +=3D "\
>         "
> =20
>  inherit e gettext
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  FILES_${PN} +=3D "${datadir}/icons/"
> diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e=
17/eve_svn.bb
> index 9806d4f..d760c4a 100644
> --- a/meta-efl/recipes-efl/e17/eve_svn.bb
> +++ b/meta-efl/recipes-efl/e17/eve_svn.bb
> @@ -6,7 +6,7 @@ PV =3D "0.3.0.0+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e gettext
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  do_configure_prepend() {
> diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl=
/e17/exalt_svn.bb
> index 06fb5bd..3207a4b 100644
> --- a/meta-efl/recipes-efl/e17/exalt_svn.bb
> +++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
> @@ -9,7 +9,7 @@ PV =3D "0.9+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D " \
> diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-=
efl/e17/expedite_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/e17/expedite_svn.bb
> +++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-ef=
l/recipes-efl/e17/exquisite-theme-illume.bb
> index ecb53cc..9037f68 100644
> --- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
> +++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
> @@ -15,7 +15,7 @@ ALTERNATIVE_PRIORITY =3D "10"
> =20
>  SRCNAME =3D "b_and_w"
> =20
> -SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};proto=3Dhttp \
> +SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};protocol=3Dhttp \
>             file://LICENSE \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes=
-efl/e17/exquisite_svn.bb
> index a13a300..a25c4b3 100644
> --- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
> +++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
> @@ -9,7 +9,7 @@ RCONFLICTS_${PN} =3D "psplash virtual-psplash"
>  SRCNAME =3D "exquisite"
> =20
>  inherit e
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/=
e17/rage_svn.bb
> index 2823987..2038054 100644
> --- a/meta-efl/recipes-efl/e17/rage_svn.bb
> +++ b/meta-efl/recipes-efl/e17/rage_svn.bb
> @@ -8,5 +8,5 @@ PV =3D "0.3.0.042+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit e
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/e17/waker_svn.bb b/meta-efl/recipes-efl=
/e17/waker_svn.bb
> index 9eb58fc..1d6d846 100644
> --- a/meta-efl/recipes-efl/e17/waker_svn.bb
> +++ b/meta-efl/recipes-efl/e17/waker_svn.bb
> @@ -8,7 +8,7 @@ SRCREV =3D "${EFL_SRCREV}"
>  inherit efl
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk/TMP/st;module=3D${SRCNAME};proto=3Dhttp \
> +  ${E_SVN}/trunk/TMP/st;module=3D${SRCNAME};protocol=3Dhttp \
>    file://0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch=
 \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/e=
fl/azy_svn.bb
> index bd4268c..814fb46 100644
> --- a/meta-efl/recipes-efl/efl/azy_svn.bb
> +++ b/meta-efl/recipes-efl/efl/azy_svn.bb
> @@ -26,6 +26,6 @@ do_install_append_virtclass-native() {
> =20
>  inherit efl
> =20
> -SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scmda=
ta=3Dkeep"
> +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};protocol=3Dhttp;sc=
mdata=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl=
/efl/ecore_svn.bb
> index f0e8811..05cc9db 100644
> --- a/meta-efl/recipes-efl/efl/ecore_svn.bb
> +++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
> @@ -6,7 +6,7 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>    file://fix-ecore-fb-initialization.patch \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/e=
fl/edb_svn.bb
> index 3ff9d3c..9963563 100644
> --- a/meta-efl/recipes-efl/efl/edb_svn.bb
> +++ b/meta-efl/recipes-efl/efl/edb_svn.bb
> @@ -6,5 +6,5 @@ SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit efl
> =20
> -SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkee=
p"
> +SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3D=
keep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl=
/efl/edbus_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/edbus_svn.bb
> +++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/=
efl/edje_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/edje_svn.bb
> +++ b/meta-efl/recipes-efl/efl/edje_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/e=
fl/eet_svn.bb
> index 4e822d2..e9de45c 100644
> --- a/meta-efl/recipes-efl/efl/eet_svn.bb
> +++ b/meta-efl/recipes-efl/efl/eet_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/=
efl/eeze_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/eeze_svn.bb
> +++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-ef=
l/efl/efreet_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/efreet_svn.bb
> +++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/=
efl/eina_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/eina_svn.bb
> +++ b/meta-efl/recipes-efl/efl/eina_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/e=
fl/eio_svn.bb
> index 4e7b7d9..f43c47f 100644
> --- a/meta-efl/recipes-efl/efl/eio_svn.bb
> +++ b/meta-efl/recipes-efl/efl/eio_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/=
meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
> index 70a184a..d764e96 100644
> --- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
> +++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
> @@ -20,8 +20,8 @@ PV =3D "0.0+svnr${SRCPV}"
>  inherit e-base allarch
> =20
>  SRCNAME =3D "efenniht"
> -SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};proto=3Dhttp;name=
=3DTHM_REV"
> -SRC_URI +=3D "${E_SVN}/trunk/elementary/data;module=3Dthemes;proto=3Dhtt=
p;name=3DELM_REV"
> +SRC_URI =3D "${E_SVN}/trunk/THEMES;module=3D${SRCNAME};protocol=3Dhttp;n=
ame=3DTHM_REV"
> +SRC_URI +=3D "${E_SVN}/trunk/elementary/data;module=3Dthemes;protocol=3D=
http;name=3DELM_REV"
>  SRC_URI +=3D "file://LICENSE"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipe=
s-efl/efl/elementary_svn.bb
> index 4e7b7d9..f43c47f 100644
> --- a/meta-efl/recipes-efl/efl/elementary_svn.bb
> +++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/=
efl/elsa_svn.bb
> index b8a4f63..9629610 100644
> --- a/meta-efl/recipes-efl/efl/elsa_svn.bb
> +++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
> @@ -7,7 +7,7 @@ SECTION =3D "e/apps"
>  PR =3D "r1"
> =20
>  inherit e gettext
> -SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scmda=
ta=3Dkeep \
> +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};protocol=3Dhttp;sc=
mdata=3Dkeep \
>    file://0001-pam-use-common-auth-instead-of-system-auth.patch \
>    file://xserver-nodm.service \
>  "
> diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-ef=
l/efl/embryo_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/embryo_svn.bb
> +++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-e=
fl/efl/emotion_svn.bb
> index 4e7b7d9..f43c47f 100644
> --- a/meta-efl/recipes-efl/efl/emotion_svn.bb
> +++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-e=
fl/efl/engrave_svn.bb
> index 65cb41b..2ebb0a1 100644
> --- a/meta-efl/recipes-efl/efl/engrave_svn.bb
> +++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
> @@ -6,5 +6,5 @@ PV =3D "0.0.0+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit efl
> -SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkee=
p"
> +SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3D=
keep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/=
efl/epdf_svn.bb
> index 2ab1a9e..9f414cd 100644
> --- a/meta-efl/recipes-efl/efl/epdf_svn.bb
> +++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe \
>                      file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b19=
c1d46df6 \
>  "
> =20
> -SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scmda=
ta=3Dkeep \
> +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};protocol=3Dhttp;sc=
mdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/=
efl/epeg_svn.bb
> index bc45bfb..fc2a896 100644
> --- a/meta-efl/recipes-efl/efl/epeg_svn.bb
> +++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
> @@ -5,5 +5,5 @@ PV =3D "0.9.0+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit efl
> -SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkee=
p"
> +SRC_URI =3D "${E_SVN}/OLD;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3D=
keep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-ef=
l/efl/ethumb_svn.bb
> index b7014f3..ac03014 100644
> --- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
> +++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
> @@ -6,7 +6,7 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/=
efl/evas_svn.bb
> index f238d06..594de4a 100644
> --- a/meta-efl/recipes-efl/efl/evas_svn.bb
> +++ b/meta-efl/recipes-efl/efl/evas_svn.bb
> @@ -6,6 +6,6 @@ PR =3D "${INC_PR}.0"
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  SRC_URI =3D "\
> -  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +  ${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=3Dkeep \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-ef=
l/efl/imlib2_svn.bb
> index 1365efb..83de3fe 100644
> --- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
> +++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
> @@ -8,7 +8,7 @@ PV =3D "1.4.2.001+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit efl
> -SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dk=
eep"
> +SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdata=
=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D "--with-x \
> diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipe=
s-efl/efl/libeflvala_svn.bb
> index 0465532..1bde2fe 100644
> --- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
> +++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
> @@ -11,7 +11,7 @@ SRCNAME =3D "vala"
> =20
>  inherit e-base autotools pkgconfig vala
> =20
> -SRC_URI =3D "${E_SVN}/trunk/BINDINGS;module=3D${SRCNAME};proto=3Dhttp \
> +SRC_URI =3D "${E_SVN}/trunk/BINDINGS;module=3D${SRCNAME};protocol=3Dhttp=
 \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
> diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recip=
es-efl/efl/libeweather_svn.bb
> index 58ece2e..c498278 100644
> --- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
> +++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
> @@ -5,7 +5,7 @@ PV =3D "0.0.0+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
> =20
>  inherit efl
> -SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scmda=
ta=3Dkeep"
> +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};protocol=3Dhttp;sc=
mdata=3Dkeep"
>  S =3D "${WORKDIR}/${SRCNAME}"
> =20
>  EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/rec=
ipes-efl/webkit/webkit-efl_svn.bb
> index cd38096..0c490c3 100644
> --- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> @@ -16,9 +16,9 @@ PR =3D "r2"
>  SRCREV_FORMAT =3D "source"
> =20
>  SRC_URI =3D "\
> -  svn://svn.webkit.org/repository/webkit/trunk;module=3DSource;name=3Dso=
urce;proto=3Dhttp;subdir=3Dsrc \
> -  svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibraries=
;proto=3Dhttp;subdir=3Dsrc \
> -  svn://svn.webkit.org/repository/webkit/trunk/;module=3DTools;proto=3Dh=
ttp;subdir=3Dsrc \
> +  svn://svn.webkit.org/repository/webkit/trunk;module=3DSource;name=3Dso=
urce;protocol=3Dhttp;subdir=3Dsrc \
> +  svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibraries=
;protocol=3Dhttp;subdir=3Dsrc \
> +  svn://svn.webkit.org/repository/webkit/trunk/;module=3DTools;protocol=
=3Dhttp;subdir=3Dsrc \
>    file://0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch=
 \
>    file://0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch=
 \
>    file://CMakeLists.txt \
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/rec=
ipes-core/jpeg/libjpeg-turbo_svn.bb
> index f061f41..dd81606 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D=
78fa8dbac547bb5b2a0e6457a6cfe
>  PV =3D "8d+1.2.1"
>  PR =3D "r1"
>  SRCREV =3D "837"
> -SRC_URI =3D "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-tur=
bo;proto=3Dhttps;module=3Dtrunk"
> +SRC_URI =3D "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-tur=
bo;protocol=3Dhttps;module=3Dtrunk"
> =20
>  S =3D "${WORKDIR}/trunk"
> =20
> diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/re=
cipes-multimedia/jack/jack_0.121.0.bb
> index ca98146..111c61e 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
> @@ -15,7 +15,7 @@ DEPENDS =3D "alsa-lib"
> =20
>  SVNPV =3D "${@'${PV}'.replace('.', '_')}"
>  SRCREV =3D "4484"
> -SRC_URI =3D "svn://subversion.jackaudio.org/jack/tags;module=3DRELEASE_$=
{SVNPV};proto=3Dhttp \
> +SRC_URI =3D "svn://subversion.jackaudio.org/jack/tags;module=3DRELEASE_$=
{SVNPV};protocol=3Dhttp \
>             file://remove-wrong-host-test.patch \
>             file://jack_fix_TWL4030_alsa_capture.patch \
>            "
> diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-=
oe/recipes-support/opencv/opencv-samples_2.4.bb
> index 90f7536..7ede7c7 100644
> --- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "opencv"
>  LIC_FILES_CHKSUM =3D "file://include/opencv2/opencv.hpp;endline=3D41;md5=
=3D6d690d8488a6fca7a2c192932466bb14 \
>  "
> =20
> -SRC_URI =3D "svn://code.opencv.org/svn/opencv/branches/2.4;module=3Dopen=
cv;proto=3Dhttp \
> +SRC_URI =3D "svn://code.opencv.org/svn/opencv/branches/2.4;module=3Dopen=
cv;protocol=3Dhttp \
>            "
> =20
>  SRCREV =3D "8988"
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
> index e56eacd..942e89a 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS =3D "python-numpy v4l-utils libav gtk+ libtool swig swig-native =
python jpeg bzip2 zlib libpng tiff glib-2.0"
> =20
> -SRC_URI =3D "svn://code.opencv.org/svn/opencv/branches/2.4;module=3Dopen=
cv;proto=3Dhttp \
> +SRC_URI =3D "svn://code.opencv.org/svn/opencv/branches/2.4;module=3Dopen=
cv;protocol=3Dhttp \
>             file://0001-Fix-CMakeLists.txt-numpy-detection.patch \
>            "
> =20
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc b/toolchain=
-layer/recipes-devtools/gcc/gcc-4.6.inc
> index 0859067..20ceb49 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
> @@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552 \
>                     file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5=
b0a1 \
>  		   file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8"
> =20
> -SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH};proto=
=3Dhttp \
> +SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH};proto=
col=3Dhttp \
>  	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>  	   file://100-uclibc-conf.patch \
>             file://gcc-uclibc-locale-ctype_touplow_t.patch \
> --=20
> 1.7.7.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAD1QUACgkQN1Ujt2V2gBwz6QCgiRJ9f7XXGbm14nWGji+UQCm6
JoIAoIu6uvCeTiIX9mWuQdA5rifS2Nwd
=bihh
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
