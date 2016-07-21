Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E178607A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 11:14:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so2129538wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=d9SElaQbylVV3Zog39oZyQlrlGeoAyM1ySAicE4dG+w=;
	b=oHeQcH4P+sK50c6ByOSEOSbX4kRWvpV3fICNb4JvKx7gBcmE1Hj/p6iUacXO7v1hbh
	MHY2AzZ4+H1b4bj3Og3gszUmtRrlzhHahVZoTNGASHcAniRWD+dqnnWlvUXZxmWnagud
	DnPrivIMyJucMRbHvqLk2FUhrpfW2ZMYIQ11ZlPw1WmdJotfZppoB7rnrJvwoNOncGTN
	HPq3s6AlPgNc3cU+kc9rzju/UbZg6nbgpQtfYVlbM2jMPL2KsJdSBc+KVZTHrZ36bEt9
	7VV5iIU2eOg1g60QmasjrBowj70iklhMGWv6u+hW4/TJ8NiNkdjW1N5D2PT5T3ZgzJtE
	ocLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=d9SElaQbylVV3Zog39oZyQlrlGeoAyM1ySAicE4dG+w=;
	b=cvGUV+/nSM83VMsxcuzQWv4vAo6R5XYBzHxNSx+DZwgbi9a/BAqAuoG+9PRiIl9MYx
	rBa1Db1LCOuys6ax2O79zJVISq6/vRINkYBIm0f+qG2U+UEa0NV5Ngu/kb4FR0BF4jjR
	6TBtvbrk1xgHbtUeYXa9fgEaMxsiCJO4JQNqbdoLpBtT+9JPcwlrZAHavFSoEbMQZDu6
	MLOs5tC/PE2THsaauvs7kaIvG+Iv5FW+DBFt37ysNTmkBXQQHchuO2gkPA8yWWSTBGmA
	c8DhXmZ/9ZF16UKL90jzI4cb1jsNShUbvNeoxmu8WzEa9aZBb911EtEf5Q/rU5sHwS7q
	rXgg==
X-Gm-Message-State: ALyK8tK0bluNptzt+PjuWv/zoaT9JRa2wjus84zzBJhkkbuCnoS3RnqVmDlA2f+apypfWA==
X-Received: by 10.28.196.14 with SMTP id u14mr8338437wmf.17.1469099648708;
	Thu, 21 Jul 2016 04:14:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	m127sm3165636wmm.21.2016.07.21.04.14.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jul 2016 04:14:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Jul 2016 13:14:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160721111416.6xtpu574dgaavsbx@jama>
References: <1468893439-29598-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1468893439-29598-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH V2] grubby: add grubby 8.40-1
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
X-List-Received-Date: Thu, 21 Jul 2016 11:14:09 -0000
X-Groupsio-MsgNum: 62292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dlhy44lil7up4sfq"
Content-Disposition: inline

--dlhy44lil7up4sfq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 09:57:19AM +0800, mingli.yu@windriver.com wrote:
> * Add grubby bb
> * Rename grub2-editenv to grub-editenv as
>   we don't use the name grub2-editenv for grub2
> * Add ptest support
> * Update #!/bin/bash to #!/bin/sh in test.sh to remove
>   bashisms
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../grubby/grubby-remove-bashisms-in-test.sh.patch | 29 +++++++++
>  ...ubby-rename-grub2-editenv-to-grub-editenv.patch | 69 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/grubby/grubby/run-ptest    |  3 +
>  meta-oe/recipes-support/grubby/grubby_8.40.bb      | 38 ++++++++++++
>  4 files changed, 139 insertions(+)
>  create mode 100644 meta-oe/recipes-support/grubby/grubby/grubby-remove-b=
ashisms-in-test.sh.patch
>  create mode 100644 meta-oe/recipes-support/grubby/grubby/grubby-rename-g=
rub2-editenv-to-grub-editenv.patch
>  create mode 100644 meta-oe/recipes-support/grubby/grubby/run-ptest
>  create mode 100644 meta-oe/recipes-support/grubby/grubby_8.40.bb
>=20
> diff --git a/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms=
-in-test.sh.patch b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bas=
hisms-in-test.sh.patch
> new file mode 100644
> index 0000000..6734e7f
> --- /dev/null
> +++ b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-tes=
t.sh.patch
> @@ -0,0 +1,29 @@
> +From c3a004b8d6dff1a767573dd7baf5d45efddb9f2b Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 15 Jul 2016 11:23:17 +0800
> +Subject: [PATCH] grubby: remove bashisms in test.sh
> +
> +* Update #!/bin/bash to #!/bin/sh in test.sh to
> +  remove below warning:
> +  QA Issue: /usr/lib/grubby/ptest/test.sh contained
> +  in package grubby-ptest requires /bin/bash, but no
> +  providers found in RDEPENDS_grubby-ptest? [file-rdeps]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test.sh b/test.sh
> +index f738388..f3537f3 100755
> +--- a/test.sh
> ++++ b/test.sh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # test.sh -- grubby regression tests
> + #
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-ed=
itenv-to-grub-editenv.patch b/meta-oe/recipes-support/grubby/grubby/grubby-=
rename-grub2-editenv-to-grub-editenv.patch
> new file mode 100644
> index 0000000..d936249
> --- /dev/null
> +++ b/meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-editenv-t=
o-grub-editenv.patch
> @@ -0,0 +1,69 @@
> +From 0841706a5b5280e501c8e392c70c466c5fbcf0aa Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Tue, 4 Aug 2015 23:54:41 -0700
> +Subject: [PATCH] rename grub2-editenv to grub-editenv
> +
> +We don't use the name grub2-editenv for grub2.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + grubby.c | 4 ++--
> + test.sh  | 6 +++---
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/grubby.c b/grubby.c
> +index d4ebb86..47a1a15 100644
> +--- a/grubby.c
> ++++ b/grubby.c
> +@@ -290,7 +290,7 @@ static char *grub2GetEnv(struct configFileInfo *info=
, char *name)
> +     char *s =3D NULL;
> +     char *ret =3D NULL;
> +     char *envFile =3D info->envFile ? info->envFile : "/boot/grub2/grub=
env";
> +-    int rc =3D asprintf(&s, "grub2-editenv %s list | grep '^%s=3D'", en=
vFile, name);
> ++    int rc =3D asprintf(&s, "grub-editenv %s list | grep '^%s=3D'", env=
File, name);
> +=20
> +     if (rc < 0)
> + 	return NULL;
> +@@ -361,7 +361,7 @@ static int grub2SetEnv(struct configFileInfo *info, =
char *name, char *value)
> +     if (!value)
> + 	    return -1;
> +=20
> +-    rc =3D asprintf(&s, "grub2-editenv %s set '%s=3D%s'", envFile, name=
, value);
> ++    rc =3D asprintf(&s, "grub-editenv %s set '%s=3D%s'", envFile, name,=
 value);
> +     free(value);
> +     if (rc <0)
> + 	return -1;
> +diff --git a/test.sh b/test.sh
> +index 6379698..f738388 100755
> +--- a/test.sh
> ++++ b/test.sh
> +@@ -574,7 +574,7 @@ if [ "$testgrub2" =3D=3D "y" ]; then
> +         --title=3D'title' --initrd=3D/boot/new-initrd --boot-filesystem=
=3D/boot/ \
> +         --copy-default
> +     commandTest "saved_default output" \
> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
> ++        "grub-editenv test/grub2-support_files/env_temp list" \
> +         "saved_entry=3DLinux, with Fedora 2.6.38.8-32.fc15.x86_64"
> +=20
> +     testing=3D"GRUB2 add kernel with default=3Dsaved_entry and a terrib=
le title"
> +@@ -587,13 +587,13 @@ if [ "$testgrub2" =3D=3D "y" ]; then
> +     testing=3D"GRUB2 set default with default=3Dsaved_entry and a terri=
ble name"
> +     grub2Test grub2.9 add/g2-1.9 --env grubenv.1 --set-default-index=3D0
> +     commandTest "saved_default output" \
> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
> ++        "grub-editenv test/grub2-support_files/env_temp list" \
> +         'saved_entry=3DFedora (3.10.3-300.fc19.x86_64) 19 (Schr=C3=B6di=
nger=E2=80=99s Cat)'
> +=20
> +     testing=3D"GRUB2 set default with default=3Dsaved_entry"
> +     grub2Test grub2.8 add/g2-1.8 --env grubenv.1 --set-default-index=3D0
> +     commandTest "saved_default output" \
> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
> ++        "grub-editenv test/grub2-support_files/env_temp list" \
> +         "saved_entry=3Dtitle"
> +=20
> +     testing=3D"GRUB2 --default-index with default=3Dsaved_entry"
> +--=20
> +2.3.5
> +
> diff --git a/meta-oe/recipes-support/grubby/grubby/run-ptest b/meta-oe/re=
cipes-support/grubby/grubby/run-ptest
> new file mode 100644
> index 0000000..b06ac59
> --- /dev/null
> +++ b/meta-oe/recipes-support/grubby/grubby/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +./test.sh -v
> diff --git a/meta-oe/recipes-support/grubby/grubby_8.40.bb b/meta-oe/reci=
pes-support/grubby/grubby_8.40.bb
> new file mode 100644
> index 0000000..dc6cc62
> --- /dev/null
> +++ b/meta-oe/recipes-support/grubby/grubby_8.40.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "A command line tool for updating and displaying info about =
boot loaders"
> +DESCRIPTION =3D "grubby is a command line tool for updating and displayi=
ng information \
> +about the configuration files for the grub, lilo, elilo (ia64), yaboot (=
powerpc) and \
> +zipl (s390) boot loaders. It is primarily designed to be used from scrip=
ts which install \
> +new kernels and need to find information about the current boot environm=
ent. \
> +"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa=
63a"
> +
> +DEPENDS =3D "popt util-linux"
> +
> +SRC_URI =3D "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.g=
z;downloadfilename=3D${BPN}-${PV}-1.tar.gz \
> +           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
> +           file://run-ptest \
> +           file://grubby-remove-bashisms-in-test.sh.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "1005907b275d6d93368d045274537d86"
> +SRC_URI[sha256sum] =3D "85f1c678484f74c8978e8643451594967defce463a86c35c=
b1ee56d12767a9df"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}-1"
> +
> +RDEPENDS_${PN} +=3D "dracut"

dracut is in meta-initramfs and meta-oe doesn't depend on
meta-initramfs, can you make this runtime dependency optional or just
move whole recipe to meta-initramfs?

> +inherit autotools-brokensep ptest
> +
> +EXTRA_OEMAKE =3D "'CC=3D${CC}'"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}
> +	cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
> +	sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
> +}
> +
> +RDEPENDS_${PN}-ptest =3D "util-linux-getopt"
> +
> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-(linux|freebsd.*)'
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dlhy44lil7up4sfq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleQrewACgkQN1Ujt2V2gBzuLwCfTmDnt/oK1zBjGAcj0ICnniYA
5XkAn1/JK9I8vVOIuMJDmdJ7GMH61KTR
=ZaH3
-----END PGP SIGNATURE-----

--dlhy44lil7up4sfq--
