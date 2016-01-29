Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 387B97665F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 18:01:11 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l66so77609719wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xQ7X8Z43k+hzqtmnn9D5AE1jh0/k5J5wcIj1XFOV7IE=;
	b=q1ZLFt3BoHn+MTUIoCQsf7B5eZEDNvqWqnLn9Kb9BslgSASuSgx9p7YZUvGCHgVf/8
	8UxbVyBgND92GF/2+zt266pzISan/WcaehXXJ97GzPq4LWr2MdFCJiGeTcmq4uQ7pH2R
	uL5qMnwTCmWtSgkGEa7jkNyfAVAqShMd3OPGJwhY5K7/DOSWsrSTZNqqFwtjOybIJLGM
	hYTzMyByj1bHcdADM9YDjZ+jwxyCSUVEzfgU3x5AeYqDrWm3IB/hvJzad+NW7Kmj9GTZ
	IqsGpvAzQR5E96PZ20SpIBBIlHRZGFptX/1WI0ds4OLUgr59+CYdWloG4kPwnoFECHiU
	Tr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=xQ7X8Z43k+hzqtmnn9D5AE1jh0/k5J5wcIj1XFOV7IE=;
	b=FP1CCeZwiw0apPUB1jpjz+Denv0X7OQ43qCV0aaADr/VMYX7IsN9VPBWwN62p9+g9c
	ZCOSE8kFl1FvS/tCHWegXuqzF1p4c8CPhx4vfAURQHd8TUxNQ+9aLna6pDML8VOrZwFl
	hSGcKCw+X+/OAIZrvFnnQwRPJIXZua4YeyivxbGRQ41zN+/NujYXIwlQuXBx++xNzdYc
	DCvvDlTlI0TTBcLdqICYa+zN4lV0ySeoNZ8yvlt7nYcJi/m3GutauWNkp1nho3fs6Lmm
	ypT9W/8i+EO21bri5SbQoNEbHSMOGsnqKyBYRe8aNDEEOU2k7zfmiOYKxhwwd4gCrioQ
	QuRQ==
X-Gm-Message-State: AG10YOTs/V47yhHc6iVtE24rx4LsfEj86D6Ierhp08+u+ZoUirfJX8BZjR3h0rOAEpSz2w==
X-Received: by 10.194.71.77 with SMTP id s13mr12049672wju.175.1454090472364;
	Fri, 29 Jan 2016 10:01:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w136sm2287115wmw.0.2016.01.29.10.01.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 10:01:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Jan 2016 19:03:37 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160129180337.GB15053@jama>
References: <1453217976-27313-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1453217976-27313-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCHv3] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Fri, 29 Jan 2016 18:01:12 -0000
X-Groupsio-MsgNum: 59760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 10:39:36AM -0500, Philip Balister wrote:
>  * Run tested cpp bindings with GNU Radio Control Port.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-o=
e/recipes-connectivity/thrift/thrift_0.9.3.bb
> new file mode 100644
> index 0000000..7c8f407
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Apache Thrift"
> +DESCRIPTION =3D  "A software framework, for scalable cross-language serv=
ices development"
> +HOMEPAGE =3D "https://thrift.apache.org/"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4ed21f679b2aafef26eac82ab0c2=
cbf"
> +
> +DEPENDS =3D "thrift-native boost python libevent flex-native bison-nativ=
e \
> +           glib-2.0 openssl"
> +
> +SRC_URI =3D "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=
=3Dhttps \
> +"
> +SRCREV =3D "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
> +S =3D "${WORKDIR}/git"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +inherit pkgconfig cmake pythonnative
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
> +
> +EXTRA_OECMAKE =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF"
> +EXTRA_OECMAKE_class-native =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF \
> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF -DWITH_CPP=3DO=
FF"
> +EXTRA_OECMAKE_class-nativesdk =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF \
> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF -DWITH_PYTHON=
=3DOFF"

Didn't help with Qt5:

| -- Parsed Thrift version: 1.0.0 (1.0.0)
| CMake Error at /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm=
/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
|   The imported target "Qt5::Core" references the file
|=20
|      "/qmake"
|=20
|   but this file does not exist.  Possible reasons include:
|=20
|   * The file was deleted, renamed, or moved to another location.
|=20
|   * An install or uninstall procedure did not complete successfully.
|=20
|   * The installation package was faulty and contained
|=20
|      "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/=
cmake/Qt5Core/Qt5CoreConfigExtras.cmake"
|=20
|   but not all the files it references.
|=20
| Call Stack (most recent call first):
|   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/cmak=
e/Qt5Core/Qt5CoreConfigExtras.cmake:6 (_qt5_Core_check_file_exists)
|   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/cmak=
e/Qt5Core/Qt5CoreConfig.cmake:158 (include)
|   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/cmak=
e/Qt5/Qt5Config.cmake:26 (find_package)
|   build/cmake/DefineOptions.cmake:55 (find_package)
|   CMakeLists.txt:45 (include)
|=20
|=20
| -- Configuring incomplete, errors occurred!
| See also "/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux=
-gnueabi/thrift/0.9.3-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/thrift/0.9.3-r0=
/temp/log.do_configure.18928)
NOTE: recipe thrift-0.9.3-r0: task do_configure: Failed
ERROR: Task 16213 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-connectivity/thrift/thrift_0.9.3.bb, do_configure) failed with ex=
it code '1'

> +
> +do_install_append () {
> +	ln -sf thrift ${D}/${bindir}/thrift-compiler
> +}
> +
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlarqXgACgkQN1Ujt2V2gByRzwCfTvGkvAU+qyLnyy4jMEdCxdL6
r1QAnR1ia4tSDtZdtKBaI3iVUNDR3IIb
=CarW
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
