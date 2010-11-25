Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLY8F-0007WK-Nj
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:28:52 +0100
Received: by mail-iw0-f175.google.com with SMTP id 7so859110iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mw/SpB6pTcl1PjgK3o3jjuQRv6JrwlgQCzK5noZZ5q4=;
	b=dpl34w72MnIEMGDo6sV4RqRsmyVtFXgAPJ1/neYF1kmPWGQ3c828ecF1WbO3j4+XO8
	ghhKBgsRFtsw6WrGT9B54BJkcnYAT3Ox0kiRdbstnS/u7Tr8oNMG0JvHvBNSm/odDWIN
	B/UW4Pwtw5wfG4+F7NuShl6YryapOMtPkpaI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CRkLRpT7ACFgE5ER2dXpIf3+Z9QQXvcoOT6FHvh4VrJp3ifAMSCBm7Uj7WAcoyde4T
	zbHJ3uqIwaPnxxk3IO4/5GhI8+iHsGUQv3QrsG/MfxrrVl4aoIvC2mxewvVsFjcSPQK3
	QdaarD2XyncnYUGe47N8nzxlN2DbQCY5erxwk=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr365132ibe.101.1290677246692; Thu,
	25 Nov 2010 01:27:26 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 01:27:26 -0800 (PST)
In-Reply-To: <1290676461-13283-3-git-send-email-eric@eukrea.com>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
Date: Thu, 25 Nov 2010 10:27:26 +0100
Message-ID: <AANLkTi=yXyMUtqaMJ=dtb3y8YSQDT3kv5xYcrhhn3utS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/5] busybox: remove 1.17.1
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
X-List-Received-Date: Thu, 25 Nov 2010 09:28:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/25 Eric B=E9nard <eric@eukrea.com>:
> as it's no more default for Angstrom-2010
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/busybox/busybox-1.17.1/B921600.patch =A0 =A0 =A0 | =A0 13 -
> =A0.../busybox-1.17.1/busybox-1.17.1-grep.patch =A0 =A0 =A0 | =A0 39 -
> =A0.../busybox-1.17.1/busybox-1.17.1-make.patch =A0 =A0 =A0 | =A0 32 -
> =A0.../busybox-1.17.1/busybox-1.17.1-mdev.patch =A0 =A0 =A0 | =A0 49 --
> =A0.../busybox-1.17.1/busybox-1.17.1-mktemp.patch =A0 =A0 | =A0 12 -
> =A0.../busybox-1.17.1/busybox-1.17.1-sed.patch =A0 =A0 =A0 =A0| =A0117 --=
-
> =A0.../busybox-1.17.1/busybox-1.17.1-shell.patch =A0 =A0 =A0| =A0105 ---
> =A0recipes/busybox/busybox-1.17.1/defconfig =A0 =A0 =A0 =A0 =A0 | =A0873 =
--------------------
> =A0recipes/busybox/busybox-1.17.1/fdisk_nios2.patch =A0 | =A0 13 -
> =A0.../busybox/busybox-1.17.1/get_header_tar.patch =A0 =A0| =A0 11 -
> =A0.../busybox-1.17.1/udhcpc-fix-nfsroot.patch =A0 =A0 =A0 =A0| =A0 47 --
> =A0recipes/busybox/busybox-1.17.1/udhcpscript.patch =A0 | =A0 13 -
> =A0recipes/busybox/busybox_1.17.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 16 -
> =A013 files changed, 0 insertions(+), 1340 deletions(-)
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/B921600.patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.=
patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.=
patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.=
patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktem=
p.patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.p=
atch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell=
.patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/defconfig
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/fdisk_nios2.patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/get_header_tar.patch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.p=
atch
> =A0delete mode 100644 recipes/busybox/busybox-1.17.1/udhcpscript.patch
> =A0delete mode 100644 recipes/busybox/busybox_1.17.1.bb
>
> diff --git a/recipes/busybox/busybox-1.17.1/B921600.patch b/recipes/busyb=
ox/busybox-1.17.1/B921600.patch
> deleted file mode 100644
> index 61cc32b..0000000
> --- a/recipes/busybox/busybox-1.17.1/B921600.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/=
speed_table.c
> ---- busybox-1.7.2/libbb/speed_table.c =A02007-09-03 13:48:41.000000000 +=
0200
> -+++ busybox-1.7.2-921600/libbb/speed_table.c =A0 2008-10-09 16:23:26.269=
592899 +0200
> -@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =3D
> - #ifdef B460800
> - =A0 =A0 =A0 {B460800, 460800/256 + 0x8000U},
> - #endif
> -+#ifdef B921600
> -+ =A0 =A0 =A0{B921600, 921600/256 + 0x8000U},
> -+#endif
> - };
> -
> - enum { NUM_SPEEDS =3D ARRAY_SIZE(speeds) };
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch b/r=
ecipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
> deleted file mode 100644
> index f8fc25d..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-grep.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -diff -urpN busybox-1.17.1/findutils/grep.c busybox-1.17.1-grep/findutils=
/grep.c
> ---- busybox-1.17.1/findutils/grep.c =A0 =A02010-07-06 04:25:54.000000000=
 +0200
> -+++ busybox-1.17.1-grep/findutils/grep.c =A0 =A0 =A0 2010-08-23 02:37:08=
.000000000 +0200
> -@@ -461,15 +461,19 @@ static int grep_file(FILE *file)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 if (found)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 print_line(gl->pattern, strlen(gl->pat=
tern), linenum, ':');
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 } else while (1) {
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned start =3D gl->matched_range.rm_so;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 unsigned end =3D gl->matched_range.rm_eo;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned len =3D end - start;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 char old =3D line[end];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 line[end] =3D '\0';
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0print_line(line + gl->matched_range.rm_so,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0end - gl->matched_ra=
nge.rm_so,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linenum, ':');
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/* Empty match is not printed: try "echo test | grep=
 -o ''" */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0if (len !=3D 0)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0print_line(line + start, len, linenu=
m, ':');
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 if (old =3D=3D '\0')
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 line[end] =3D old;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0if (len =3D=3D 0)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0end++;
> - #if !ENABLE_EXTRA_COMPAT
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 if (regexec(&gl->compiled_regex, line + end,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1, &gl->matched_range,=
 REG_NOTBOL) !=3D 0)
> -diff -urpN busybox-1.17.1/testsuite/grep.tests busybox-1.17.1-grep/tests=
uite/grep.tests
> ---- busybox-1.17.1/testsuite/grep.tests =A0 =A0 =A0 =A02010-07-06 04:25:=
54.000000000 +0200
> -+++ busybox-1.17.1-grep/testsuite/grep.tests =A0 2010-08-23 02:37:08.000=
000000 +0200
> -@@ -98,5 +98,9 @@ testing "grep -o does not loop forever"
> - =A0 =A0 =A0 'grep -o "[^/]*$"' \
> - =A0 =A0 =A0 "test\n" \
> - =A0 =A0 =A0 "" "/var/test\n"
> -+testing "grep -o does not loop forever on zero-length match" \
> -+ =A0 =A0 =A0'grep -o "" | head -n1' \
> -+ =A0 =A0 =A0"" \
> -+ =A0 =A0 =A0"" "test\n"
> -
> - exit $FAILCOUNT
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch b/r=
ecipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
> deleted file mode 100644
> index 6177696..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-make.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -diff -urpN busybox-1.17.1/Makefile busybox-1.17.1-make/Makefile
> ---- busybox-1.17.1/Makefile =A0 =A02010-07-25 00:13:44.000000000 +0200
> -+++ busybox-1.17.1-make/Makefile =A0 =A0 =A0 2010-08-22 09:30:33.0000000=
00 +0200
> -@@ -433,7 +433,12 @@ ifeq ($(config-targets),1)
> - -include $(srctree)/arch/$(ARCH)/Makefile
> - export KBUILD_DEFCONFIG
> -
> --config %config: scripts_basic outputmakefile gen_build_files FORCE
> -+config: scripts_basic outputmakefile gen_build_files FORCE
> -+ =A0 =A0 =A0$(Q)mkdir -p include
> -+ =A0 =A0 =A0$(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> -+ =A0 =A0 =A0$(Q)$(MAKE) -C $(srctree) KBUILD_SRC=3D .kernelrelease
> -+
> -+%config: scripts_basic outputmakefile gen_build_files FORCE
> - =A0 =A0 =A0 $(Q)mkdir -p include
> - =A0 =A0 =A0 $(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> - =A0 =A0 =A0 $(Q)$(MAKE) -C $(srctree) KBUILD_SRC=3D .kernelrelease
> -@@ -1285,9 +1290,13 @@ endif
> - =A0 =A0 =A0 $(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$(notdir $=
@)
> -
> - # Modules
> --/ %/: prepare scripts FORCE
> -+%/: prepare scripts FORCE
> - =A0 =A0 =A0 $(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES),1) \
> - =A0 =A0 =A0 $(build)=3D$(build-dir)
> -+/: prepare scripts FORCE
> -+ =A0 =A0 =A0$(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES),1) \
> -+ =A0 =A0 =A0$(build)=3D$(build-dir)
> -+
> - %.ko: prepare scripts FORCE
> - =A0 =A0 =A0 $(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES),1) =A0 =
\
> - =A0 =A0 =A0 $(build)=3D$(build-dir) $(@:.ko=3D.o)
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch b/r=
ecipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
> deleted file mode 100644
> index 71c7abd..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mdev.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -diff -urpN busybox-1.17.1/testsuite/mdev.tests busybox-1.17.1-mdev/tests=
uite/mdev.tests
> ---- busybox-1.17.1/testsuite/mdev.tests =A0 =A0 =A0 =A02010-07-06 04:25:=
54.000000000 +0200
> -+++ busybox-1.17.1-mdev/testsuite/mdev.tests =A0 2010-08-23 02:38:21.000=
000000 +0200
> -@@ -38,6 +38,16 @@ brw-rw---- 1 0 0 8,0 sda
> - SKIP=3D
> -
> - # continuing to use directory structure from prev test
> -+optional STATIC FEATURE_MDEV_CONF FEATURE_LS_TIMESTAMPS FEATURE_LS_USER=
NAME
> -+testing "mdev deletes /block/sda" \
> -+ =A0 =A0 =A0"env - PATH=3D$PATH ACTION=3Dremove DEVPATH=3D/block/sda ch=
root mdev.testdir /mdev 2>&1;
> -+ =A0 =A0 =A0ls -ln mdev.testdir/dev | $FILTER_LS" \
> -+"\
> -+" \
> -+ =A0 =A0 =A0"" ""
> -+SKIP=3D
> -+
> -+# continuing to use directory structure from prev test
> - rm -rf mdev.testdir/dev/*
> - echo ".* 1:1 666" >mdev.testdir/etc/mdev.conf
> - echo "sda 2:2 444" >>mdev.testdir/etc/mdev.conf
> -diff -urpN busybox-1.17.1/util-linux/mdev.c busybox-1.17.1-mdev/util-lin=
ux/mdev.c
> ---- busybox-1.17.1/util-linux/mdev.c =A0 2010-07-06 04:25:54.000000000 +=
0200
> -+++ busybox-1.17.1-mdev/util-linux/mdev.c =A0 =A0 =A02010-08-23 02:38:21=
.000000000 +0200
> -@@ -132,6 +132,7 @@ static void make_device(char *path, int
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 major =3D -1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -+ =A0 =A0 =A0/* else: for delete, -1 still deletes the node, but < -1 su=
ppresses that */
> -
> - =A0 =A0 =A0 /* Determine device name, type, major and minor */
> - =A0 =A0 =A0 device_name =3D (char*) bb_basename(path);
> -@@ -279,7 +280,7 @@ static void make_device(char *path, int
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (aliasli=
nk =3D=3D '!' && s =3D=3D a+1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 val =3D st;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 /* "!": suppress node creation/deletion */
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0major =3D -1;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0major =3D -2;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (al=
iaslink =3D=3D '>' || aliaslink =3D=3D '=3D') {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 val =3D st;
> -@@ -379,7 +380,7 @@ static void make_device(char *path, int
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(comman=
d);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (delete && major >=3D 0)=
 {
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (delete && major >=3D -1=
) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ENABLE_=
FEATURE_MDEV_RENAME && alias) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 if (aliaslink =3D=3D '>')
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 unlink(device_name);
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch b=
/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
> deleted file mode 100644
> index 557e337..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -urpN busybox-1.17.1/debianutils/mktemp.c busybox-1.17.1-mktemp/deb=
ianutils/mktemp.c
> ---- busybox-1.17.1/debianutils/mktemp.c =A0 =A0 =A0 =A02010-07-25 00:12:=
56.000000000 +0200
> -+++ busybox-1.17.1-mktemp/debianutils/mktemp.c 2010-07-27 08:21:26.00000=
0000 +0200
> -@@ -50,7 +50,7 @@ int mktemp_main(int argc UNUSED_PARAM, c
> - =A0 =A0 =A0 opts =3D getopt32(argv, "dqtp:", &path);
> -
> - =A0 =A0 =A0 chp =3D argv[optind] ? argv[optind] : xstrdup("tmp.XXXXXX")=
;
> -- =A0 =A0 =A0if (chp[0] !=3D '/' || (opts & 8))
> -+ =A0 =A0 =A0if (!strchr(chp, '/') || (opts & 8))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chp =3D concat_path_file(path, chp);
> -
> - =A0 =A0 =A0 if (opts & 1) { /* -d */
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch b/re=
cipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
> deleted file mode 100644
> index f65aebe..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -diff -urpN busybox-1.17.1/editors/sed.c busybox-1.17.1-sed/editors/sed.c
> ---- busybox-1.17.1/editors/sed.c =A0 =A0 =A0 2010-07-06 04:25:53.0000000=
00 +0200
> -+++ busybox-1.17.1-sed/editors/sed.c =A0 2010-08-17 02:05:27.000000000 +=
0200
> -@@ -61,6 +61,10 @@
> - #include "libbb.h"
> - #include "xregex.h"
> -
> -+enum {
> -+ =A0 =A0 =A0OPT_in_place =3D 1 << 0,
> -+};
> -+
> - /* Each sed command turns into one of these structures. */
> - typedef struct sed_cmd_s {
> - =A0 =A0 =A0 /* Ordered by alignment requirements: currently 36 bytes on=
 x86 */
> -@@ -938,8 +942,11 @@ static void process_files(void)
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (matched) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* once matched, "n,xxx" ra=
nge is dead, disabling it */
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (sed_cmd->beg_line > 0)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (sed_cmd->beg_line > 0
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 && !(option_mask32 & OPT_i=
n_place) /* but not for -i */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed_cmd->be=
g_line =3D -2;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed_cmd->in_match =3D !(
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* has the =
ending line come, or is this a single address command? */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (sed_cmd->e=
nd_line ?
> -@@ -985,6 +992,8 @@ static void process_files(void)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* actual sedding */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0//bb_error_msg("pattern_space:'%s' next_lin=
e:'%s' cmd:%c",
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0//pattern_space, next_line, sed_cmd->cmd);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (sed_cmd->cmd) {
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Print line number */
> -@@ -1111,10 +1120,16 @@ static void process_files(void)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int len;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If no next line, jump to=
 end of script and exit. */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* http://www.gnu.org/softw=
are/sed/manual/sed.html:
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * "Most versions of sed ex=
it without printing anything
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * when the N command is is=
sued on the last line of
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * a file. GNU sed prints p=
attern space before exiting
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * unless of course the -n =
command switch has been
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * specified. This choice i=
s by design."
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (next_line =3D=3D NULL) =
{
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free(next_l=
ine);
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0next_line =
=3D NULL;
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto discar=
d_line;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0//goto disc=
ard_line;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto discar=
d_commands; /* GNU behavior */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Append next_line, read n=
ew next_line. */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D strlen(pattern_spac=
e);
> -@@ -1270,9 +1285,6 @@ static void add_cmd_block(char *cmdstr)
> - int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
> - int sed_main(int argc UNUSED_PARAM, char **argv)
> - {
> -- =A0 =A0 =A0enum {
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0OPT_in_place =3D 1 << 0,
> -- =A0 =A0 =A0};
> - =A0 =A0 =A0 unsigned opt;
> - =A0 =A0 =A0 llist_t *opt_e, *opt_f;
> - =A0 =A0 =A0 int status =3D EXIT_SUCCESS;
> -@@ -1292,6 +1304,7 @@ int sed_main(int argc UNUSED_PARAM, char
> - =A0 =A0 =A0 opt_e =3D opt_f =3D NULL;
> - =A0 =A0 =A0 opt_complementary =3D "e::f::" /* can occur multiple times =
*/
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "nn"; /* count -n *=
/
> -+ =A0 =A0 =A0/* -i must be first, to match OPT_in_place definition */
> - =A0 =A0 =A0 opt =3D getopt32(argv, "irne:f:", &opt_e, &opt_f,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &G.be_quiet); /* co=
unter for -n */
> - =A0 =A0 =A0 //argc -=3D optind;
> -diff -urpN busybox-1.17.1/testsuite/sed.tests busybox-1.17.1-sed/testsui=
te/sed.tests
> ---- busybox-1.17.1/testsuite/sed.tests 2010-07-06 04:25:54.000000000 +02=
00
> -+++ busybox-1.17.1-sed/testsuite/sed.tests =A0 =A0 2010-08-17 02:05:27.0=
00000000 +0200
> -@@ -80,10 +80,18 @@ test x"$SKIP_KNOWN_BUGS" =3D x"" && {
> - # Query: how does this interact with no newline at EOF?
> - testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'=
" \
> - =A0 =A0 =A0 "a\nb\nb\nc\n" "" "a\nb\nc\n"
> --# N does _not_ flush pattern space, therefore c is still in there @ scr=
ipt end.
> --testing "sed N (doesn't flush pattern space when terminating)" "sed -e =
'N;p'" \
> -- =A0 =A0 =A0"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
> - }
> -+# non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @=
 script end
> -+# GNU sed: N flushes pattern space, therefore c is printed too @ script=
 end
> -+testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
> -+ =A0 =A0 =A0"a\nb\na\nb\nc\n" "" "a\nb\nc\n"
> -+
> -+testing "sed N test2" "sed ':a;N;s/\n/ /;ta'" \
> -+ =A0 =A0 =A0"a b c\n" "" "a\nb\nc\n"
> -+
> -+testing "sed N test3" "sed 'N;s/\n/ /'" \
> -+ =A0 =A0 =A0"a b\nc\n" "" "a\nb\nc\n"
> -+
> - testing "sed address match newline" 'sed "/b/N;/b\\nc/i woo"' \
> - =A0 =A0 =A0 "a\nwoo\nb\nc\nd\n" "" "a\nb\nc\nd\n"
> -
> -@@ -270,11 +278,16 @@ testing "sed a cmd ended by double backs
> - =A0 =A0 =A0 | two \\
> - '
> -
> --# fisrt three lines are deleted; 4th line is matched and printed by "2,=
3" and by "4" ranges
> -+# first three lines are deleted; 4th line is matched and printed by "2,=
3" and by "4" ranges
> - testing "sed with N skipping lines past ranges on next cmds" \
> - =A0 =A0 =A0 "sed -n '1{N;N;d};1p;2,3p;3p;4p'" \
> - =A0 =A0 =A0 "4\n4\n" "" "1\n2\n3\n4\n"
> -
> -+testing "sed -i with address modifies all files, not only first" \
> -+ =A0 =A0 =A0"cp input input2; sed -i -e '1s/foo/bar/' input input2 && c=
at input input2; rm input2" \
> -+ =A0 =A0 =A0"bar\nbar\n" "foo\n" ""
> -+
> -+
> - # testing "description" "arguments" "result" "infile" "stdin"
> -
> - exit $FAILCOUNT
> diff --git a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch b/=
recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
> deleted file mode 100644
> index 5279b12..0000000
> --- a/recipes/busybox/busybox-1.17.1/busybox-1.17.1-shell.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -diff -urpN busybox-1.17.1/shell/ash.c busybox-1.17.1-shell/shell/ash.c
> ---- busybox-1.17.1/shell/ash.c 2010-07-25 00:12:43.000000000 +0200
> -+++ busybox-1.17.1-shell/shell/ash.c =A0 2010-07-25 13:09:32.000000000 +=
0200
> -@@ -4515,6 +4515,7 @@ clear_traps(void)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INT_ON;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -+ =A0 =A0 =A0may_have_traps =3D 0;
> - }
> -
> - /* Lives far away from here, needed for forkchild */
> -diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.right busyb=
ox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right
> ---- busybox-1.17.1/shell/ash_test/ash-signals/signal7.right =A0 =A01970-=
01-01 01:00:00.000000000 +0100
> -+++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.right =A0 =
=A0 =A02010-07-25 13:09:32.000000000 +0200
> -@@ -0,0 +1 @@
> -+Bug detected: 0
> -diff -urpN busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests busyb=
ox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests
> ---- busybox-1.17.1/shell/ash_test/ash-signals/signal7.tests =A0 =A01970-=
01-01 01:00:00.000000000 +0100
> -+++ busybox-1.17.1-shell/shell/ash_test/ash-signals/signal7.tests =A0 =
=A0 =A02010-07-25 13:09:32.000000000 +0200
> -@@ -0,0 +1,18 @@
> -+bug() {
> -+ =A0 =A0 =A0trap : exit
> -+ =A0 =A0 =A0# Bug was causing sh to be run in subshell,
> -+ =A0 =A0 =A0# as if this line is replaced with (sh -c ...; exit $?) &
> -+ =A0 =A0 =A0# here:
> -+ =A0 =A0 =A0sh -c 'echo REAL_CHILD=3D$$' &
> -+ =A0 =A0 =A0echo PARENTS_IDEA_OF_CHILD=3D$!
> -+ =A0 =A0 =A0wait =A0# make sure bkgd shell completes
> -+}
> -+
> -+bug | {
> -+while read varval; do
> -+ =A0 =A0 =A0eval $varval
> -+done
> -+test x"$REAL_CHILD" !=3D x"" \
> -+&& test x"$REAL_CHILD" =3D x"$PARENTS_IDEA_OF_CHILD"
> -+echo "Bug detected: $?"
> -+}
> -diff -urpN busybox-1.17.1/shell/hush.c busybox-1.17.1-shell/shell/hush.c
> ---- busybox-1.17.1/shell/hush.c =A0 =A0 =A0 =A02010-07-25 00:12:43.00000=
0000 +0200
> -+++ busybox-1.17.1-shell/shell/hush.c =A02010-07-25 13:09:32.000000000 +=
0200
> -@@ -3901,8 +3901,6 @@ static void insert_bg_job(struct pipe *p
> -
> - =A0 =A0 =A0 if (G_interactive_fd)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf("[%d] %d %s\n", job->jobid, job->cmd=
s[0].pid, job->cmdtext);
> -- =A0 =A0 =A0/* Last command's pid goes to $! */
> -- =A0 =A0 =A0G.last_bg_pid =3D job->cmds[job->num_cmds - 1].pid;
> - =A0 =A0 =A0 G.last_jobid =3D job->jobid;
> - }
> -
> -@@ -4825,6 +4823,8 @@ static int run_list(struct pipe *pi)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (G.run_l=
ist_level =3D=3D 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 insert_bg_job(pi);
> - #endif
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Last com=
mand's pid goes to $! */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0G.last_bg_p=
id =3D pi->cmds[pi->num_cmds - 1].pid;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 G.last_exit=
code =3D rcode =3D EXIT_SUCCESS;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug_print=
f_exec(": cmd&: exitcode EXIT_SUCCESS\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> -diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.right busybo=
x-1.17.1-shell/shell/hush_test/hush-trap/signal7.right
> ---- busybox-1.17.1/shell/hush_test/hush-trap/signal7.right =A0 =A0 1970-=
01-01 01:00:00.000000000 +0100
> -+++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.right =A0 =A0=
 =A0 2010-07-25 13:09:32.000000000 +0200
> -@@ -0,0 +1 @@
> -+Bug detected: 0
> -diff -urpN busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests busybo=
x-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests
> ---- busybox-1.17.1/shell/hush_test/hush-trap/signal7.tests =A0 =A0 1970-=
01-01 01:00:00.000000000 +0100
> -+++ busybox-1.17.1-shell/shell/hush_test/hush-trap/signal7.tests =A0 =A0=
 =A0 2010-07-25 13:09:32.000000000 +0200
> -@@ -0,0 +1,18 @@
> -+bug() {
> -+ =A0 =A0 =A0trap : exit
> -+ =A0 =A0 =A0# Bug was causing sh to be run in subshell,
> -+ =A0 =A0 =A0# as if this line is replaced with (sh -c ...; exit $?) &
> -+ =A0 =A0 =A0# here:
> -+ =A0 =A0 =A0sh -c 'echo REAL_CHILD=3D$$' &
> -+ =A0 =A0 =A0echo PARENTS_IDEA_OF_CHILD=3D$!
> -+ =A0 =A0 =A0wait =A0# make sure bkgd shell completes
> -+}
> -+
> -+bug | {
> -+while read varval; do
> -+ =A0 =A0 =A0eval $varval
> -+done
> -+test x"$REAL_CHILD" !=3D x"" \
> -+&& test x"$REAL_CHILD" =3D x"$PARENTS_IDEA_OF_CHILD"
> -+echo "Bug detected: $?"
> -+}
> -diff -urpN busybox-1.17.1/shell/shell_common.c busybox-1.17.1-shell/shel=
l/shell_common.c
> ---- busybox-1.17.1/shell/shell_common.c =A0 =A0 =A0 =A02010-07-06 04:25:=
54.000000000 +0200
> -+++ busybox-1.17.1-shell/shell/shell_common.c =A02010-07-27 08:41:43.000=
000000 +0200
> -@@ -428,9 +428,14 @@ shell_builtin_ulimit(char **argv)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 val <<=3D l->factor_shift;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 }
> - //bb_error_msg("opt %c val_str:'%s' val:%lld", opt_char, val_str, (long=
 long)val);
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0/* from man bash: "If neither -H nor -S
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 * is specified, both the soft and hard
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 * limits are set. */
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if (!opts)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0opts =3D OPT_hard + OPT_soft;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 if (opts & OPT_hard)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 limit.rlim_max =3D val;
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if ((opts & OPT_soft) || opts =3D=3D 0)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if (opts & OPT_soft)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 limit.rlim_cur =3D val;
> - //bb_error_msg("setrlimit(%d, %lld, %lld)", l->cmd, (long long)limit.rl=
im_cur, (long long)limit.rlim_max);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 if (setrlimit(l->cmd, &limit) < 0) {
> diff --git a/recipes/busybox/busybox-1.17.1/defconfig b/recipes/busybox/b=
usybox-1.17.1/defconfig
> deleted file mode 100644
> index 5a6870c..0000000
> --- a/recipes/busybox/busybox-1.17.1/defconfig
> +++ /dev/null
> @@ -1,873 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Busybox version: 1.13.2
> -# Sun Feb =A08 17:22:39 2009
> -#
> -CONFIG_HAVE_DOT_CONFIG=3Dy
> -
> -#
> -# Busybox Settings
> -#
> -
> -#
> -# General Configuration
> -#
> -# CONFIG_DESKTOP is not set
> -# CONFIG_EXTRA_COMPAT is not set
> -CONFIG_FEATURE_ASSUME_UNICODE=3Dy
> -CONFIG_FEATURE_BUFFERS_USE_MALLOC=3Dy
> -# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
> -# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> -CONFIG_SHOW_USAGE=3Dy
> -CONFIG_FEATURE_VERBOSE_USAGE=3Dy
> -CONFIG_FEATURE_COMPRESS_USAGE=3Dy
> -# CONFIG_FEATURE_INSTALLER is not set
> -CONFIG_LOCALE_SUPPORT=3Dy
> -CONFIG_GETOPT_LONG=3Dy
> -CONFIG_FEATURE_DEVPTS=3Dy
> -# CONFIG_FEATURE_CLEAN_UP is not set
> -CONFIG_FEATURE_PIDFILE=3Dy
> -CONFIG_FEATURE_SUID=3Dy
> -CONFIG_FEATURE_SUID_CONFIG=3Dy
> -CONFIG_FEATURE_SUID_CONFIG_QUIET=3Dy
> -# CONFIG_SELINUX is not set
> -# CONFIG_FEATURE_PREFER_APPLETS is not set
> -CONFIG_BUSYBOX_EXEC_PATH=3D"/proc/self/exe"
> -CONFIG_FEATURE_SYSLOG=3Dy
> -CONFIG_FEATURE_HAVE_RPC=3Dy
> -
> -#
> -# Build Options
> -#
> -# CONFIG_STATIC is not set
> -# CONFIG_PIE is not set
> -# CONFIG_NOMMU is not set
> -# CONFIG_BUILD_LIBBUSYBOX is not set
> -# CONFIG_FEATURE_INDIVIDUAL is not set
> -# CONFIG_FEATURE_SHARED_BUSYBOX is not set
> -CONFIG_LFS=3Dy
> -CONFIG_CROSS_COMPILER_PREFIX=3D""
> -
> -#
> -# Debugging Options
> -#
> -# CONFIG_DEBUG is not set
> -# CONFIG_DEBUG_PESSIMIZE is not set
> -# CONFIG_WERROR is not set
> -CONFIG_NO_DEBUG_LIB=3Dy
> -# CONFIG_DMALLOC is not set
> -# CONFIG_EFENCE is not set
> -# CONFIG_INCLUDE_SUSv2 is not set
> -
> -#
> -# Installation Options
> -#
> -# CONFIG_INSTALL_NO_USR is not set
> -CONFIG_INSTALL_APPLET_SYMLINKS=3Dy
> -# CONFIG_INSTALL_APPLET_HARDLINKS is not set
> -# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
> -# CONFIG_INSTALL_APPLET_DONT is not set
> -# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
> -# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
> -# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
> -CONFIG_PREFIX=3D"./_install"
> -
> -#
> -# Busybox Library Tuning
> -#
> -CONFIG_PASSWORD_MINLEN=3D6
> -CONFIG_MD5_SIZE_VS_SPEED=3D2
> -CONFIG_FEATURE_FAST_TOP=3Dy
> -# CONFIG_FEATURE_ETC_NETWORKS is not set
> -CONFIG_FEATURE_EDITING=3Dy
> -CONFIG_FEATURE_EDITING_MAX_LEN=3D1024
> -# CONFIG_FEATURE_EDITING_VI is not set
> -CONFIG_FEATURE_EDITING_HISTORY=3D64
> -CONFIG_FEATURE_EDITING_SAVEHISTORY=3Dy
> -CONFIG_FEATURE_TAB_COMPLETION=3Dy
> -CONFIG_FEATURE_USERNAME_COMPLETION=3Dy
> -CONFIG_FEATURE_EDITING_FANCY_PROMPT=3Dy
> -CONFIG_FEATURE_VERBOSE_CP_MESSAGE=3Dy
> -CONFIG_FEATURE_COPYBUF_KB=3D4
> -CONFIG_MONOTONIC_SYSCALL=3Dy
> -CONFIG_IOCTL_HEX2STR_ERROR=3Dy
> -CONFIG_FEATURE_HWIB=3Dy
> -
> -#
> -# Applets
> -#
> -
> -#
> -# Archival Utilities
> -#
> -# CONFIG_FEATURE_SEAMLESS_LZMA is not set
> -CONFIG_FEATURE_SEAMLESS_BZ2=3Dy
> -CONFIG_FEATURE_SEAMLESS_GZ=3Dy
> -CONFIG_FEATURE_SEAMLESS_Z=3Dy
> -CONFIG_AR=3Dy
> -# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
> -CONFIG_BUNZIP2=3Dy
> -# CONFIG_BZIP2 is not set
> -CONFIG_CPIO=3Dy
> -# CONFIG_FEATURE_CPIO_O is not set
> -# CONFIG_DPKG is not set
> -# CONFIG_DPKG_DEB is not set
> -# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
> -CONFIG_GUNZIP=3Dy
> -CONFIG_GZIP=3Dy
> -# CONFIG_RPM2CPIO is not set
> -# CONFIG_RPM is not set
> -CONFIG_TAR=3Dy
> -CONFIG_FEATURE_TAR_CREATE=3Dy
> -CONFIG_FEATURE_TAR_AUTODETECT=3Dy
> -CONFIG_FEATURE_TAR_FROM=3Dy
> -CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=3Dy
> -# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
> -CONFIG_FEATURE_TAR_GNU_EXTENSIONS=3Dy
> -CONFIG_FEATURE_TAR_LONG_OPTIONS=3Dy
> -CONFIG_FEATURE_TAR_UNAME_GNAME=3Dy
> -# CONFIG_UNCOMPRESS is not set
> -# CONFIG_UNLZMA is not set
> -# CONFIG_FEATURE_LZMA_FAST is not set
> -CONFIG_UNZIP=3Dy
> -
> -#
> -# Coreutils
> -#
> -CONFIG_BASENAME=3Dy
> -# CONFIG_CAL is not set
> -CONFIG_CAT=3Dy
> -# CONFIG_CATV is not set
> -CONFIG_CHGRP=3Dy
> -CONFIG_CHMOD=3Dy
> -CONFIG_CHOWN=3Dy
> -CONFIG_CHROOT=3Dy
> -# CONFIG_CKSUM is not set
> -# CONFIG_COMM is not set
> -CONFIG_CP=3Dy
> -CONFIG_CUT=3Dy
> -CONFIG_DATE=3Dy
> -CONFIG_FEATURE_DATE_ISOFMT=3Dy
> -CONFIG_DD=3Dy
> -CONFIG_FEATURE_DD_SIGNAL_HANDLING=3Dy
> -# CONFIG_FEATURE_DD_IBS_OBS is not set
> -CONFIG_DF=3Dy
> -CONFIG_FEATURE_DF_FANCY=3Dy
> -CONFIG_DIRNAME=3Dy
> -# CONFIG_DOS2UNIX is not set
> -# CONFIG_UNIX2DOS is not set
> -CONFIG_DU=3Dy
> -CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=3Dy
> -CONFIG_ECHO=3Dy
> -CONFIG_FEATURE_FANCY_ECHO=3Dy
> -CONFIG_ENV=3Dy
> -CONFIG_FEATURE_ENV_LONG_OPTIONS=3Dy
> -# CONFIG_EXPAND is not set
> -# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
> -CONFIG_EXPR=3Dy
> -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> -CONFIG_FALSE=3Dy
> -# CONFIG_FOLD is not set
> -CONFIG_HEAD=3Dy
> -CONFIG_FEATURE_FANCY_HEAD=3Dy
> -# CONFIG_HOSTID is not set
> -CONFIG_ID=3Dy
> -# CONFIG_INSTALL is not set
> -# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
> -# CONFIG_LENGTH is not set
> -CONFIG_LN=3Dy
> -CONFIG_LOGNAME=3Dy
> -CONFIG_LS=3Dy
> -CONFIG_FEATURE_LS_FILETYPES=3Dy
> -CONFIG_FEATURE_LS_FOLLOWLINKS=3Dy
> -CONFIG_FEATURE_LS_RECURSIVE=3Dy
> -CONFIG_FEATURE_LS_SORTFILES=3Dy
> -CONFIG_FEATURE_LS_TIMESTAMPS=3Dy
> -CONFIG_FEATURE_LS_USERNAME=3Dy
> -CONFIG_FEATURE_LS_COLOR=3Dy
> -# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
> -CONFIG_MD5SUM=3Dy
> -CONFIG_MKDIR=3Dy
> -CONFIG_FEATURE_MKDIR_LONG_OPTIONS=3Dy
> -CONFIG_MKFIFO=3Dy
> -CONFIG_MKNOD=3Dy
> -CONFIG_MV=3Dy
> -CONFIG_FEATURE_MV_LONG_OPTIONS=3Dy
> -CONFIG_NICE=3Dy
> -CONFIG_NOHUP=3Dy
> -CONFIG_OD=3Dy
> -# CONFIG_PRINTENV is not set
> -CONFIG_PRINTF=3Dy
> -CONFIG_PWD=3Dy
> -CONFIG_READLINK=3Dy
> -CONFIG_FEATURE_READLINK_FOLLOW=3Dy
> -CONFIG_REALPATH=3Dy
> -CONFIG_RM=3Dy
> -CONFIG_RMDIR=3Dy
> -CONFIG_FEATURE_RMDIR_LONG_OPTIONS=3Dy
> -CONFIG_SEQ=3Dy
> -# CONFIG_SHA1SUM is not set
> -CONFIG_SLEEP=3Dy
> -CONFIG_FEATURE_FANCY_SLEEP=3Dy
> -CONFIG_FEATURE_FLOAT_SLEEP=3Dy
> -CONFIG_SORT=3Dy
> -CONFIG_FEATURE_SORT_BIG=3Dy
> -# CONFIG_SPLIT is not set
> -# CONFIG_FEATURE_SPLIT_FANCY is not set
> -# CONFIG_STAT is not set
> -# CONFIG_FEATURE_STAT_FORMAT is not set
> -CONFIG_STTY=3Dy
> -# CONFIG_SUM is not set
> -CONFIG_SYNC=3Dy
> -# CONFIG_TAC is not set
> -CONFIG_TAIL=3Dy
> -CONFIG_FEATURE_FANCY_TAIL=3Dy
> -CONFIG_TEE=3Dy
> -CONFIG_FEATURE_TEE_USE_BLOCK_IO=3Dy
> -CONFIG_TEST=3Dy
> -# CONFIG_FEATURE_TEST_64 is not set
> -CONFIG_TOUCH=3Dy
> -CONFIG_TR=3Dy
> -CONFIG_FEATURE_TR_CLASSES=3Dy
> -# CONFIG_FEATURE_TR_EQUIV is not set
> -CONFIG_TRUE=3Dy
> -CONFIG_TTY=3Dy
> -CONFIG_UNAME=3Dy
> -# CONFIG_UNEXPAND is not set
> -# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
> -CONFIG_UNIQ=3Dy
> -CONFIG_USLEEP=3Dy
> -# CONFIG_UUDECODE is not set
> -# CONFIG_UUENCODE is not set
> -CONFIG_WC=3Dy
> -# CONFIG_FEATURE_WC_LARGE is not set
> -CONFIG_WHO=3Dy
> -CONFIG_WHOAMI=3Dy
> -CONFIG_YES=3Dy
> -
> -#
> -# Common options for cp and mv
> -#
> -# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
> -
> -#
> -# Common options for ls, more and telnet
> -#
> -CONFIG_FEATURE_AUTOWIDTH=3Dy
> -
> -#
> -# Common options for df, du, ls
> -#
> -CONFIG_FEATURE_HUMAN_READABLE=3Dy
> -
> -#
> -# Common options for md5sum, sha1sum
> -#
> -CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=3Dy
> -
> -#
> -# Console Utilities
> -#
> -CONFIG_CHVT=3Dy
> -CONFIG_CLEAR=3Dy
> -CONFIG_DEALLOCVT=3Dy
> -CONFIG_DUMPKMAP=3Dy
> -# CONFIG_KBD_MODE is not set
> -CONFIG_LOADFONT=3Dy
> -CONFIG_LOADKMAP=3Dy
> -CONFIG_OPENVT=3Dy
> -CONFIG_RESET=3Dy
> -# CONFIG_RESIZE is not set
> -# CONFIG_FEATURE_RESIZE_PRINT is not set
> -CONFIG_SETCONSOLE=3Dy
> -# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> -CONFIG_SETFONT=3Dy
> -CONFIG_FEATURE_SETFONT_TEXTUAL_MAP=3Dy
> -CONFIG_DEFAULT_SETFONT_DIR=3D""
> -# CONFIG_SETKEYCODES is not set
> -# CONFIG_SETLOGCONS is not set
> -CONFIG_SHOWKEY=3Dy
> -
> -#
> -# Debian Utilities
> -#
> -CONFIG_MKTEMP=3Dy
> -# CONFIG_PIPE_PROGRESS is not set
> -CONFIG_RUN_PARTS=3Dy
> -CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=3Dy
> -CONFIG_FEATURE_RUN_PARTS_FANCY=3Dy
> -CONFIG_START_STOP_DAEMON=3Dy
> -CONFIG_FEATURE_START_STOP_DAEMON_FANCY=3Dy
> -CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=3Dy
> -CONFIG_WHICH=3Dy
> -
> -#
> -# Editors
> -#
> -CONFIG_AWK=3Dy
> -CONFIG_FEATURE_AWK_LIBM=3Dy
> -CONFIG_CMP=3Dy
> -CONFIG_DIFF=3Dy
> -CONFIG_FEATURE_DIFF_BINARY=3Dy
> -CONFIG_FEATURE_DIFF_DIR=3Dy
> -CONFIG_FEATURE_DIFF_MINIMAL=3Dy
> -# CONFIG_ED is not set
> -CONFIG_PATCH=3Dy
> -CONFIG_SED=3Dy
> -CONFIG_VI=3Dy
> -CONFIG_FEATURE_VI_MAX_LEN=3D1024
> -CONFIG_FEATURE_VI_8BIT=3Dy
> -CONFIG_FEATURE_VI_COLON=3Dy
> -CONFIG_FEATURE_VI_YANKMARK=3Dy
> -CONFIG_FEATURE_VI_SEARCH=3Dy
> -CONFIG_FEATURE_VI_USE_SIGNALS=3Dy
> -CONFIG_FEATURE_VI_DOT_CMD=3Dy
> -# CONFIG_FEATURE_VI_READONLY is not set
> -# CONFIG_FEATURE_VI_SETOPTS is not set
> -CONFIG_FEATURE_VI_SET=3Dy
> -CONFIG_FEATURE_VI_WIN_RESIZE=3Dy
> -CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=3Dy
> -CONFIG_FEATURE_ALLOW_EXEC=3Dy
> -
> -#
> -# Finding Utilities
> -#
> -CONFIG_FIND=3Dy
> -CONFIG_FEATURE_FIND_PRINT0=3Dy
> -CONFIG_FEATURE_FIND_MTIME=3Dy
> -CONFIG_FEATURE_FIND_MMIN=3Dy
> -CONFIG_FEATURE_FIND_PERM=3Dy
> -CONFIG_FEATURE_FIND_TYPE=3Dy
> -CONFIG_FEATURE_FIND_XDEV=3Dy
> -CONFIG_FEATURE_FIND_MAXDEPTH=3Dy
> -CONFIG_FEATURE_FIND_NEWER=3Dy
> -CONFIG_FEATURE_FIND_INUM=3Dy
> -CONFIG_FEATURE_FIND_EXEC=3Dy
> -CONFIG_FEATURE_FIND_USER=3Dy
> -CONFIG_FEATURE_FIND_GROUP=3Dy
> -CONFIG_FEATURE_FIND_NOT=3Dy
> -CONFIG_FEATURE_FIND_DEPTH=3Dy
> -CONFIG_FEATURE_FIND_PAREN=3Dy
> -CONFIG_FEATURE_FIND_SIZE=3Dy
> -CONFIG_FEATURE_FIND_PRUNE=3Dy
> -CONFIG_FEATURE_FIND_DELETE=3Dy
> -CONFIG_FEATURE_FIND_PATH=3Dy
> -CONFIG_FEATURE_FIND_REGEX=3Dy
> -# CONFIG_FEATURE_FIND_CONTEXT is not set
> -CONFIG_GREP=3Dy
> -CONFIG_FEATURE_GREP_EGREP_ALIAS=3Dy
> -CONFIG_FEATURE_GREP_FGREP_ALIAS=3Dy
> -CONFIG_FEATURE_GREP_CONTEXT=3Dy
> -CONFIG_XARGS=3Dy
> -# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
> -CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=3Dy
> -CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=3Dy
> -CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy
> -
> -#
> -# Init Utilities
> -#
> -CONFIG_INIT=3Dy
> -CONFIG_FEATURE_USE_INITTAB=3Dy
> -CONFIG_FEATURE_KILL_REMOVED=3Dy
> -CONFIG_FEATURE_KILL_DELAY=3D0
> -# CONFIG_FEATURE_INIT_SCTTY is not set
> -# CONFIG_FEATURE_INIT_SYSLOG is not set
> -# CONFIG_FEATURE_EXTRA_QUIET is not set
> -# CONFIG_FEATURE_INIT_COREDUMPS is not set
> -CONFIG_FEATURE_INITRD=3Dy
> -CONFIG_HALT=3Dy
> -# CONFIG_MESG is not set
> -
> -#
> -# Login/Password Management Utilities
> -#
> -CONFIG_FEATURE_SHADOWPASSWDS=3Dy
> -# CONFIG_USE_BB_PWD_GRP is not set
> -# CONFIG_USE_BB_SHADOW is not set
> -CONFIG_USE_BB_CRYPT=3Dy
> -CONFIG_ADDGROUP=3Dy
> -CONFIG_FEATURE_ADDUSER_TO_GROUP=3Dy
> -CONFIG_DELGROUP=3Dy
> -CONFIG_FEATURE_DEL_USER_FROM_GROUP=3Dy
> -CONFIG_FEATURE_CHECK_NAMES=3Dy
> -CONFIG_ADDUSER=3Dy
> -CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=3Dy
> -CONFIG_DELUSER=3Dy
> -CONFIG_GETTY=3Dy
> -CONFIG_FEATURE_UTMP=3Dy
> -CONFIG_FEATURE_WTMP=3Dy
> -CONFIG_LOGIN=3Dy
> -# CONFIG_PAM is not set
> -CONFIG_LOGIN_SCRIPTS=3Dy
> -CONFIG_FEATURE_NOLOGIN=3Dy
> -CONFIG_FEATURE_SECURETTY=3Dy
> -CONFIG_PASSWD=3Dy
> -CONFIG_FEATURE_PASSWD_WEAK_CHECK=3Dy
> -CONFIG_CRYPTPW=3Dy
> -CONFIG_CHPASSWD=3Dy
> -CONFIG_SU=3Dy
> -CONFIG_FEATURE_SU_SYSLOG=3Dy
> -CONFIG_FEATURE_SU_CHECKS_SHELLS=3Dy
> -CONFIG_SULOGIN=3Dy
> -CONFIG_VLOCK=3Dy
> -
> -#
> -# Linux Ext2 FS Progs
> -#
> -CONFIG_CHATTR=3Dy
> -CONFIG_FSCK=3Dy
> -# CONFIG_LSATTR is not set
> -
> -#
> -# Linux Module Utilities
> -#
> -CONFIG_DEFAULT_MODULES_DIR=3D"/lib/modules"
> -CONFIG_DEFAULT_DEPMOD_FILE=3D"modules.dep"
> -# CONFIG_MODPROBE_SMALL is not set
> -# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
> -# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
> -CONFIG_INSMOD=3Dy
> -CONFIG_RMMOD=3Dy
> -CONFIG_LSMOD=3Dy
> -CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=3Dy
> -CONFIG_MODPROBE=3Dy
> -CONFIG_FEATURE_MODPROBE_BLACKLIST=3Dy
> -# CONFIG_DEPMOD is not set
> -
> -#
> -# Options common to multiple modutils
> -#
> -# CONFIG_FEATURE_2_4_MODULES is not set
> -# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
> -# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
> -# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
> -# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
> -# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
> -CONFIG_FEATURE_CHECK_TAINTED_MODULE=3Dy
> -CONFIG_FEATURE_MODUTILS_ALIAS=3Dy
> -CONFIG_FEATURE_MODUTILS_SYMBOLS=3Dy
> -
> -#
> -# Linux System Utilities
> -#
> -CONFIG_BLKID=3Dy
> -CONFIG_DMESG=3Dy
> -CONFIG_FEATURE_DMESG_PRETTY=3Dy
> -CONFIG_FBSET=3Dy
> -CONFIG_FEATURE_FBSET_FANCY=3Dy
> -CONFIG_FEATURE_FBSET_READMODE=3Dy
> -# CONFIG_FDFLUSH is not set
> -# CONFIG_FDFORMAT is not set
> -CONFIG_FDISK=3Dy
> -CONFIG_FDISK_SUPPORT_LARGE_DISKS=3Dy
> -CONFIG_FEATURE_FDISK_WRITABLE=3Dy
> -# CONFIG_FEATURE_AIX_LABEL is not set
> -# CONFIG_FEATURE_SGI_LABEL is not set
> -# CONFIG_FEATURE_SUN_LABEL is not set
> -CONFIG_FEATURE_OSF_LABEL=3Dy
> -CONFIG_FEATURE_FDISK_ADVANCED=3Dy
> -# CONFIG_FINDFS is not set
> -CONFIG_FREERAMDISK=3Dy
> -CONFIG_FSCK_MINIX=3Dy
> -CONFIG_MKFS_MINIX=3Dy
> -
> -#
> -# Minix filesystem support
> -#
> -CONFIG_FEATURE_MINIX2=3Dy
> -CONFIG_GETOPT=3Dy
> -CONFIG_HEXDUMP=3Dy
> -# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
> -# CONFIG_HD is not set
> -CONFIG_HWCLOCK=3Dy
> -CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=3Dy
> -CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=3Dy
> -# CONFIG_IPCRM is not set
> -# CONFIG_IPCS is not set
> -CONFIG_LOSETUP=3Dy
> -CONFIG_MDEV=3Dy
> -CONFIG_FEATURE_MDEV_CONF=3Dy
> -CONFIG_FEATURE_MDEV_RENAME=3Dy
> -CONFIG_FEATURE_MDEV_RENAME_REGEXP=3Dy
> -CONFIG_FEATURE_MDEV_EXEC=3Dy
> -CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=3Dy
> -CONFIG_MKSWAP=3Dy
> -# CONFIG_FEATURE_MKSWAP_V0 is not set
> -CONFIG_MORE=3Dy
> -CONFIG_FEATURE_USE_TERMIOS=3Dy
> -CONFIG_VOLUMEID=3Dy
> -# CONFIG_FEATURE_VOLUMEID_EXT is not set
> -# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
> -# CONFIG_FEATURE_VOLUMEID_FAT is not set
> -# CONFIG_FEATURE_VOLUMEID_HFS is not set
> -# CONFIG_FEATURE_VOLUMEID_JFS is not set
> -# CONFIG_FEATURE_VOLUMEID_XFS is not set
> -# CONFIG_FEATURE_VOLUMEID_NTFS is not set
> -# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
> -# CONFIG_FEATURE_VOLUMEID_UDF is not set
> -# CONFIG_FEATURE_VOLUMEID_LUKS is not set
> -# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
> -# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
> -# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
> -# CONFIG_FEATURE_VOLUMEID_SYSV is not set
> -# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
> -# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
> -CONFIG_MOUNT=3Dy
> -# CONFIG_FEATURE_MOUNT_FAKE is not set
> -CONFIG_FEATURE_MOUNT_VERBOSE=3Dy
> -CONFIG_FEATURE_MOUNT_HELPERS=3Dy
> -CONFIG_FEATURE_MOUNT_LABEL=3Dy
> -CONFIG_FEATURE_MOUNT_NFS=3Dy
> -CONFIG_FEATURE_MOUNT_CIFS=3Dy
> -CONFIG_FEATURE_MOUNT_FLAGS=3Dy
> -CONFIG_FEATURE_MOUNT_FSTAB=3Dy
> -CONFIG_PIVOT_ROOT=3Dy
> -CONFIG_RDATE=3Dy
> -CONFIG_RDEV=3Dy
> -CONFIG_READPROFILE=3Dy
> -CONFIG_RTCWAKE=3Dy
> -# CONFIG_SCRIPT is not set
> -# CONFIG_SETARCH is not set
> -CONFIG_SWAPONOFF=3Dy
> -# CONFIG_FEATURE_SWAPON_PRI is not set
> -CONFIG_SWITCH_ROOT=3Dy
> -CONFIG_UMOUNT=3Dy
> -CONFIG_FEATURE_UMOUNT_ALL=3Dy
> -
> -#
> -# Common options for mount/umount
> -#
> -CONFIG_FEATURE_MOUNT_LOOP=3Dy
> -# CONFIG_FEATURE_MTAB_SUPPORT is not set
> -
> -#
> -# Miscellaneous Utilities
> -#
> -# CONFIG_ADJTIMEX is not set
> -# CONFIG_BBCONFIG is not set
> -# CONFIG_CHAT is not set
> -# CONFIG_FEATURE_CHAT_NOFAIL is not set
> -# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
> -# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
> -# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
> -# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
> -# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
> -# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
> -# CONFIG_CHRT is not set
> -# CONFIG_CROND is not set
> -# CONFIG_FEATURE_CROND_D is not set
> -# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
> -# CONFIG_CRONTAB is not set
> -CONFIG_DC=3Dy
> -CONFIG_FEATURE_DC_LIBM=3Dy
> -# CONFIG_DEVFSD is not set
> -# CONFIG_DEVFSD_MODLOAD is not set
> -# CONFIG_DEVFSD_FG_NP is not set
> -# CONFIG_DEVFSD_VERBOSE is not set
> -# CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> -# CONFIG_EJECT is not set
> -# CONFIG_FEATURE_EJECT_SCSI is not set
> -CONFIG_FBSPLASH=3Dy
> -# CONFIG_INOTIFYD is not set
> -CONFIG_LAST=3Dy
> -CONFIG_FEATURE_LAST_SMALL=3Dy
> -# CONFIG_FEATURE_LAST_FANCY is not set
> -CONFIG_LESS=3Dy
> -CONFIG_FEATURE_LESS_MAXLINES=3D9999999
> -CONFIG_FEATURE_LESS_BRACKETS=3Dy
> -CONFIG_FEATURE_LESS_FLAGS=3Dy
> -# CONFIG_FEATURE_LESS_DASHCMD is not set
> -# CONFIG_FEATURE_LESS_MARKS is not set
> -# CONFIG_FEATURE_LESS_REGEXP is not set
> -# CONFIG_FEATURE_LESS_LINENUMS is not set
> -# CONFIG_FEATURE_LESS_WINCH is not set
> -# CONFIG_HDPARM is not set
> -# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
> -# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> -CONFIG_MAKEDEVS=3Dy
> -# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
> -CONFIG_FEATURE_MAKEDEVS_TABLE=3Dy
> -# CONFIG_MAN is not set
> -CONFIG_MICROCOM=3Dy
> -# CONFIG_MOUNTPOINT is not set
> -# CONFIG_MT is not set
> -# CONFIG_RAIDAUTORUN is not set
> -CONFIG_READAHEAD=3Dy
> -# CONFIG_RUNLEVEL is not set
> -# CONFIG_RX is not set
> -# CONFIG_SETSID is not set
> -CONFIG_STRINGS=3Dy
> -# CONFIG_TASKSET is not set
> -# CONFIG_FEATURE_TASKSET_FANCY is not set
> -CONFIG_TIME=3Dy
> -# CONFIG_TTYSIZE is not set
> -# CONFIG_WATCHDOG is not set
> -
> -#
> -# Networking Utilities
> -#
> -CONFIG_FEATURE_IPV6=3Dy
> -CONFIG_FEATURE_PREFER_IPV4_ADDRESS=3Dy
> -# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> -# CONFIG_ARP is not set
> -# CONFIG_ARPING is not set
> -# CONFIG_BRCTL is not set
> -# CONFIG_FEATURE_BRCTL_FANCY is not set
> -# CONFIG_FEATURE_BRCTL_SHOW is not set
> -# CONFIG_DNSD is not set
> -# CONFIG_ETHER_WAKE is not set
> -# CONFIG_FAKEIDENTD is not set
> -# CONFIG_FTPGET is not set
> -# CONFIG_FTPPUT is not set
> -# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
> -CONFIG_HOSTNAME=3Dy
> -CONFIG_HTTPD=3Dy
> -CONFIG_FEATURE_HTTPD_RANGES=3Dy
> -CONFIG_FEATURE_HTTPD_USE_SENDFILE=3Dy
> -CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP=3Dy
> -CONFIG_FEATURE_HTTPD_SETUID=3Dy
> -CONFIG_FEATURE_HTTPD_BASIC_AUTH=3Dy
> -CONFIG_FEATURE_HTTPD_AUTH_MD5=3Dy
> -CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES=3Dy
> -CONFIG_FEATURE_HTTPD_CGI=3Dy
> -CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=3Dy
> -CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=3Dy
> -CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=3Dy
> -CONFIG_FEATURE_HTTPD_ERROR_PAGES=3Dy
> -CONFIG_FEATURE_HTTPD_PROXY=3Dy
> -CONFIG_IFCONFIG=3Dy
> -CONFIG_FEATURE_IFCONFIG_STATUS=3Dy
> -# CONFIG_FEATURE_IFCONFIG_SLIP is not set
> -# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
> -CONFIG_FEATURE_IFCONFIG_HW=3Dy
> -CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=3Dy
> -# CONFIG_IFENSLAVE is not set
> -CONFIG_IFUPDOWN=3Dy
> -CONFIG_IFUPDOWN_IFSTATE_PATH=3D"/var/run/ifstate"
> -# CONFIG_FEATURE_IFUPDOWN_IP is not set
> -# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
> -CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=3Dy
> -CONFIG_FEATURE_IFUPDOWN_IPV4=3Dy
> -CONFIG_FEATURE_IFUPDOWN_IPV6=3Dy
> -CONFIG_FEATURE_IFUPDOWN_MAPPING=3Dy
> -# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
> -# CONFIG_INETD is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
> -# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
> -# CONFIG_FEATURE_INETD_RPC is not set
> -CONFIG_IP=3Dy
> -CONFIG_FEATURE_IP_ADDRESS=3Dy
> -CONFIG_FEATURE_IP_LINK=3Dy
> -CONFIG_FEATURE_IP_ROUTE=3Dy
> -CONFIG_FEATURE_IP_TUNNEL=3Dy
> -# CONFIG_FEATURE_IP_RULE is not set
> -# CONFIG_FEATURE_IP_SHORT_FORMS is not set
> -# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
> -# CONFIG_IPADDR is not set
> -# CONFIG_IPLINK is not set
> -# CONFIG_IPROUTE is not set
> -# CONFIG_IPTUNNEL is not set
> -# CONFIG_IPRULE is not set
> -# CONFIG_IPCALC is not set
> -# CONFIG_FEATURE_IPCALC_FANCY is not set
> -# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> -# CONFIG_NAMEIF is not set
> -# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
> -CONFIG_NC=3Dy
> -CONFIG_NC_SERVER=3Dy
> -CONFIG_NC_EXTRA=3Dy
> -CONFIG_NETSTAT=3Dy
> -CONFIG_FEATURE_NETSTAT_WIDE=3Dy
> -CONFIG_FEATURE_NETSTAT_PRG=3Dy
> -CONFIG_NSLOOKUP=3Dy
> -CONFIG_PING=3Dy
> -CONFIG_PING6=3Dy
> -CONFIG_FEATURE_FANCY_PING=3Dy
> -# CONFIG_PSCAN is not set
> -CONFIG_ROUTE=3Dy
> -# CONFIG_SLATTACH is not set
> -CONFIG_TELNET=3Dy
> -# CONFIG_FEATURE_TELNET_TTYPE is not set
> -CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy
> -CONFIG_TELNETD=3Dy
> -# CONFIG_FEATURE_TELNETD_STANDALONE is not set
> -CONFIG_TFTP=3Dy
> -# CONFIG_TFTPD is not set
> -CONFIG_FEATURE_TFTP_GET=3Dy
> -CONFIG_FEATURE_TFTP_PUT=3Dy
> -# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
> -# CONFIG_TFTP_DEBUG is not set
> -CONFIG_TRACEROUTE=3Dy
> -CONFIG_FEATURE_TRACEROUTE_VERBOSE=3Dy
> -CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=3Dy
> -CONFIG_FEATURE_TRACEROUTE_USE_ICMP=3Dy
> -CONFIG_UDHCPD=3Dy
> -CONFIG_DHCPRELAY=3Dy
> -CONFIG_DUMPLEASES=3Dy
> -# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
> -CONFIG_DHCPD_LEASES_FILE=3D"/var/lib/misc/udhcpd.leases"
> -CONFIG_UDHCPC=3Dy
> -CONFIG_FEATURE_UDHCPC_ARPING=3Dy
> -# CONFIG_FEATURE_UDHCP_PORT is not set
> -# CONFIG_UDHCP_DEBUG is not set
> -# CONFIG_FEATURE_UDHCP_RFC3397 is not set
> -CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"@DATADIR@/udhcpc/default.script"
> -CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
> -# CONFIG_VCONFIG is not set
> -CONFIG_WGET=3Dy
> -CONFIG_FEATURE_WGET_STATUSBAR=3Dy
> -CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> -CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> -# CONFIG_ZCIP is not set
> -# CONFIG_TCPSVD is not set
> -# CONFIG_UDPSVD is not set
> -
> -#
> -# Print Utilities
> -#
> -# CONFIG_LPD is not set
> -# CONFIG_LPR is not set
> -# CONFIG_LPQ is not set
> -
> -#
> -# Mail Utilities
> -#
> -# CONFIG_MAKEMIME is not set
> -CONFIG_FEATURE_MIME_CHARSET=3D""
> -# CONFIG_POPMAILDIR is not set
> -# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
> -# CONFIG_REFORMIME is not set
> -# CONFIG_FEATURE_REFORMIME_COMPAT is not set
> -# CONFIG_SENDMAIL is not set
> -# CONFIG_FEATURE_SENDMAIL_MAILX is not set
> -# CONFIG_FEATURE_SENDMAIL_MAILXX is not set
> -
> -#
> -# Process Utilities
> -#
> -CONFIG_FREE=3Dy
> -CONFIG_FUSER=3Dy
> -CONFIG_KILL=3Dy
> -CONFIG_KILLALL=3Dy
> -# CONFIG_KILLALL5 is not set
> -# CONFIG_NMETER is not set
> -# CONFIG_PGREP is not set
> -CONFIG_PIDOF=3Dy
> -CONFIG_FEATURE_PIDOF_SINGLE=3Dy
> -CONFIG_FEATURE_PIDOF_OMIT=3Dy
> -# CONFIG_PKILL is not set
> -CONFIG_PS=3Dy
> -CONFIG_FEATURE_PS_WIDE=3Dy
> -# CONFIG_FEATURE_PS_TIME is not set
> -# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
> -CONFIG_RENICE=3Dy
> -CONFIG_BB_SYSCTL=3Dy
> -CONFIG_TOP=3Dy
> -CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=3Dy
> -CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=3Dy
> -# CONFIG_FEATURE_TOP_SMP_CPU is not set
> -# CONFIG_FEATURE_TOP_DECIMALS is not set
> -# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
> -# CONFIG_FEATURE_TOPMEM is not set
> -CONFIG_UPTIME=3Dy
> -CONFIG_WATCH=3Dy
> -
> -#
> -# Runit Utilities
> -#
> -# CONFIG_RUNSV is not set
> -# CONFIG_RUNSVDIR is not set
> -# CONFIG_FEATURE_RUNSVDIR_LOG is not set
> -# CONFIG_SV is not set
> -CONFIG_SV_DEFAULT_SERVICE_DIR=3D""
> -# CONFIG_SVLOGD is not set
> -# CONFIG_CHPST is not set
> -# CONFIG_SETUIDGID is not set
> -# CONFIG_ENVUIDGID is not set
> -# CONFIG_ENVDIR is not set
> -# CONFIG_SOFTLIMIT is not set
> -# CONFIG_CHCON is not set
> -# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
> -# CONFIG_GETENFORCE is not set
> -# CONFIG_GETSEBOOL is not set
> -# CONFIG_LOAD_POLICY is not set
> -# CONFIG_MATCHPATHCON is not set
> -# CONFIG_RESTORECON is not set
> -# CONFIG_RUNCON is not set
> -# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
> -# CONFIG_SELINUXENABLED is not set
> -# CONFIG_SETENFORCE is not set
> -# CONFIG_SETFILES is not set
> -# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
> -# CONFIG_SETSEBOOL is not set
> -# CONFIG_SESTATUS is not set
> -
> -#
> -# Shells
> -#
> -CONFIG_FEATURE_SH_IS_ASH=3Dy
> -# CONFIG_FEATURE_SH_IS_HUSH is not set
> -# CONFIG_FEATURE_SH_IS_MSH is not set
> -# CONFIG_FEATURE_SH_IS_NONE is not set
> -CONFIG_ASH=3Dy
> -
> -#
> -# Ash Shell Options
> -#
> -CONFIG_ASH_BASH_COMPAT=3Dy
> -CONFIG_ASH_JOB_CONTROL=3Dy
> -CONFIG_ASH_READ_NCHARS=3Dy
> -CONFIG_ASH_READ_TIMEOUT=3Dy
> -CONFIG_ASH_ALIAS=3Dy
> -CONFIG_ASH_MATH_SUPPORT=3Dy
> -# CONFIG_ASH_MATH_SUPPORT_64 is not set
> -CONFIG_ASH_GETOPTS=3Dy
> -CONFIG_ASH_BUILTIN_ECHO=3Dy
> -CONFIG_ASH_BUILTIN_PRINTF=3Dy
> -CONFIG_ASH_BUILTIN_TEST=3Dy
> -# CONFIG_ASH_CMDCMD is not set
> -# CONFIG_ASH_MAIL is not set
> -# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
> -# CONFIG_ASH_RANDOM_SUPPORT is not set
> -CONFIG_ASH_EXPAND_PRMT=3Dy
> -# CONFIG_HUSH is not set
> -# CONFIG_HUSH_HELP is not set
> -# CONFIG_HUSH_INTERACTIVE is not set
> -# CONFIG_HUSH_JOB is not set
> -# CONFIG_HUSH_TICK is not set
> -# CONFIG_HUSH_IF is not set
> -# CONFIG_HUSH_LOOPS is not set
> -# CONFIG_HUSH_CASE is not set
> -# CONFIG_LASH is not set
> -# CONFIG_MSH is not set
> -
> -#
> -# Bourne Shell Options
> -#
> -CONFIG_FEATURE_SH_EXTRA_QUIET=3Dy
> -# CONFIG_FEATURE_SH_STANDALONE is not set
> -# CONFIG_FEATURE_SH_NOFORK is not set
> -# CONFIG_CTTYHACK is not set
> -
> -#
> -# System Logging Utilities
> -#
> -CONFIG_SYSLOGD=3Dy
> -CONFIG_FEATURE_ROTATE_LOGFILE=3Dy
> -CONFIG_FEATURE_REMOTE_LOG=3Dy
> -CONFIG_FEATURE_SYSLOGD_DUP=3Dy
> -CONFIG_FEATURE_IPC_SYSLOG=3Dy
> -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D16
> -CONFIG_LOGREAD=3Dy
> -CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
> -CONFIG_KLOGD=3Dy
> -CONFIG_LOGGER=3Dy
> diff --git a/recipes/busybox/busybox-1.17.1/fdisk_nios2.patch b/recipes/b=
usybox/busybox-1.17.1/fdisk_nios2.patch
> deleted file mode 100644
> index 648e68e..0000000
> --- a/recipes/busybox/busybox-1.17.1/fdisk_nios2.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: busybox-1.15.3/util-linux/fdisk_osf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.15.3.orig/util-linux/fdisk_osf.c
> -+++ busybox-1.15.3/util-linux/fdisk_osf.c
> -@@ -44,7 +44,7 @@
> - #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
> -
> - #if defined(i386) || defined(__sparc__) || defined(__arm__) \
> -- || defined(__m68k__) || defined(__mips__) || defined(__s390__) \
> -+ || defined(__m68k__) || defined(__mips__) || defined(__nios2__) \
> - =A0|| defined(__s390__) || defined(__s390x__) \
> - =A0|| defined(__sh__) || defined(__x86_64__) || defined(__avr32__)
> - # define BSD_LABELSECTOR =A0 1
> diff --git a/recipes/busybox/busybox-1.17.1/get_header_tar.patch b/recipe=
s/busybox/busybox-1.17.1/get_header_tar.patch
> deleted file mode 100644
> index 0121cd1..0000000
> --- a/recipes/busybox/busybox-1.17.1/get_header_tar.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- busybox-1.13.2/archival/libunarchive/get_header_tar.c.orig 2008-11-0=
9 18:28:02.000000000 +0100
> -+++ busybox-1.13.2/archival/libunarchive/get_header_tar.c =A0 =A0 =A0200=
9-02-11 22:34:52.000000000 +0100
> -@@ -252,6 +252,8 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file_header->name =3D conca=
t_path_file(tar.prefix, tar.name);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file_header->name =3D xstrd=
up(tar.name);
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (strlen(file_header->name) > 100)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file_header->name[100] =3D =
0;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Set bits 12-15 of the files mode */
> diff --git a/recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch b/re=
cipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch
> deleted file mode 100644
> index 3b975b6..0000000
> --- a/recipes/busybox/busybox-1.17.1/udhcpc-fix-nfsroot.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -Index: busybox-1.15.1/examples/udhcp/simple.script
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.15.1.orig/examples/udhcp/simple.script =A0 2009-09-16 22:5=
2:09.000000000 +0200
> -+++ busybox-1.15.1/examples/udhcp/simple.script =A0 =A0 =A0 =A02009-09-1=
6 22:57:11.424608476 +0200
> -@@ -10,10 +10,17 @@ NETMASK=3D""
> - BROADCAST=3D"broadcast +"
> - [ -n "$broadcast" ] && BROADCAST=3D"broadcast $broadcast"
> -
> -+# return 0 if root is mounted on a network filesystem
> -+root_is_nfs() {
> -+ =A0 =A0 =A0grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/m=
ounts
> -+}
> -+
> - case "$1" in
> - =A0 =A0 =A0 deconfig)
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if ! root_is_nfs ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Setting IP address 0.0.0.0 on $interf=
ace"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0ifconfig $interface 0.0.0.0
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ifconfig $interface 0.0.0.0
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> -
> - =A0 =A0 =A0 renew|bound)
> -@@ -21,15 +28,18 @@ case "$1" in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ifconfig $interface $ip $NETMASK $BROADCAST
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n "$router" ] ; then
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "Deleting routers"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while route del default gw =
0.0.0.0 dev $interface 2>/dev/null ; do
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ! root_is_nfs ; then
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "Delet=
ing routers"
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while route=
 del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0:
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0done
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 metric=3D0
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for i in $router ; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Addin=
g router $i"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0route add d=
efault gw $i dev $interface metric $((metric++))
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0route add d=
efault gw $i dev $interface metric $((metric++)) 2>/dev/null
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> -
> diff --git a/recipes/busybox/busybox-1.17.1/udhcpscript.patch b/recipes/b=
usybox/busybox-1.17.1/udhcpscript.patch
> deleted file mode 100644
> index 2ffba95..0000000
> --- a/recipes/busybox/busybox-1.17.1/udhcpscript.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: busybox-1.15.1/examples/udhcp/simple.script
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.15.1.orig/examples/udhcp/simple.script =A0 2009-09-12 17:5=
5:36.000000000 +0200
> -+++ busybox-1.15.1/examples/udhcp/simple.script =A0 =A0 =A0 =A02009-09-1=
6 22:51:06.599693412 +0200
> -@@ -22,7 +22,7 @@ case "$1" in
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n "$router" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Deleting routers"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while route del default gw =
0.0.0.0 dev $interface ; do
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while route del default gw =
0.0.0.0 dev $interface 2>/dev/null ; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> -
> diff --git a/recipes/busybox/busybox_1.17.1.bb b/recipes/busybox/busybox_=
1.17.1.bb
> deleted file mode 100644
> index 12976f2..0000000
> --- a/recipes/busybox/busybox_1.17.1.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require busybox_1.1x.inc
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI +=3D "\
> - =A0file://busybox-1.17.1-grep.patch \
> - =A0file://busybox-1.17.1-make.patch \
> - =A0file://busybox-1.17.1-mdev.patch \
> - =A0file://busybox-1.17.1-mktemp.patch \
> - =A0file://busybox-1.17.1-sed.patch \
> - =A0file://busybox-1.17.1-shell.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "c7fe7533b7fc4018b0b49a05ee0ee601"
> -SRC_URI[sha256sum] =3D "bf9177810d7e151b0e662477c33b9afd062570e6298ec46f=
2a8397a6a839d164"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


