Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5C72978096
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 09:13:41 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 77so24747433wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ufYSk5pIrdODwp3/S/mQ/XRarKHX5COulcgtbeD+el4=;
	b=coHI2KxhFFIKEfGCsZQTT0nQ5VuhVPUM9MlgnizqU5cJYCb8nR6xFE4g2PGy0fJXIG
	Qr8jEfaeaBmGU9c/rBB5L0mqiK2LbssBoFafoYtMkTRgSsT/4TvlEVCYGp9yIKhKudB9
	0JOlOwSvush30S1Kl2jFQIVgZzsVblBfDLg9Qpim2+mkwbT1HInWrF09e/ym0I3/JmVm
	BlHjYlxpoMg/xCtc6G1Sna6UtIjWN56UU5P5S/PDTMUu5T/MZ6UJzqNNXnn8EyKR4ONN
	DaxuGrCDbIQ5xR1MMfg4zv0UTKD8vjco0FCz32WLq1UHFjDm553UaXtUDgkrsHVDAX29
	yPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ufYSk5pIrdODwp3/S/mQ/XRarKHX5COulcgtbeD+el4=;
	b=LAvSUbeAjMRVTq4JlxwjA9CBBNdOV4QUL8HPgXrc6r2B5rl8/LQIFmnAU1GMfHCwVy
	x8WFzi12q0Wm0/3rrY+caKDHrftqR5ylZQUdv1l8vk6klIa6N9qfGIQvI1Gs634MP92i
	Hz+zoCCiSO3iV/HK6/w8XweBvjFyiq50C99bvdrRpwpefHn5AbZHAQXB2IdqTd6E+kxi
	NV1REZDplGuzz5A43nOsfGbYAKC3m4XrZ7AD1b/x4pVob89ZO0uyfqsxDLEvWjTkZAhR
	kJkZq5G2vRiqlZcqxVMxsdCyIDhac7ZNwh5ssm8Cw1nzp8JUBoeOqq1jCMbQXNBMyWKa
	lfWw==
X-Gm-Message-State: AKS2vOz2u99Vlhfh24pNMBQ2rh/wLTsslUthjjZsppUn0hyKt2pLBUj9
	wOQcu1V6YzSrOw==
X-Received: by 10.223.132.225 with SMTP id 88mr8353645wrg.80.1498036422674;
	Wed, 21 Jun 2017 02:13:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m143sm16890003wmg.27.2017.06.21.02.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Jun 2017 02:13:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Jun 2017 11:13:52 +0200
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20170621091352.GA3107@jama>
References: <1498030064-12746-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1498030064-12746-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH v2] kexecboot: update recipe to master on github (4c4f127)
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
X-List-Received-Date: Wed, 21 Jun 2017 09:13:42 -0000
X-Groupsio-MsgNum: 67279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 09:27:44AM +0200, Andrea Adami wrote:
> With pending OE patches and a new fix for gcc 7.
> Set PV =3D "0.6+git${SRCREV}" while waiting for a new 0.7 tarball upstrea=
m.

I've updated it to git${SRCPV} when cherry-picking to master-next.

Using SRCREV would make it go backwards every time you change the SRCREV
to newer revision which happens to sort alphabetically as lower version.

> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../files/0001-kexecboot-fix-build-when-S-B.patch  |  61 ----------
>  .../0002-kexecboot-fix-configure-warnings.patch    |  33 -----
>  ...0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch |  97 ---------------
>  ...-workaround-for-absolute-kernel-and-initr.patch | 135 ---------------=
------
>  .../files/0005-rgb.h-fix-build-with-gcc5.patch     |  35 ------
>  .../{kexecboot_0.6.bb =3D> kexecboot_git.bb}         |  19 +--
>  6 files changed, 4 insertions(+), 376 deletions(-)
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-kexec=
boot-fix-build-when-S-B.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0002-kexec=
boot-fix-configure-warnings.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0003-kexec=
boot-do-not-hardcode-MOUNTPOINT.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0004-kexec=
boot.c-workaround-for-absolute-kernel-and-initr.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h=
-fix-build-with-gcc5.patch
>  rename meta-initramfs/recipes-bsp/kexecboot/{kexecboot_0.6.bb =3D> kexec=
boot_git.bb} (81%)
>=20
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fi=
x-build-when-S-B.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-ke=
xecboot-fix-build-when-S-B.patch
> deleted file mode 100644
> index 6d3270f..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fix-build=
-when-S-B.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 8519d61a7097498b0ee93fb8dc8262286825f3e5 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Thu, 1 May 2014 23:58:51 +0200
> -Subject: [PATCH 1/4] kexecboot: fix build when S !=3D B
> -
> -* fatal error: ../config.h: No such file or directory
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - machine/zaurus.c | 2 +-
> - res/theme-gui.h  | 2 +-
> - res/theme-tui.h  | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/machine/zaurus.c b/machine/zaurus.c
> -index ea21047..83be13b 100644
> ---- a/machine/zaurus.c
> -+++ b/machine/zaurus.c
> -@@ -25,7 +25,7 @@
> -  *
> -  */
> -=20
> --#include "../config.h"
> -+#include "config.h"
> -=20
> - #ifdef USE_ZAURUS
> -=20
> -diff --git a/res/theme-gui.h b/res/theme-gui.h
> -index f8fef7f..79bed39 100644
> ---- a/res/theme-gui.h
> -+++ b/res/theme-gui.h
> -@@ -15,7 +15,7 @@
> -  *
> -  */
> -=20
> --#include "../config.h"
> -+#include "config.h"
> -=20
> - #ifdef USE_ICONS
> - /** Icons **/
> -diff --git a/res/theme-tui.h b/res/theme-tui.h
> -index 94e7693..909be56 100644
> ---- a/res/theme-tui.h
> -+++ b/res/theme-tui.h
> -@@ -15,11 +15,11 @@
> -  *
> -  */
> -=20
> --#include "../config.h"
> -+#include "config.h"
> -=20
> - #ifdef USE_TEXTUI
> - /** TEXT UI colors **/
> --#include "../termseq.h"
> -+#include "termseq.h"
> -=20
> - /* Background color pair */
> - #define TUI_CLR_BG		TERM_CSI TERM_BG_BLACK ";" TERM_FG_WHITE TERM_SGR
> ---=20
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fi=
x-configure-warnings.patch b/meta-initramfs/recipes-bsp/kexecboot/files/000=
2-kexecboot-fix-configure-warnings.patch
> deleted file mode 100644
> index ecf422b..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fix-confi=
gure-warnings.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From b8938acc3f1ab35273fa9a2fa7728050ef72ff65 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Fri, 2 May 2014 00:19:24 +0200
> -Subject: [PATCH 2/4] kexecboot: fix configure warnings
> -
> -Makefile.am:5: warning: source file 'fstype/fstype.c' is in a subdirecto=
ry,
> -Makefile.am:5: but option 'subdir-objects' is disabled
> -automake: warning: possible forward-incompatibility.
> -...
> -Makefile.am:5: warning: source file 'machine/zaurus.c' is in a subdirect=
ory,
> -...
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0ca4b81..66ec54e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1,7 +1,7 @@
> - AC_PREREQ(2.53)
> - AC_INIT([kexecboot], [0.6], [kexecboot-devel@linuxtogo.org])
> - AC_CANONICAL_HOST
> --AM_INIT_AUTOMAKE([-Wall foreign])
> -+AM_INIT_AUTOMAKE([-Wall foreign] [subdir-objects])
> - AC_CONFIG_SRCDIR(kexecboot.c)
> - AC_CONFIG_HEADERS(config.h)
> - AM_MAINTAINER_MODE
> ---=20
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do=
-not-hardcode-MOUNTPOINT.patch b/meta-initramfs/recipes-bsp/kexecboot/files=
/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch
> deleted file mode 100644
> index 4caa0d5..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do-not-ha=
rdcode-MOUNTPOINT.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 800dae0d34f8629a34c638a612166b76dda03e27 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Sat, 2 Aug 2014 01:13:08 +0200
> -Subject: [PATCH 3/4] kexecboot: do not hardcode MOUNTPOINT
> -
> -Avoid to hardcode it: could be requested as a new configure option.
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - cfgparser.c |  6 +++---
> - kexecboot.c | 18 ++++++++++--------
> - 2 files changed, 13 insertions(+), 11 deletions(-)
> -
> -diff --git a/cfgparser.c b/cfgparser.c
> -index 8f6688c..dec27b1 100644
> ---- a/cfgparser.c
> -+++ b/cfgparser.c
> -@@ -141,7 +141,7 @@ static int set_kernel(struct cfgdata_t *cfgdata, cha=
r *value)
> - 		return -1;
> - 	}
> -=20
> --	strcpy(sc->kernelpath, "/mnt");
> -+	strcpy(sc->kernelpath, MOUNTPOINT);
> - 	strcat(sc->kernelpath, value);
> - 	return 0;
> - }
> -@@ -155,7 +155,7 @@ static int set_icon(struct cfgdata_t *cfgdata, char =
*value)
> -=20
> - 	dispose(sc->iconpath);
> - 	/* Add our mountpoint, since the enduser won't know it */
> --	sc->iconpath =3D malloc(sizeof(MOUNTPOINT)+strlen(value));
> -+	sc->iconpath =3D malloc(strlen(MOUNTPOINT)+strlen(value)+1);
> - 	if (NULL =3D=3D sc->iconpath) {
> - 		DPRINTF("Can't allocate memory to store iconpath '%s'", value);
> - 		return -1;
> -@@ -194,7 +194,7 @@ static int set_initrd(struct cfgdata_t *cfgdata, cha=
r *value)
> - 		return -1;
> - 	}
> -=20
> --	strcpy(sc->initrd, "/mnt");
> -+	strcpy(sc->initrd, MOUNTPOINT);
> - 	strcat(sc->initrd, value);
> - 	return 0;
> - }
> -diff --git a/kexecboot.c b/kexecboot.c
> -index d6657a0..7268d6b 100644
> ---- a/kexecboot.c
> -+++ b/kexecboot.c
> -@@ -57,20 +57,22 @@
> - #endif
> -=20
> - #ifdef USE_MACHINE_KERNEL
> --/* Machine-dependent kernel patch */
> -+/* Machine-dependent kernel path */
> - char *machine_kernel =3D NULL;
> - #endif
> -=20
> -+#define PREPEND_MOUNTPATH(string) MOUNTPOINT""string
> -+
> - /* NULL-terminated array of kernel search paths
> -  * First item should be filled with machine-dependent path */
> - char *default_kernels[] =3D {
> - #ifdef USE_ZIMAGE
> --	"/mnt/boot/zImage",
> --	"/mnt/zImage",
> -+	PREPEND_MOUNTPATH("/boot/zImage"),
> -+	PREPEND_MOUNTPATH("/zImage"),
> - #endif
> - #ifdef USE_UIMAGE
> --	"/mnt/boot/uImage",
> --	"/mnt/uImage",
> -+	PREPEND_MOUNTPATH("/boot/uImage"),
> -+	PREPEND_MOUNTPATH("/uImage"),
> - #endif
> - 	NULL
> - };
> -@@ -149,14 +151,14 @@ char *get_machine_kernelpath() {
> - 			++tmp;
> - 		}
> -=20
> --		/* Prepend "/mnt/boot/zImage-" to hw */
> --		tmp =3D malloc(strlen(hw) + 17 + 1);	/* strlen("/mnt/boot/zImage-") */
> -+		/* Prepend  MOUNTPOINT"/boot/zImage-" to hw */
> -+		tmp =3D malloc(strlen(PREPEND_MOUNTPATH("/boot/zImage-")) + strlen(hw=
) + 1);
> - 		if (NULL =3D=3D tmp) {
> - 			DPRINTF("Can't allocate memory for machine-specific kernel path");
> - 			return NULL;
> - 		}
> -=20
> --		strcpy(tmp, "/mnt/boot/zImage-");
> -+		strcpy(tmp, PREPEND_MOUNTPATH("/boot/zImage-"));
> - 		strcat(tmp, hw);
> -=20
> - 		return tmp;
> ---=20
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-=
workaround-for-absolute-kernel-and-initr.patch b/meta-initramfs/recipes-bsp=
/kexecboot/files/0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.=
patch
> deleted file mode 100644
> index 6d81d83..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-workaro=
und-for-absolute-kernel-and-initr.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From de9a6284df8add6ec03e1d9981d0b6d0595bbc69 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Mon, 10 Nov 2014 23:37:23 +0100
> -Subject: [PATCH 4/4] kexecboot.c: workaround for absolute kernel and ini=
trd
> - symlinks
> -
> -Add MOUNTPOINT prefix if the kernel/initrd symlinks start with '/'.
> -Do nothing if the path is a relative symbolic link or not a symlink.
> -
> -Fix following situation:
> -
> -root@mizar:/var/tmp# ls -al boot/
> -total 2076
> -drwxr-xr-x 2 root root    4096 lug  5 01:38 .
> -drwxrwxrwt 4 root root    4096 lug  5 12:26 ..
> --rw-r--r-- 1 root root     831 lug  5 01:24 boot.cfg
> --rw-r--r-- 1 root root    1322 lug  5 01:24 icon.xpm
> -lrwxrwxrwx 1 root root      34 lug  5 12:26 zImage ->
> -/boot/zImage-3.14.5-yocto-standard
> --rw-r--r-- 1 root root 2106832 lug  5 01:20 zImage-3.14.5-yocto-standard
> -
> -Cannot open `/mnt/boot/zImage': No such file or directory
> -Nothing has been loaded!
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - kexecboot.c | 53 ++++++++++++++++++++++++++++++++++++++++++++---------
> - 1 file changed, 44 insertions(+), 9 deletions(-)
> -
> -diff --git a/kexecboot.c b/kexecboot.c
> -index 7268d6b..8a7a7d2 100644
> ---- a/kexecboot.c
> -+++ b/kexecboot.c
> -@@ -208,11 +208,16 @@ void start_kernel(struct params_t *params, int cho=
ice)
> - 	const char *load_argv[] =3D { NULL, "-l", NULL, NULL, NULL, NULL };
> - 	const char *exec_argv[] =3D { NULL, "-e", NULL, NULL};
> -=20
> --	char *cmdline_arg =3D NULL, *initrd_arg =3D NULL;
> -+	char *cmdline_arg =3D NULL, *initrd_arg =3D NULL, *kernel_arg =3D NULL;
> - 	int n, idx, u;
> - 	struct stat sinfo;
> - 	struct boot_item_t *item;
> -=20
> -+	/* buffer for readlink (could be truncated) */
> -+	char buf[512];
> -+	int len;
> -+
> -+
> - 	item =3D params->bootcfg->list[choice];
> -=20
> - 	exec_argv[0] =3D kexec_path;
> -@@ -306,10 +311,17 @@ void start_kernel(struct params_t *params, int cho=
ice)
> - 		}
> - 	}
> -=20
> -+	/* Mount boot device */
> -+	if ( -1 =3D=3D mount(mount_dev, mount_point, mount_fstype,
> -+			MS_RDONLY, NULL) ) {
> -+		perror("Can't mount boot device");
> -+		exit(-1);
> -+	}
> -+
> - 	/* fill '--initrd' option */
> - 	if (item->initrd) {
> - 		/* allocate space */
> --		n =3D sizeof(str_initrd_start) + strlen(item->initrd);
> -+		n =3D sizeof(str_initrd_start) + strlen(item->initrd) + 1 + sizeof(mo=
unt_point) + sizeof(buf);
> -=20
> - 		initrd_arg =3D (char *)malloc(n);
> - 		if (NULL =3D=3D initrd_arg) {
> -@@ -317,24 +329,46 @@ void start_kernel(struct params_t *params, int cho=
ice)
> - 		} else {
> - 			strcpy(initrd_arg, str_initrd_start);	/* --initrd=3D */
> - 			strcat(initrd_arg, item->initrd);
> -+
> -+			if ((len =3D readlink(item->initrd, buf, sizeof(buf)-1)) !=3D -1) {
> -+				buf[len] =3D '\0';
> -+				/* Fix absolute symlinks: prepend MOUNTPOINT */
> -+				if (buf[0] =3D=3D '/') {
> -+					strcpy(initrd_arg, str_initrd_start);	/* --initrd=3D */
> -+					strcat(initrd_arg, mount_point);
> -+					strcat(initrd_arg, buf);
> -+				}
> -+			}
> - 			load_argv[idx] =3D initrd_arg;
> - 			++idx;
> - 		}
> - 	}
> -=20
> - 	/* Append kernelpath as last arg of kexec */
> --	load_argv[idx] =3D item->kernelpath;
> -+		/* allocate space */
> -+		n =3D strlen(item->kernelpath) + 1 + sizeof(mount_point) + sizeof(buf=
);
> -+
> -+		kernel_arg =3D (char *)malloc(n);
> -+		if (NULL =3D=3D kernel_arg) {
> -+			perror("Can't allocate memory for kernel_arg");
> -+		} else {
> -+			strcpy(kernel_arg, item->kernelpath);
> -+
> -+			if ((len =3D readlink(item->kernelpath, buf, sizeof(buf)-1)) !=3D -1=
) {
> -+				buf[len] =3D '\0';
> -+				/* Fix absolute symlinks: prepend MOUNTPOINT */
> -+				if (buf[0] =3D=3D '/') {
> -+					strcpy(kernel_arg, mount_point);
> -+					strcat(kernel_arg, buf);
> -+				}
> -+			}
> -+			load_argv[idx] =3D kernel_arg;
> -+		}
> -=20
> - 	DPRINTF("load_argv: %s, %s, %s, %s, %s", load_argv[0],
> - 			load_argv[1], load_argv[2],
> - 			load_argv[3], load_argv[4]);
> -=20
> --	/* Mount boot device */
> --	if ( -1 =3D=3D mount(mount_dev, mount_point, mount_fstype,
> --			MS_RDONLY, NULL) ) {
> --		perror("Can't mount boot device");
> --		exit(-1);
> --	}
> -=20
> - 	/* Load kernel */
> - 	n =3D fexecw(kexec_path, (char *const *)load_argv, envp);
> -@@ -347,6 +381,7 @@ void start_kernel(struct params_t *params, int choic=
e)
> -=20
> - 	dispose(cmdline_arg);
> - 	dispose(initrd_arg);
> -+	dispose(kernel_arg);
> -=20
> - 	/* Check /proc/sys/net presence */
> - 	if ( -1 =3D=3D stat("/proc/sys/net", &sinfo) ) {
> ---=20
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-bu=
ild-with-gcc5.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h=
-fix-build-with-gcc5.patch
> deleted file mode 100644
> index b54199b..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-wit=
h-gcc5.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From b2c4fc69868a4831ec798ad98f5e7fce200cf0e3 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Thu, 24 Sep 2015 00:02:48 +0200
> -Subject: [PATCH] rgb.h: fix build with gcc 5 (C99 inline semantic)
> -
> -Building with gcc 5.2 we trigger the following error:
> -
> -rgb.h:55:1: warning: inline function 'rgba2comp' declared but never defi=
ned
> -|  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> -|  ^
> -
> -https://gcc.gnu.org/gcc-5/porting_to.html
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - rgb.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/rgb.h b/rgb.h
> -index 0ba987a..4f64622 100644
> ---- a/rgb.h
> -+++ b/rgb.h
> -@@ -51,8 +51,7 @@ typedef struct {
> - } kx_named_color;
> -=20
> - /* Convert RGBA uint32 to red/green/blue/alpha components */
> --inline void
> --rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> -+void rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> - 		kx_ccomp *blue, kx_ccomp *alpha);
> -=20
> - /* Convert hex rgb color to rgba color */
> ---=20
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta=
-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> similarity index 81%
> rename from meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> rename to meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> index 45095f3..31dcbc7 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -36,21 +36,10 @@ DESCRIPTION =3D "kexecboot is a graphical linux-as-bo=
otloader implementation based
>  HOMEPAGE =3D "http://kexecboot.org"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -S =3D "${WORKDIR}/kexecboot-${PV}"
> -SRC_URI =3D "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.g=
z"
> -SRC_URI[md5sum] =3D "46b7c1a6f20531be56445ebb8669a2b8"
> -SRC_URI[sha256sum] =3D "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0a=
c7849298258f0f15"
> -
> -SRC_URI +=3D "\
> -            file://0001-kexecboot-fix-build-when-S-B.patch \
> -            file://0002-kexecboot-fix-configure-warnings.patch \
> -            file://0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch \
> -            file://0004-kexecboot.c-workaround-for-absolute-kernel-and-i=
nitr.patch \
> -            \
> -            file://0005-rgb.h-fix-build-with-gcc5.patch \
> -            "
> -
> +PV =3D "0.6+git${SRCREV}"
> +S =3D "${WORKDIR}/git"
> +SRC_URI =3D "git://github.com/kexecboot/kexecboot.git"
> +SRCREV =3D "4c4f127e79ac5b8d6b6e2fbb938ccbf12b04c531"
>  inherit autotools
> =20
>  EXTRA_OECONF =3D "--enable-textui --enable-delay=3D2 --enable-evdev-rate=
=3D1000,250"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUoviAAKCRA3VSO3ZXaA
HJERAJ91CSd8j4e4PGMcuUK0flrOjmS6VwCeNH1oy68z9ZfNlro9k3MWsk+UJ8E=
=Qsh3
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
