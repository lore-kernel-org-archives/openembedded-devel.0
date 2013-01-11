Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtnMO-000745-7v
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 23:46:01 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so960789dad.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 14:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jp/zh3U5xw0vrze+UNCR+EM5h6btthkBnpN4ckoe+/U=;
	b=o5/ErYtux+wwNoVCJ/p+xxNy6y9ixamdfRg3YFLaFSgDgxtnRULcgPcIVa0sBGCXFm
	BmmDC90qDxjQjqm+8jmnpqA3OlTgdHrTfa2FtS+PVOkZCcHexh/KTP7UvZdZaLjzmMRX
	SIn46cTJ+ouZiuykBWZWt7v/y3VqoSr5cfMFlA86RLKWR4yVk6nqz8DpCMkgEVCECX7m
	4BK+sUohjLEaImKv8jsGzJnq8CKqgMngQHi5l72nlenJ45REOq9RWG5hGS9hI+OgCACf
	f+H9VMIwOZfSOdfOG/EsMxTItWLEEgm5BB3n7RczffNi+Ce6mCZGOj0H//l7+w2vT65B
	2ZHQ==
X-Received: by 10.68.232.101 with SMTP id tn5mr234118409pbc.125.1357943444058; 
	Fri, 11 Jan 2013 14:30:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kp4sm3465636pbc.52.2013.01.11.14.30.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 14:30:42 -0800 (PST)
Date: Fri, 11 Jan 2013 23:30:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130111223053.GB13385@jama.palm1.palmone.com>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
	<1357936861-8245-3-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1357936861-8245-3-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/3] gnuradio : Update to version 3.6.3.
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
X-List-Received-Date: Fri, 11 Jan 2013 22:46:04 -0000
X-Groupsio-MsgNum: 42671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 03:41:01PM -0500, Philip Balister wrote:
> Also fixes pakcaging issues for the examples package.
>=20

 /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_fff_a=
rmv7_a.c: In function 'dotprod_fff_armv7_a':
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_fff_=
armv7_a.c:67:5: error: inconsistent operand constraints in an 'asm'
| make[2]: *** [gnuradio-core/src/lib/CMakeFiles/gnuradio-core.dir/filter/d=
otprod_fff_armv7_a.c.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/cmake -E cmake_progress_report /home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/=
build/CMakeFiles
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/cmake -E cmake_progress_report /home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.3-r0/git/=
build/CMakeFiles
| [ 37%] [ 37%] Generating gnuradio_core_general.pyc

For whole log see
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30111_140417.log/

Cheers,

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 16 +++++--------=
---
>  1 file changed, 5 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta=
-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> index aca2f97..f084149 100644
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> @@ -4,8 +4,6 @@ SECTION =3D  "apps"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -PR =3D "r0"
> -
>  DEPENDS =3D "uhd gsl fftwf python alsa-lib boost cppunit \
>             swig-native python-numpy python-pygtk orc qt4-x11-free qwt"
> =20
> @@ -23,11 +21,6 @@ RDEPENDS_${PN} =3D "python-core python-audio python-th=
reading python-codecs \
> =20
>  C_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
> =20
> -#do_configure_append() {
> -#	find ${S} -name Makefile | xargs sed -i s:'-I${STAGING_INCDIR_NATIVE':=
:g
> -#	find ${S} -name Makefile | xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE':=
:g
> -#}
> -
>  do_configure_prepend() {
>  	${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S}/gr-v=
ocoder/lib/generate_codebook -lm
>  	echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocoder/lib/=
generate_codebook.txt
> @@ -39,7 +32,7 @@ do_compile_prepend() {
>  	cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-vocoder=
/lib/codec2
>  }
> =20
> -PACKAGES =3D+ "\
> +PACKAGES +=3D " \
>    ${PN}-examples \
>    ${PN}-grc \
>  "
> @@ -53,20 +46,21 @@ FILES_${PN} +=3D "${prefix}/etc/gnuradio/*"
> =20
>  FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
>                      ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
> +                    ${datadir}/gnuradio/examples/*/.debug \
>  		   "
>  FILES_${PN}-examples =3D "${datadir}/gnuradio/examples"
> =20
> -PV =3D "3.5.3"
> +PV =3D "3.6.3"
> =20
>  FILESPATHPKG_prepend =3D "gnuradio-git:"
> =20
> -SRCREV =3D "f621a52f779381cfe550b4278b83e701a747944c"
> +SRCREV =3D "607a6fa3f80e08298ce7b3ee74ffca1590c05164"
> =20
>  # Make it easy to test against developer repos and branches
>  GIT_REPO =3D "gnuradio.git"
>  GIT_BRANCH =3D "master"
> =20
> -SRC_URI =3D "git://gnuradio.org/git/${GIT_REPO};branch=3D${GIT_BRANCH};p=
rotocol=3Dhttp \
> +SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};proto=
col=3Dgit \
>  "
> =20
>  S=3D"${WORKDIR}/git"
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDwkp0ACgkQN1Ujt2V2gBwYHgCcDWtG+ESMvTnmH+tN5DWbgFVt
tQEAnA10fhr8D8T2YUM3HGtZqUrvW3Bt
=msvp
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
