Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 97DC274578
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 08:35:20 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id b15-v6so11205820qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yjvMVhYaEDEEkHzgiuDe8uJ2epVaCIOemYKoQ9P8gmE=;
	b=n3Zf2Dd+s+OnuEyS4pbG4UZ4KyhnVe/yoQizMJmjxVkaECeOQsLPGIZGEAIP+FxtfC
	P0wLx+k47yXNTnEzlFvOd4x6ZfewWVDwbUl7PnkhGUq+dGtaU2zM1Ch6iowfBJMre6LM
	1VXV6nhIp2blE5zT8Sy6YRwhHW9rUAQ3NMebUYN5/rbAvhoRQJW5J9ijHEd19V4ZRL2z
	Y2lplvISo2q1t/dfGSgMDA0e+T8WNoX4HJX38A+dRwWvpk15z5QGVPhfNuxcbIMeJpqz
	8d9XHN7m1+TOZPKfAG/FzTjmhQE/l1/qq2L/OqW8RoPfVrk0rdVMX9Nryb8eu1104kWB
	1UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yjvMVhYaEDEEkHzgiuDe8uJ2epVaCIOemYKoQ9P8gmE=;
	b=sLqqD2sPqejIb64HIp8PjnLfEXpXMkKcLXrHb9odRcVf2vDOcEWxZ3vzyWEAYyINmW
	XPR5vh6OR1mrFfmMdDNGcHXi76bWfLgKvwF2bKNtaz3ysm6rBY2E0LUt7h78QJ/ojOi2
	R/saDpSzEKgvUBq84+bdXvHQjNoMhhhfmIQoavr9pDMMMulN+KcAIl8qpgD//rE13l4d
	1vQV3FYMNGqSjjtTMlGubazvx1Zq3n58aLHXxzj1XQEO7Dj5SVUGnHEZpWatXNv6SUYz
	XCwWhGqI54FA+tRz/e/EIHbYZfLH/Jz6dDTB53Ok8HRwP9H6GpfzAerqaFXM+dPFGqKg
	vJrg==
X-Gm-Message-State: AOUpUlHQOkUABPwECtzmAnmg1PxxkJEx7skZThG5GLpXmHqf7bhZTHFl
	P/ejl2j7c2RJAvoPJxrajg9x6+0YLxc7CgzlArb3vA==
X-Google-Smtp-Source: AAOMgpeAVZ1qr01/p+LMuad+dNpgL8/2gyjt+Fe9Sy36/Pk3HODtXdl5PIul2XxvGhVkXkAhFaTpgKca4aiQzi3hkOo=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr15787453qta.117.1532939721263; 
	Mon, 30 Jul 2018 01:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180729074241.17191-1-raj.khem@gmail.com>
	<c568b0c1-416c-f712-7702-3c60f38ec955@windriver.com>
In-Reply-To: <c568b0c1-416c-f712-7702-3c60f38ec955@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 01:34:55 -0700
Message-ID: <CAMKF1srOU9dGMwTJKuPv9arKwMqEsxoEoAOD6UMdjT1f3UA80g@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] samba: Update to 4.8.3
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
X-List-Received-Date: Mon, 30 Jul 2018 08:35:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thansk fixed in local pull branch
On Sun, Jul 29, 2018 at 6:11 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
>
>
> =E5=9C=A8 2018=E5=B9=B407=E6=9C=8829=E6=97=A5 15:42, Khem Raj =E5=86=99=
=E9=81=93:
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> > similarity index 94%
> > rename from meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
> > rename to meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> > index fc1a2e0fd0..5afb1d1345 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> > @@ -13,25 +13,27 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sit=
es/ftp.samba.org \n \
> >   "
> >
> >   SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
> > +           file://smb.conf \
> >              file://16-do-not-check-xsltproc-manpages.patch \
> >              file://20-do-not-import-target-module-while-cross-compile.=
patch \
> >              file://21-add-config-option-without-valgrind.patch \
> > -           file://0001-packaging-Avoid-timeout-for-nmbd-if-started-off=
line-.patch \
> > -           file://0006-avoid-using-colon-in-the-checking-msg.patch \
> >              file://netdb_defines.patch \
> >              file://glibc_only.patch \
> >              file://iconv-4.7.0.patch \
> >              file://dnsserver-4.7.0.patch \
> >              file://smb_conf-4.7.0.patch \
> >              file://volatiles.03_samba \
> > -          "
> > +           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor=
-vers.patch \
> > +           file://samba-pam.patch \
> > +           file://samba-4.3.9-remove-getpwent_r.patch \
> > +           "
> >   SRC_URI_append_libc-musl =3D " \
> >              file://samba-pam.patch \
> >              file://samba-4.3.9-remove-getpwent_r.patch \
> >             "
> >
> > -SRC_URI[md5sum] =3D "16b70fda54cf84521ed976a0856430cc"
> > -SRC_URI[sha256sum] =3D "ca6fca9d7e248bcaa55c54bdcc115eeed10660074da5c5=
4a2b78dd3cccc604de"
> > +SRC_URI[md5sum] =3D "67f271ed6b793c2acfe014b5b8f0cca8"
> > +SRC_URI[sha256sum] =3D "e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f=
21387ef253010b82ed"
> >
> >   UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.7(\.\d+)+).tar.gz"
> Please also update UPSTREAM_CHECK_REGEX to check 4.8 series:
> "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
>
> //Yi
>
> >
> > @@ -39,7 +41,7 @@ inherit systemd waf-samba cpan-base perlnative update=
-rc.d
> >   # remove default added RDEPENDS on perl
> >   RDEPENDS_${PN}_remove =3D "perl"
> >
> > -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb lib=
tevent libldb libbsd libaio libpam"
> > +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb lib=
tevent libbsd libaio libpam"
> >
> >   inherit distro_features_check
> >   REQUIRED_DISTRO_FEATURES =3D "pam"
> > @@ -104,7 +106,7 @@ SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_=
PDB_MODULES},${SAMBA4_AUTH_MODU
> >   # .so files so there will not be a conflict.  This is not done consis=
tantly, so be very careful
> >   # when adding to this list.
> >   #
> > -SAMBA4_LIBS=3D"heimdal,cmocka,NONE"
> > +SAMBA4_LIBS=3D"heimdal,cmocka,ldb,pyldb-util,NONE"
> >
> >   EXTRA_OECONF +=3D "--enable-fhs \
> >                    --with-piddir=3D/run \
> > @@ -135,7 +137,7 @@ do_install_append() {
> >       done
> >
> >       install -d ${D}${systemd_system_unitdir}
> > -    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_u=
nitdir}
> > +    install -m 0644 ${S}/bin/default/packaging/systemd/*.service ${D}$=
{systemd_system_unitdir}/
> >       sed -e 's,\(ExecReload=3D\).*\(/kill\),\1${base_bindir}\2,' \
> >           -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
> >           -i ${D}${systemd_system_unitdir}/*.service
> > @@ -159,7 +161,7 @@ do_install_append() {
> >
> >       install -d ${D}${sysconfdir}/samba
> >       echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
> > -    install -m644 packaging/RHEL/setup/smb.conf ${D}${sysconfdir}/samb=
a/smb.conf
> > +    install -m644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
> >       install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}=
/default/volatiles/03_samba
> >
> >       install -d ${D}${sysconfdir}/default
> > @@ -268,6 +270,7 @@ FILES_winbind =3D "${sbindir}/winbindd \
> >                    ${libdir}/samba/idmap \
> >                    ${libdir}/samba/nss_info \
> >                    ${libdir}/winbind_krb5_locator.so \
> > +                 ${libdir}/winbind-krb5-localauth.so \
> >                    ${sysconfdir}/init.d/winbind \
> >                    ${systemd_system_unitdir}/winbind.service"
> >
>

