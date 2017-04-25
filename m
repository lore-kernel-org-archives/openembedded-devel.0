Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8106771CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 12:12:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d79so24541761wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5w/xOI5jpgx3KBuekm2idCnVfsHM575D/oy/3m1Hd4I=;
	b=cHqvnLsnaHbFc3L/cdPwJ9VmBLa9twSr3JLFxjMoXNwCj5/M9f3sElz5vKK4YlWCAh
	vPl+TSruVd0HRbPa1Xml7rzfnWWhavNJwo4y/Dx09w8fqwH12/K+7WgDPIKIIfsSsChQ
	K+QBoEiGPwC3R9hMXiB9TVjn9ATHkOgW2jUDNAIvUP9jSuGI+3IPAFxuGNLJoufjLjmG
	XXMWGxgJ/p01QbxAPR7pqUko734f9gScOjg+aekCDhvlmoODAmPIXcUwaoTpuFqHN9j6
	unZaqncKU/y0C5hyTUKQSw0L2xWi1Guhqnamvd4OQSIYYMyYxnvlCTKgpJ5VvyDGvvHL
	qDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5w/xOI5jpgx3KBuekm2idCnVfsHM575D/oy/3m1Hd4I=;
	b=PiXdy5aASAbitiquQsBxEB/C4yEIdGeNgtMeiVv/+K5N6Q45LUI6XkpL6cWgUORkp/
	nNfV6j/TkMrOXZHcLjb5ryFK6v7TH5ygTRUjckpV47u9fOyuc+qgwhIX+KCrattop6Ir
	juSpFseww/l/0OnwN5joUbTosf5brRDFUiN0Z5NVVwXMJdX1PIqO0L1sC+/omHY3m7E7
	pr3DGTCibGdGc2spKM2FyZQzxNgdPwEwOfAmFhrJcT4ulNRuJ6LR/+96JpUKHtY9nJYj
	G8DlqYX4bWqIlxsDoPPStrQqmPHbtw/+qfb7+5WYKS1ZcRm0Q2zR2PdQ71JWB8ud3dJU
	4PzQ==
X-Gm-Message-State: AN3rC/4m/b5chGQUoQQ79T99qa1U6NUeUfbVqHF9gubgVw8/sni3eRh+
	FhKa3FZKhzKjrZ+9
X-Received: by 10.28.26.149 with SMTP id a143mr12375513wma.18.1493122344085;
	Tue, 25 Apr 2017 05:12:24 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 75sm5019308wmp.2.2017.04.25.05.12.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Apr 2017 05:12:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Apr 2017 14:12:37 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170425121237.GB28641@jama>
References: <20170424052058.4952-1-raj.khem@gmail.com>
	<20170424052058.4952-9-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170424052058.4952-9-raj.khem@gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 09/17] opensaf: Upgrade to 5.2.0
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
X-List-Received-Date: Tue, 25 Apr 2017 12:12:24 -0000
X-Groupsio-MsgNum: 66516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline

--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2017 at 10:20:50PM -0700, Khem Raj wrote:
> Fix build with gcc7

http://errors.yoctoproject.org/Errors/Details/141294/
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../opensaf/0001-Remove-unused-variables.patch     |  43 +++++++
>  ...isable-format-overflow-if-supported-by-gc.patch | 127 +++++++++++++++=
++++++
>  ...gure-Pass-linker-specific-options-with-Wl.patch |  29 +++++
>  .../opensaf/opensaf/0001-plmcd-error-fix.patch     |  43 -------
>  .../opensaf/install-samples-from-srcdir.patch      |  11 --
>  .../opensaf/{opensaf_5.0.0.bb =3D> opensaf_5.2.0.bb} |  35 +++---
>  6 files changed, 214 insertions(+), 74 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
Remove-unused-variables.patch
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
configure-Disable-format-overflow-if-supported-by-gc.patch
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
configure-Pass-linker-specific-options-with-Wl.patch
>  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
plmcd-error-fix.patch
>  delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/insta=
ll-samples-from-srcdir.patch
>  rename meta-networking/recipes-daemons/opensaf/{opensaf_5.0.0.bb =3D> op=
ensaf_5.2.0.bb} (69%)
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-=
unused-variables.patch b/meta-networking/recipes-daemons/opensaf/opensaf/00=
01-Remove-unused-variables.patch
> new file mode 100644
> index 000000000..1c88b81cd
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-=
variables.patch
> @@ -0,0 +1,43 @@
> +From a441a75fbb8451268a8a57616c7158cddc1823aa Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 22 Apr 2017 12:40:19 -0700
> +Subject: [PATCH] Remove unused variables
> +
> +Fixes build errors with gcc7 e.g.
> +
> +../opensaf-5.2.0/src/amf/amfd/imm.cc: In member function 'bool ImmObjCre=
ate::immobj_update_required()':
> +../opensaf-5.2.0/src/amf/amfd/imm.cc:2174:28: error: unused variable 'po=
s' [-Werror=3Dunused-variable]
> +     std::string::size_type pos;
> +                            ^~~
> +../opensaf-5.2.0/src/amf/amfd/imm.cc:2215:28: error: unused variable 'po=
s' [-Werror=3Dunused-variable]
> +     std::string::size_type pos;
> +                            ^~~
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/amf/amfd/imm.cc | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/src/amf/amfd/imm.cc b/src/amf/amfd/imm.cc
> +index 7932364..4f47b65 100644
> +--- a/src/amf/amfd/imm.cc
> ++++ b/src/amf/amfd/imm.cc
> +@@ -2171,7 +2171,6 @@ bool ImmObjCreate::immobj_update_required() {
> +   if (class_type =3D=3D AVSV_SA_AMF_SI_ASSIGNMENT) {
> +     std::string su_name;
> +     std::string sisu_name;
> +-    std::string::size_type pos;
> +     while ((attribute =3D attrValues_[i++]) !=3D nullptr) {
> +       if (!strcmp(attribute->attrName, "safSISU")) {
> +         sisu_name =3D Amf::to_string(
> +@@ -2212,7 +2211,6 @@ bool ImmObjCreate::immobj_update_required() {
> +   } else if (class_type =3D=3D AVSV_SA_AMF_CSI_ASSIGNMENT) {
> +     std::string comp_name;
> +     std::string csicomp_name;
> +-    std::string::size_type pos;
> +     AVD_CSI *csi =3D nullptr;
> +     AVD_COMP *comp =3D nullptr;
> +     AVD_COMP_CSI_REL *compcsi =3D nullptr;
> +--=20
> +2.12.2
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configu=
re-Disable-format-overflow-if-supported-by-gc.patch b/meta-networking/recip=
es-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-suppor=
ted-by-gc.patch
> new file mode 100644
> index 000000000..512e246c5
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disa=
ble-format-overflow-if-supported-by-gc.patch
> @@ -0,0 +1,127 @@
> +From ab00d6f5793b2d850f975bcb6d5d0aa6d7a9eaa4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 22 Apr 2017 12:34:37 -0700
> +Subject: [PATCH] configure: Disable format-overflow if supported by gcc
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile.am                 |  6 ++--
> + configure.ac                |  2 ++
> + m4/ax_check_compile_flag.m4 | 74 ++++++++++++++++++++++++++++++++++++++=
+++++++
> + 3 files changed, 79 insertions(+), 3 deletions(-)
> + create mode 100644 m4/ax_check_compile_flag.m4
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index d63fbbb..1012a2c 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -52,10 +52,10 @@ AM_CPPFLAGS =3D \
> + 	-pthread \
> + 	-D_GNU_SOURCE -DINTERNAL_VERSION_ID=3D'"@INTERNAL_VERSION_ID@"' \
> + 	$(CORE_INCLUDES) \
> +-	$(all_includes)
> ++	$(all_includes) @NOWARNINGS@
> +=20
> +-AM_CFLAGS =3D -pipe -std=3Dgnu11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=3D2=
 -Werror
> +-AM_CXXFLAGS =3D -pipe -std=3Dgnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=
=3D2 -Werror
> ++AM_CFLAGS =3D -pipe -std=3Dgnu11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=3D2=
 -Werror @NOWARNINGS@
> ++AM_CXXFLAGS =3D -pipe -std=3Dgnu++11 @OSAF_HARDEN_FLAGS@ -Wall -Wformat=
=3D2 -Werror @NOWARNINGS@
> + AM_LDFLAGS =3D @OSAF_HARDEN_FLAGS@ -Wl,--as-needed -ldl -lrt -pthread -=
rdynamic
> + ACLOCAL_AMFLAGS =3D -I m4
> + OSAF_LIB_FLAGS =3D
> +diff --git a/configure.ac b/configure.ac
> +index 02771c6..b76b0fe 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -557,6 +557,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
> + fi
> + AC_SUBST(OSAF_HARDEN_FLAGS)
> +=20
> ++AX_CHECK_COMPILE_FLAG([-Werror=3Dformat-overflow],[NOWARNINGS=3D-Wno-er=
ror=3Dformat-overflow])
> ++AC_SUBST(NOWARNINGS)
> + #############################################
> + # List the output Makefiles
> + #############################################
> +diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
> +new file mode 100644
> +index 0000000..dcabb92
> +--- /dev/null
> ++++ b/m4/ax_check_compile_flag.m4
> +@@ -0,0 +1,74 @@
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.=
html
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EX=
TRA-FLAGS], [INPUT])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   Check whether the given FLAG works with the current language's comp=
iler
> ++#   or gives an error.  (Warnings, however, are ignored)
> ++#
> ++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
> ++#   success/failure.
> ++#
> ++#   If EXTRA-FLAGS is defined, it is added to the current language's de=
fault
> ++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made=
 with
> ++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used=
 to
> ++#   force the compiler to issue an error when a bad flag is given.
> ++#
> ++#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
> ++#
> ++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
> ++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
> ++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
> ++#
> ++#   This program is free software: you can redistribute it and/or modif=
y it
> ++#   under the terms of the GNU General Public License as published by t=
he
> ++#   Free Software Foundation, either version 3 of the License, or (at y=
our
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Ge=
neral
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License a=
long
> ++#   with this program. If not, see <https://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright o=
wner
> ++#   gives unlimited permission to copy, distribute and modify the confi=
gure
> ++#   scripts that are the output of Autoconf when processing the Macro. =
You
> ++#   need not follow the terms of the GNU General Public License when us=
ing
> ++#   or distributing such scripts, even though portions of the text of t=
he
> ++#   Macro appear in them. The GNU General Public License (GPL) does gov=
ern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoco=
nf
> ++#   Macro released by the Autoconf Archive. When you make and distribut=
e a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 5
> ++
> ++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
> ++[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
> ++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])=
dnl
> ++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
> ++  ax_check_save_flags=3D$[]_AC_LANG_PREFIX[]FLAGS
> ++  _AC_LANG_PREFIX[]FLAGS=3D"$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
> ++  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
> ++    [AS_VAR_SET(CACHEVAR,[yes])],
> ++    [AS_VAR_SET(CACHEVAR,[no])])
> ++  _AC_LANG_PREFIX[]FLAGS=3D$ax_check_save_flags])
> ++AS_VAR_IF(CACHEVAR,yes,
> ++  [m4_default([$2], :)],
> ++  [m4_default([$3], :)])
> ++AS_VAR_POPDEF([CACHEVAR])dnl
> ++])dnl AX_CHECK_COMPILE_FLAGS
> +--=20
> +2.12.2
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configu=
re-Pass-linker-specific-options-with-Wl.patch b/meta-networking/recipes-dae=
mons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.pa=
tch
> new file mode 100644
> index 000000000..5756a027b
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass=
-linker-specific-options-with-Wl.patch
> @@ -0,0 +1,29 @@
> +From 6248b717b4861d16b80235fd8e57d64e4f636428 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 13 Apr 2017 17:39:07 -0700
> +Subject: [PATCH] configure: Pass linker specific options with -Wl
> +
> +This helps make it pass the options to linker correctly
> +and we can use non-gcc compilers
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index df4fc58..02771c6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -553,7 +553,7 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
> + 	if echo "${CFLAGS} ${CXXFLAGS}" | grep -q -- -O0; then
> + 		OSAF_HARDEN_FLAGS=3D""
> + 	fi
> +-	OSAF_HARDEN_FLAGS=3D"${OSAF_HARDEN_FLAGS} -fstack-protector --param ss=
p-buffer-size=3D4 -fPIE -pie -zrelro -znow"
> ++	OSAF_HARDEN_FLAGS=3D"${OSAF_HARDEN_FLAGS} -fstack-protector --param ss=
p-buffer-size=3D4 -fPIE -pie -Wl,-z,relro,-z,now"
> + fi
> + AC_SUBST(OSAF_HARDEN_FLAGS)
> +=20
> +--=20
> +2.12.2
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-e=
rror-fix.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd=
-error-fix.patch
> deleted file mode 100644
> index 624cd2d7b..000000000
> --- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fi=
x.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From f1813af4c154fb1d3950abbdf678c3a5a67222fc Mon Sep 17 00:00:00 2001
> -From: Li xin <lixin.fnst@cn.fujitsu.com>
> -Date: Thu, 25 Jun 2015 11:44:27 +0900
> -Subject: [PATCH] plmcd: error fix
> -
> -ld: cannot find -lsystemd-daemon
> -collect2: error: ld returned 1 exit status
> -
> -Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ----
> - contrib/plmc/plmcd/Makefile.am | 2 +-
> - contrib/plmc/plmcd/Makefile.in | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/contrib/plmc/plmcd/Makefile.am b/contrib/plmc/plmcd/Makefil=
e.am
> -index 8d847f2..dd7913a 100644
> ---- a/contrib/plmc/plmcd/Makefile.am
> -+++ b/contrib/plmc/plmcd/Makefile.am
> -@@ -32,7 +32,7 @@ plmcd_SOURCES =3D \
> - plmcd_LDFLAGS =3D -lpthread
> -=20
> - if ENABLE_SYSTEMD
> --plmcd_LDFLAGS +=3D -lsystemd-daemon
> -+plmcd_LDFLAGS +=3D -lsystemd
> - endif
> -=20
> - plmcd_LDADD =3D \
> -diff --git a/contrib/plmc/plmcd/Makefile.in b/contrib/plmc/plmcd/Makefil=
e.in
> -index 0185dc4..e40513a 100644
> ---- a/contrib/plmc/plmcd/Makefile.in
> -+++ b/contrib/plmc/plmcd/Makefile.in
> -@@ -106,7 +106,7 @@ build_triplet =3D @build@
> - host_triplet =3D @host@
> - target_triplet =3D @target@
> - sbin_PROGRAMS =3D plmcd$(EXEEXT)
> --@ENABLE_SYSTEMD_TRUE@am__append_1 =3D -lsystemd-daemon
> -+@ENABLE_SYSTEMD_TRUE@am__append_1 =3D -lsystemd
> - subdir =3D plmcd
> - ACLOCAL_M4 =3D $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps =3D $(top_srcdir)/configure.ac
> ---=20
> -1.8.4.2
> -
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/install-samp=
les-from-srcdir.patch b/meta-networking/recipes-daemons/opensaf/opensaf/ins=
tall-samples-from-srcdir.patch
> deleted file mode 100644
> index 016b64f2e..000000000
> --- a/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-fro=
m-srcdir.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- opensaf-4.5.0.orig/Makefile.am	2014-12-31 14:45:54.088797989 +0800
> -+++ opensaf-4.5.0/Makefile.am	2014-12-31 14:45:08.328796688 +0800
> -@@ -219,7 +219,7 @@ install-data-local:
> - 	$(mkinstalldirs) $(DESTDIR)$(pkgpiddir)
> - 	$(mkinstalldirs) $(DESTDIR)$(lockdir)
> - 	$(mkinstalldirs) $(DESTDIR)$(pkglocalstatedir)
> --	cp -R samples/ $(DESTDIR)$(pkgdatadir)
> -+	cp -R $(srcdir)/samples/ $(DESTDIR)$(pkgdatadir)
> -=20
> - install-data-hook:
> - 	@for i in $$(grep -lr -e 'xxLIBDIRxx' -e 'xxLOGDIRxx' -e 'xxCLCCLIDIRx=
x' $(DESTDIR)$(pkgimmxml_svcdir)/*.xml) ; do \
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/m=
eta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> similarity index 69%
> rename from meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> rename to meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> index 6ceb225e9..5abd560f0 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> @@ -15,14 +15,17 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Da916467b91076e631dd8edb74=
24769c7"
> =20
>  DEPENDS =3D "libxml2 python"
> +TOOLCHAIN =3D "gcc"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
> -           file://install-samples-from-srcdir.patch \
> -           file://0001-plmcd-error-fix.patch \
> -           "
> +SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
> =20
> -SRC_URI[md5sum] =3D "94cd1a4c0406e6a45bb04c003f8690e7"
> -SRC_URI[sha256sum] =3D "4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08e7=
df2ed9ecd54bb999"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
> +           file://0001-configure-Pass-linker-specific-options-with-Wl.pa=
tch \
> +           file://0001-configure-Disable-format-overflow-if-supported-by=
-gc.patch \
> +           file://0001-Remove-unused-variables.patch \
> +"
> +SRC_URI[md5sum] =3D "08991fd467ae9dcea3c8747be8e3981e"
> +SRC_URI[sha256sum] =3D "903478244afe37e329be93050f1d48fa18c84ea17862134c=
4217b920e267a04a"
> =20
>  inherit autotools useradd systemd pkgconfig
> =20
> @@ -33,34 +36,26 @@ USERADD_PARAM_${PN} =3D  "-r -g opensaf -d ${datadir}=
/opensaf/ -s ${sbindir}/nolog
>  SYSTEMD_SERVICE_${PN} +=3D "opensafd.service plmcboot.service plmcd.serv=
ice"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
> -PACKAGECONFIG[systemd] =3D "--enable-systemd-daemon"
> +PACKAGECONFIG[systemd] =3D ",,systemd"
>  PACKAGECONFIG[openhpi] =3D "--with-hpi-interface=3DB03 --enable-ais-plm,=
,openhpi"
> =20
> -EXTRA_OECONF +=3D " --libdir=3D${libdir}/opensaf "
> -EXTRA_OEMAKE +=3D " -Wl,-rpath,${libdir}/opensaf "
> +PACKAGECONFIG_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'syste=
md', 'systemd', '', d)}"
> =20
> -PKGLIBDIR=3D"${libdir}/opensaf/opensaf"
> -
> -do_configure_prepend () {
> -        ( cd ${S}; autoreconf -f -i -s )
> -}
> +PKGLIBDIR=3D"${libdir}"
> =20
>  do_install_append() {
> +    cp -av --no-preserve=3Downership ${B}/lib/.libs/*.so* ${D}${libdir}
>      rm -fr "${D}${localstatedir}/lock"
>      rm -fr "${D}${localstatedir}/run"
>      rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensaf=
d.service \
> -        ${D}${systemd_unitdir}/system
> -    install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_un=
itdir}/system
> -
> +    rmdir --ignore-fail-on-non-empty "${D}${datadir}/java"
>      if [ ! -d "${D}${sysconfdir}/init.d" ]; then
>          install -d ${D}${sysconfdir}/init.d
>          install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/op=
ensafd ${D}${sysconfdir}/init.d/
>      fi
>  }
> =20
> -FILES_${PN} +=3D "${localstatedir}/run ${systemd_unitdir}/system/*.servi=
ce"
> +FILES_${PN} +=3D "${systemd_unitdir}/system/*.service"
>  FILES_${PN}-staticdev +=3D "${PKGLIBDIR}/*.a"
> =20
>  INSANE_SKIP_${PN} =3D "dev-so"
> --=20
> 2.12.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWP89NQAKCRA3VSO3ZXaA
HL/YAKCDcBzaj/V7p1DVL0V3uF15ZvmThACgq0balO2zzITCVx/+uIkEIgWEiRA=
=2yDF
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
