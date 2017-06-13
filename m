Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBECD782D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:14:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u101so27170169wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Cs863keTVu9oqRyQZShMqxXG+fuY+xElD0WFdoUWqx0=;
	b=aLshaDzcLC/WOnf1dYZ+yKICjAldiNncehRqdPVvVqoi7AjsipqzYZlme6LSnszpra
	Mr008gBSwRyRSa//TfNAXHwYoEA4TO7qZR/geC7zdevCgJawdV7yxZrCEXHlSmDahfHj
	UXIu2QlsVEavB7Pi/bn55dqCLAvBgG7rUHf/tr3mQw+PcTzqks9CCDUdMZxvOrR41u6o
	YSJ2nTQG1zXud+yK3Qz+3+4YM560NgfkJzFZz3pA1PJSDqDpwZ3dGkI4YfWaPhnOLgKA
	uADF9aprswidcOJ/UmsqVs8jEOVABhdpjrbKcShbB+I6w1adozVM32T89KoWGlkVfvel
	cKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Cs863keTVu9oqRyQZShMqxXG+fuY+xElD0WFdoUWqx0=;
	b=ZxSBddIcki6ibREqK5f00QPdCzH2oWdwJrCmojGU7x37rjTArIYVU2LYxFdR3g2n3a
	FDeAf4UGB3GyBMQpUZ4KW5qMfTBoih13LA9uiLDKcvCemokuCodqwscW3ZODvmKSqG5R
	I56W2vV0151fqtmpzN5jLx3KuMBGgJ1b4t5/y+Uqq6D7vIzD13b/zjEZPW+xU0fz8KYI
	ZoEjp3H/dCR7iy7hyq/EHTZYZTvVttALDnRDWw4fIhbiGCB4BB2e+LmHXO1MYgTzAOTI
	vqfn1Qw/ieAt3LtoqF6ahFeXbKHlabc1aGASexYcP6l7BnAhNarYrRlLfSsR2oBGEIgd
	J4+A==
X-Gm-Message-State: AKS2vOyvl/mBdQf66zrGWFamoztt05vgwS+Eng1rPE1EDPoUfF8GjSe3
	1BGbUADDJTkgPQ==
X-Received: by 10.28.178.198 with SMTP id b189mr1598786wmf.8.1497338053265;
	Tue, 13 Jun 2017 00:14:13 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q16sm2258887wmg.2.2017.06.13.00.14.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 00:14:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Jun 2017 07:14:12 +0200
To: jackie.huang@windriver.com
Message-ID: <20170613051412.GA3088@jama>
References: <cover.1496990155.git.jackie.huang@windriver.com>
	<7a8affe1cd168ad90c80082ac0e063f90bc92a0d.1496990155.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <7a8affe1cd168ad90c80082ac0e063f90bc92a0d.1496990155.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/4] microcode-ctl: add new recipe
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
X-List-Received-Date: Tue, 13 Jun 2017 07:14:14 -0000
X-Groupsio-MsgNum: 67134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2017 at 02:40:33PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The microcode_ctl utility is a companion to the
> IA32 microcode driver.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../0001-add-support-for-other-distributions.patch | 27 ++++++++++
>  .../files/0001-fix-the-help-return-code.patch      | 57 ++++++++++++++++=
++++
>  .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  | 30 +++++++++++
>  .../microcode-ctl/files/microcode_ctl.service      | 11 ++++
>  .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb | 62 ++++++++++++++++=
++++++
>  5 files changed, 187 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-supp=
ort-for-other-distributions.patch
>  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-=
help-return-code.patch
>  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HA=
SH-in-the-elf-binary.patch
>  create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl=
=2Eservice
>  create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
>=20
> diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for=
-other-distributions.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-a=
dd-support-for-other-distributions.patch
> new file mode 100644
> index 000000000..fe5428493
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-=
distributions.patch
> @@ -0,0 +1,27 @@
> +Subject: [PATCH] add support for other distributions
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + microcode_ctl.start | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/microcode_ctl.start b/microcode_ctl.start
> +index 6fa9d72..e9321d0 100755
> +--- a/microcode_ctl.start
> ++++ b/microcode_ctl.start
> +@@ -47,8 +47,8 @@ elif [ -f /etc/slackware-version ]; then
> + 		END=3Dslack_end
> + 	fi
> + else
> +-	echo "$0: Can't guess distribution, aborting!"
> +-	exit 1
> ++	START=3D
> ++	END=3D
> + fi
> +=20
> + # Lets just be sure we have a device file...
> +--=20
> +2.11.0
> +
> diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-re=
turn-code.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help=
-return-code.patch
> new file mode 100644
> index 000000000..cbe7755e9
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-co=
de.patch
> @@ -0,0 +1,57 @@
> +[PATCH] fix the help return code
> +
> +Upstream-Status: Pending
> +
> +not always return 1 when call usage(), differ the return code by user ac=
tion;
> +if a use wants to get help information, it is normal action, should be
> +return 0;
> +if input parameter is wrong, and microcode_ctl prompts the help informat=
ion,
> +it should be return 1;
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + microcode_ctl.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/microcode_ctl.c b/microcode_ctl.c
> +index 3f9c151..cdcdc10 100644
> +--- a/microcode_ctl.c
> ++++ b/microcode_ctl.c
> +@@ -40,7 +40,6 @@ static void usage(void)
> + 			"  -u	upload microcode (default filename:\"%s\"\n"
> + 			"  -f	upload microcode from named Intel formatted file\n\n",=20
> + 			progname, MICROCODE_FILE_DEFAULT);
> +-	exit(1);
> + }
> +=20
> + /*=20
> +@@ -141,6 +140,7 @@ int main(int argc, char *argv[])
> + 		switch(c) {
> + 			case 'h':
> + 				usage();
> ++				return 0;
> +=20
> + 			case 'q':
> + 				print_normal_messages=3D0;
> +@@ -168,14 +168,17 @@ int main(int argc, char *argv[])
> +=20
> + 			case '?':
> + 				usage();
> ++				return 0;
> + 		}
> + 	}
> +=20
> + 	if (upload) {
> + 		if((return_code =3D do_update(device, filename)))
> + 			exit(return_code);
> +-	} else
> ++	} else {
> + 		usage();
> ++		return 1;
> ++	}
> +=20
> + 	return 0;
> + }
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-t=
he-elf-binary.patch b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HA=
SH-in-the-elf-binary.patch
> new file mode 100644
> index 000000000..87d8f7dfe
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-=
binary.patch
> @@ -0,0 +1,30 @@
> +From a5d4baf79ee332cf73e5259a2568958babcdbce2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 1 Aug 2016 07:00:35 -0400
> +Subject: [PATCH] fix No GNU_HASH in the elf binary
> +
> +Let recipe's LDFLAGS work in Makefile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 590ae7e..d4e0610 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -37,7 +37,7 @@ RCFILETO        =3D $(RCDIR)/$(RCHOMEDIR)
> + all: microcode_ctl
> +=20
> + microcode_ctl: microcode_ctl.c
> +-	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c
> ++	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c $(LDFLAGS)
> + 	mkdir intel-ucode amd-ucode
> + 	tar xfz $(MICROCODE_INTEL) -C intel-ucode
> + 	tar --strip-components 1 -xf $(MICROCODE_AMD) -C amd-ucode
> +--=20
> +2.8.1
> +
> diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.servic=
e b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
> new file mode 100644
> index 000000000..0658ff378
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DApply Cpu Microcode
> +
> +[Service]
> +Type=3Dforking
> +KillMode=3Dprocess
> +RemainAfterExit=3Dyes
> +ExecStart=3D@SBINDIR@/microcode_ctl -Qu
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb b/met=
a-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
> new file mode 100755
> index 000000000..12fa5f564
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "Microcode Control Tool"
> +DESCRIPTION =3D "The microcode_ctl utility is a companion to the IA32 mi=
crocode driver \
> +  The utility has two uses: \
> +  a) it decodes and sends new microcode to the kernel driver to be uploa=
ded \
> +     to Intel IA32 family processors. (Pentium Pro, PII, Celeron, PIII, \
> +     Xeon, Pentium 4 etc, x86_64) \
> +  b) it signals the kernel driver to release any buffers it may hold \
> +"
> +HOMEPAGE =3D "https://pagure.io/microcode_ctl/"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f809=
80d171dd6425610833a22dbe6"

There is no indication about the license in the repository?

> +SRC_URI =3D "git://pagure.io/microcode_ctl.git;protocol=3Dhttps \
> +           file://0001-add-support-for-other-distributions.patch \
> +           file://0001-fix-the-help-return-code.patch \
> +           file://fix-No-GNU_HASH-in-the-elf-binary.patch \
> +           file://microcode_ctl.service \
> +          "
> +
> +SRCREV =3D "8c8ae77e661bdba298f256948867d5a619bf1588"
> +
> +# DO NOT use the v2.x which is in the obsolete branch
> +PV =3D "v1.34+git${SRCREV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit update-rc.d systemd
> +
> +INITSCRIPT_PACKAGES =3D "microcode-ctl"
> +INITSCRIPT_NAME_microcode-ctl =3D "microcode_ctl"
> +INITSCRIPT_PARAMS_microcode-ctl =3D "start 80 2 3 4 5 . stop 20 0 1 6 ."
> +
> +SYSTEMD_SERVICE_${PN} =3D "microcode_ctl.service"
> +
> +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> +
> +FIRMWARE_DIR =3D "${nonarch_base_libdir}/firmware"
> +
> +EXTRA_OEMAKE =3D "'CC=3D${CC}' \
> +                'CFLAGS+=3D-Wall -I${STAGING_KERNEL_DIR}/include' \
> +               "

I don't see kernel in DEPENDS and this MACHINE specific variable causes:

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: microcode-ctl different signature for task do_configure.sigdata betw=
een qemux86copy and qemux86
basehash changed from 9d921f4621d8cd18acd74d559a452755 to 9d45e86d0e1b32712=
658581b752e0e8c
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1497333018/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: microcode-ctl different signature for task do_populate_sysroot.sigda=
ta between qemux86copy and qemux86
runtaskdeps changed:
microcode-ctl/microcode-ctl_git.bb.do_install with hash e21ec08f024dad0c8c1=
6f78d5f3e7677
 changed to
microcode-ctl/microcode-ctl_git.bb.do_install with hash f86df62ab78761dcb0b=
bcb94c45c6872
Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_install chang=
ed from e21ec08f024dad0c8c16f78d5f3e7677 to f86df62ab78761dcb0bbcb94c45c6872

ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1497333018/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: microcode-ctl different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
runtaskdeps changed:
microcode-ctl/microcode-ctl_git.bb.do_package with hash 98d64d16e53c5f53e53=
299f55b5667ae
 changed to
microcode-ctl/microcode-ctl_git.bb.do_package with hash c3d694be45ffd4fdb8c=
5a617f4cdeb5d
microcode-ctl/microcode-ctl_git.bb.do_packagedata with hash 57a09030b203208=
086363b7d4f88735e
 changed to
microcode-ctl/microcode-ctl_git.bb.do_packagedata with hash 87f202cce6bacbc=
f0c7128ab55d7c6c5
Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_package chang=
ed from 98d64d16e53c5f53e53299f55b5667ae to c3d694be45ffd4fdb8c5a617f4cdeb5d
Hash for dependent task microcode-ctl/microcode-ctl_git.bb.do_packagedata c=
hanged from 57a09030b203208086363b7d4f88735e to 87f202cce6bacbcf0c7128ab55d=
7c6c5

ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1497333018/signatures.qemux86.do_package_write_ipk.sigdata.log

> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix}
> +    rm -rf ${D}${FIRMWARE_DIR}/amd-ucode
> +
> +    install -d ${D}${systemd_system_unitdir}
> +    install -D -m 0644 ${WORKDIR}/microcode_ctl.service ${D}${systemd_sy=
stem_unitdir}/microcode_ctl.service
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/m=
icrocode_ctl.service
> +}
> +
> +# do_populate_sysroot is not needed for this package,
> +# otherwise, it will conflict with the linux-firmware,
> +do_populate_sysroot[noexec] =3D "1"
> +
> +PACKAGES +=3D "${PN}-firmware"
> +
> +FILES_${PN}-firmware =3D "${FIRMWARE_DIR}/microcode.dat"
> +
> +RDEPENDS_${PN} =3D "${PN}-firmware bash"
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWT90owAKCRA3VSO3ZXaA
HN8JAJ9mtALVEwhbbW0vf0hQmy6YRueLngCfb00iCQSiTYj6zt5JW408ZDzE2HM=
=lG32
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
