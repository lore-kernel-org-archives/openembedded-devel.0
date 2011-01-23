Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pgvvb-00037E-EV
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 10:08:27 +0100
Received: by iyj18 with SMTP id 18so3420602iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 01:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=2UXLYMR9VT/3Y9z2YfYk0jWTm8tIsjKhZQBEHOU1F5U=;
	b=iBziQGDR4BuEyo+c2ksmv+SR0r8IOc+quRkGO/9tOev4JfPdWfHRCfeKJ5pDyrKAuw
	QdF2CaK7/sBJ37C4rhIa85c2lQSqz4U5rp815HHg/EXlpJYSKbtEE/0nisOqsSLpE/KW
	IA59U/7BZ+Zg4lxv+QGmtoHUyaS7Vm/Kdb710=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GbKBvXUjVZt2Tc9ESXu/cFmsjWJ4aDzAJwkkiGXDUrQrHaTFHvUUHwUFxQxaLcDNtH
	n63f8ABL0GHT3tT9Rpxv0dxakzyhaIIRsLUST633OdXjH83bCZ+pjC7fH5YOQ6nkz4pK
	irYYv/DEZul7CY6QoBWlKcJ/f4re+ECc8m3Qg=
MIME-Version: 1.0
Received: by 10.231.14.199 with SMTP id h7mr3134409iba.158.1295773626297; Sun,
	23 Jan 2011 01:07:06 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sun, 23 Jan 2011 01:07:06 -0800 (PST)
In-Reply-To: <1295745337-27212-1-git-send-email-raj.khem@gmail.com>
References: <1295745337-27212-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 23 Jan 2011 10:07:06 +0100
Message-ID: <AANLkTikGt6srpLmRy4i3n5qMMivsAQbynkqgqxus6LrB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] xxs1500.conf: Remove this board from OE
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
X-List-Received-Date: Sun, 23 Jan 2011 09:08:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/23 Khem Raj <raj.khem@gmail.com>:
> * The kernel is no more fetchable as reported in bugzilla/1737
> * Vendor has EOLed the product
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0conf/machine/xxs1500.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 21 -
> =A0contrib/angstrom/sort.sh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A02 +-
> =A0recipes/linux/linux-xxs1500-2.4.21/Makefile =A0 =A0 =A0 =A0| =A0756 --=
----------
> =A0.../linux/linux-xxs1500-2.4.21/defconfig-xxs1500 =A0 | 1199 ----------=
----------
> =A0.../linux-xxs1500-2.4.21/zboot-Makefile-flags.diff | =A0 11 -
> =A0recipes/linux/linux-xxs1500_2.4.21.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 29 -
> =A06 files changed, 1 insertions(+), 2017 deletions(-)
> =A0delete mode 100644 conf/machine/xxs1500.conf
> =A0delete mode 100644 recipes/linux/linux-xxs1500-2.4.21/Makefile
> =A0delete mode 100644 recipes/linux/linux-xxs1500-2.4.21/defconfig-xxs150=
0
> =A0delete mode 100644 recipes/linux/linux-xxs1500-2.4.21/zboot-Makefile-f=
lags.diff
> =A0delete mode 100644 recipes/linux/linux-xxs1500_2.4.21.bb
>
> diff --git a/conf/machine/xxs1500.conf b/conf/machine/xxs1500.conf
> deleted file mode 100644
> index 4d59091..0000000
> --- a/conf/machine/xxs1500.conf
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: mycable xxs1500
> -#@DESCRIPTION: Machine configuration for the xxs1500 revision A.
> -
> -# pad size and SREC_VMAADDR would need to be changed for the xxs1500 rev=
 B.
> -
> -TARGET_ARCH =3D "mipsel"
> -
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-xxs1500"
> -
> -IMAGE_FSTYPES ?=3D "jffs2"
> -EXTRA_IMAGECMD_jffs2 =3D "--pad=3D0xa00000 --little-endian --eraseblock=
=3D0x20000 -n"
> -
> -# does not gain any speed and just creates problems:
> -# TARGET_CC_ARCH =3D "-march=3Dmips32"
> -
> -USE_DEVFS =3D "1"
> -USE_VT =3D "0"
> -SERIAL_CONSOLE =3D "115200 tts/0 vt100"
> -
> -SREC_VMAADDR =3D "0xbf200000"
> diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
> index 1ea62e6..e879d8c 100755
> --- a/contrib/angstrom/sort.sh
> +++ b/contrib/angstrom/sort.sh
> @@ -100,7 +100,7 @@ case "$arch" in
> =A0 =A0 =A0 =A0"mips")
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0machines=3D"qemumips" ;;
> =A0 =A0 =A0 =A0"mipsel")
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 machines=3D"ben-nanonote db=
1200 lsmipsel mtx-1 mtx-2 qemumipsel rb500 stb225 wgt634u wl500g wrt54 xxs1=
500" ;;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 machines=3D"ben-nanonote db=
1200 lsmipsel mtx-1 mtx-2 qemumipsel rb500 stb225 wgt634u wl500g wrt54" ;;
> =A0 =A0 =A0 =A0"powerpc")
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0machines=3D"gamecube p2020=
ds" ;;
> =A0 =A0 =A0 =A0"ppc405")
> diff --git a/recipes/linux/linux-xxs1500-2.4.21/Makefile b/recipes/linux/=
linux-xxs1500-2.4.21/Makefile
> deleted file mode 100644
> index 7ef3faa..0000000
> --- a/recipes/linux/linux-xxs1500-2.4.21/Makefile
> +++ /dev/null
> @@ -1,756 +0,0 @@
> -#
> -# This file is subject to the terms and conditions of the GNU General Pu=
blic
> -# License. =A0See the file "COPYING" in the main directory of this archi=
ve
> -# for more details.
> -#
> -# Copyright (C) 1994, 1995, 1996 by Ralf Baechle
> -# DECStation modifications by Paul M. Antoine, 1996
> -# Copyright (C) 2002, 2003 =A0Maciej W. Rozycki
> -#
> -# This file is included by the global makefile so that you can add your =
own
> -# architecture-specific flags and dependencies. Remember to do have acti=
ons
> -# for "archclean" and "archdep" for cleaning up and making dependencies =
for
> -# this architecture
> -#
> -
> -#
> -# Select the object file format to substitute into the linker script.
> -#
> -ifdef CONFIG_CPU_LITTLE_ENDIAN
> -tool-prefix =A0 =A0=3D mipsel-linux-
> -ld-emul =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D elf32ltsmip
> -else
> -tool-prefix =A0 =A0=3D mips-linux-
> -ld-emul =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D elf32btsmip
> -endif
> -
> -ifdef CONFIG_CROSSCOMPILE
> -CROSS_COMPILE =A0=3D $(tool-prefix)
> -endif
> -
> -check_gcc =3D $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null > /dev=
/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi)
> -
> -#
> -#
> -# GCC uses -G 0 -mabicalls -fpic as default. =A0We don't want PIC in the=
 kernel
> -# code since it only slows down the whole thing. =A0At some point we mig=
ht make
> -# use of global pointer optimizations but their use of $28 conflicts wit=
h
> -# the current pointer optimization.
> -#
> -# The DECStation requires an ECOFF kernel for remote booting, other MIPS
> -# machines may also. =A0Since BFD is incredibly buggy with respect to
> -# crossformat linking we rely on the elf2ecoff tool for format conversio=
n.
> -#
> -GCCFLAGS =A0 =A0 =A0 :=3D -I $(TOPDIR)/include/asm/gcc
> -GCCFLAGS =A0 =A0 =A0 +=3D -G 0 -mno-abicalls -fno-pic -pipe
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call check_gcc, -finline-limit=3D100000,)
> -LINKFLAGS =A0 =A0 =A0+=3D -G 0 -static # -N
> -MODFLAGS =A0 =A0 =A0 +=3D -mlong-calls
> -
> -ifdef CONFIG_DEBUG_INFO
> -GCCFLAGS =A0 =A0 =A0 +=3D -g
> -ifdef CONFIG_SB1XXX_CORELIS
> -GCCFLAGS =A0 =A0 =A0 +=3D -mno-sched-prolog -fno-omit-frame-pointer
> -endif
> -endif
> -
> -#
> -# Use: $(call set_gccflags,<cpu0>,<isa0>,<cpu1>,<isa1>,<isa2>)
> -#
> -# <cpu0>,<isa0> -- preferred CPU and ISA designations (may require
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0recent tools)
> -# <cpu1>,<isa1> -- fallback CPU and ISA designations (have to work
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0with up to the oldest supported too=
ls)
> -# <isa2> =A0 =A0 =A0 =A0-- an ISA designation used as an ABI selector fo=
r
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gcc versions that do not support "-=
mabi=3D32"
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(depending on the CPU type, either =
"mips1" or
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mips2")
> -#
> -set_gccflags =3D $(shell \
> -while :; do \
> - =A0 =A0 =A0 cpu=3D$(1); isa=3D-$(2); \
> - =A0 =A0 =A0 for gcc_opt in -march=3D -mcpu=3D; do \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(CC) $$gcc_opt$$cpu $$isa -S -o /dev/null =
\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -xc /dev/null > /dev/null 2=
>&1 && \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break 2; \
> - =A0 =A0 =A0 done; \
> - =A0 =A0 =A0 cpu=3D$(3); isa=3D-$(4); \
> - =A0 =A0 =A0 for gcc_opt in -march=3D -mcpu=3D; do \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(CC) $$gcc_opt$$cpu $$isa -S -o /dev/null =
\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -xc /dev/null > /dev/null 2=
>&1 && \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break 2; \
> - =A0 =A0 =A0 done; \
> - =A0 =A0 =A0 break; \
> -done; \
> -gcc_abi=3D-mabi=3D32; gcc_cpu=3D$$cpu; \
> -if $(CC) $$gcc_abi -S -o /dev/null -xc /dev/null > /dev/null 2>&1; then =
\
> - =A0 =A0 =A0 gcc_isa=3D$$isa; \
> -else \
> - =A0 =A0 =A0 gcc_abi=3D; gcc_isa=3D-$(5); \
> -fi; \
> -gas_abi=3D-Wa,-32; gas_cpu=3D$$cpu; gas_isa=3D-Wa,$$isa; \
> -while :; do \
> - =A0 =A0 =A0 for gas_opt in -Wa,-march=3D -Wa,-mcpu=3D; do \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(CC) $$gas_abi $$gas_opt$$cpu $$gas_isa -W=
a,-Z -c \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -o /dev/null -xassembler /d=
ev/null > /dev/null 2>&1 && \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break 2; \
> - =A0 =A0 =A0 done; \
> - =A0 =A0 =A0 gas_abi=3D; gas_opt=3D; gas_cpu=3D; gas_isa=3D; \
> - =A0 =A0 =A0 break; \
> -done; \
> -echo $$gcc_abi $$gcc_opt$$gcc_cpu $$gcc_isa $$gas_abi $$gas_opt$$gas_cpu=
 $$gas_isa)
> -
> -#
> -# CPU-dependent compiler/assembler options for optimization.
> -#
> -ifdef CONFIG_CPU_R3000
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r3000,mips1,r3000,mips1,mi=
ps1)
> -endif
> -ifdef CONFIG_CPU_TX39XX
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r3900,mips1,r3000,mips1,mi=
ps1)
> -endif
> -ifdef CONFIG_CPU_R6000
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r6000,mips2,r6000,mips2,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_R4300
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r4300,mips3,r4300,mips3,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_VR41XX
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r4100,mips3,r4600,mips3,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_R4X00
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r4600,mips3,r4600,mips3,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_TX49XX
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r4600,mips3,r4600,mips3,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_MIPS32
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,mips32,mips32,r4600,mips3,=
mips2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_MIPS64
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,mips64,mips64,r4600,mips3,=
mips2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_R5000
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r5000,mips4,r5000,mips4,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_R5432
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,r5400,mips4,r5000,mips4,mi=
ps2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_NEVADA
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,rm5200,mips4,r5000,mips4,m=
ips2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -#GCCFLAGS =A0 =A0 =A0+=3D $(call check_gcc,-mmad,)
> -endif
> -ifdef CONFIG_CPU_RM7000
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,rm7000,mips4,r5000,mips4,m=
ips2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_RM9000
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,rm9000,mips4,r5000,mips4,m=
ips2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -endif
> -ifdef CONFIG_CPU_SB1
> -GCCFLAGS =A0 =A0 =A0 +=3D $(call set_gccflags,sb1,mips64,r5000,mips4,mip=
s2) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wa,--trap
> -ifdef CONFIG_SB1_PASS_1_WORKAROUNDS
> -MODFLAGS =A0 =A0 =A0 +=3D -msb1-pass1-workarounds
> -endif
> -endif
> -
> -AFLAGS =A0 =A0 =A0 =A0 +=3D $(GCCFLAGS)
> -CFLAGS =A0 =A0 =A0 =A0 +=3D $(GCCFLAGS)
> -LDFLAGS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D -m $(ld-emul)
> -
> -
> -#
> -# We unconditionally build the math emulator
> -#
> -CORE_FILES =A0 =A0 +=3D arch/mips/math-emu/fpu_emulator.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/math-emu
> -
> -#
> -# ramdisk/initrd support
> -# You need a compressed ramdisk image, named ramdisk.gz in
> -# arch/mips/ramdisk
> -#
> -ifdef CONFIG_EMBEDDED_RAMDISK
> -CORE_FILES =A0 =A0 +=3D arch/mips/ramdisk/ramdisk.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ramdisk
> -endif
> -
> -
> -#
> -# Board-dependent options and extra files
> -#
> -
> -#
> -# Acer PICA 61, Mips Magnum 4000 and Olivetti M700.
> -#
> -ifdef CONFIG_MIPS_JAZZ
> -CORE_FILES =A0 =A0 +=3D arch/mips/jazz/jazz.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/jazz arch/mips/arc
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/arc/arclib.a
> -LOADADDR =A0 =A0 =A0 :=3D 0x80080000
> -endif
> -
> -#
> -# Au1000 (Alchemy Semi PB1000) eval board
> -#
> -ifdef CONFIG_MIPS_PB1000
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/au1000/pb1000/pb1000.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/pb1000 arch=
/mips/au1000/common
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Au1100 (Alchemy Semi PB1100) eval board
> -#
> -ifdef CONFIG_MIPS_PB1100
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/pb1100/pb1100.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/pb1100 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -#
> -# Au1500 (Alchemy Semi PB1500) eval board
> -#
> -ifdef CONFIG_MIPS_PB1500
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/au1000/pb1500/pb1500.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/pb1500 arch=
/mips/au1000/common
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Au1x00 (AMD/Alchemy) eval boards
> -#
> -ifdef CONFIG_MIPS_DB1000
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/db1x00/db1x00.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/db1x00 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_DB1500
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/db1x00/db1x00.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/db1x00 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_DB1100
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/db1x00/db1x00.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/db1x00 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_HYDROGEN3
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/hydrogen3/hydrogen3.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/hydrogen3 arch/mips/au1000/com=
mon
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_BOSPORUS
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/db1x00/db1x00.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/db1x00 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_MIRAGE
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/db1x00/db1x00.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/db1x00 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_XXS1500
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/xxs1500/xxs1500.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/xxs1500 arch/mips/au1000/commo=
n
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_MTX1
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/mtx-1/mtx-1.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/mtx-1 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MIPS_PB1550
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/pb1550/pb1550.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/au1000/pb1550 arch/mips/au1000/common
> -LOADADDR =A0 =A0 =A0+=3D 0x80100000
> -endif
> -
> -
> -#
> -# Cogent CSB250
> -#
> -ifdef CONFIG_COGENT_CSB250
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/au1000/csb250/csb250.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/au1000/common/au1000.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/au1000/csb250 arch=
/mips/au1000/common
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_PCI
> -CORE_FILES =A0 =A0+=3D arch/mips/pci/pci-core.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/pci
> -endif
> -
> -#
> -# Algorithmics P4032
> -#
> -ifdef CONFIG_ALGOR_P4032
> -CORE_FILES =A0 =A0 +=3D arch/mips/algor/algor.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/algor
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# Baget/MIPS
> -#
> -ifdef CONFIG_BAGET_MIPS
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/baget arch/mips/ba=
get/prom
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/baget/baget.a arch/mips/baget/pr=
om/bagetlib.a
> -LOADADDR =A0 =A0 =A0 :=3D 0x80001000
> -endif
> -
> -#
> -# Cobalt Server
> -#
> -ifdef CONFIG_MIPS_COBALT
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/cobalt
> -CORE_FILES =A0 =A0 +=3D arch/mips/cobalt/cobalt.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80080000
> -endif
> -
> -#
> -# DECstation family
> -#
> -ifdef CONFIG_DECSTATION
> -CORE_FILES =A0 =A0 +=3D arch/mips/dec/dec.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/dec arch/mips/dec/=
prom
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/dec/prom/rexlib.a
> -LOADADDR =A0 =A0 =A0 :=3D 0x80040000
> -endif
> -
> -#
> -# Galileo EV64120 Board
> -#
> -ifdef CONFIG_MIPS_EV64120
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/gt64120/common/gt64120.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/gt64120/ev64120/ev64120.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/gt64120/common arc=
h/mips/gt64120/ev64120
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Galileo EV96100 Board
> -#
> -ifdef CONFIG_MIPS_EV96100
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/galileo-boards/ev96100/ev96100.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/galileo-boards/ev9=
6100
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Globespan IVR eval board with QED 5231 CPU
> -#
> -ifdef CONFIG_MIPS_IVR
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/ite-boards/ivr/ivr.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/ite-boards/generic/it8172.=
o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ite-boards/generic=
 arch/mips/ite-boards/ivr
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# HP LaserJet
> -#
> -ifdef CONFIG_HP_LASERJET
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/hp-lj
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/hp-lj/hp-lj.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80030000
> -endif
> -
> -#
> -# ITE 8172 eval board with QED 5231 CPU
> -#
> -ifdef CONFIG_MIPS_ITE8172
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/ite-boards/qed-4n-s01b/ite.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/ite-boards/generic/it8172.=
o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ite-boards/generic=
 arch/mips/ite-boards/qed-4n-s01b
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# MIPS Atlas board
> -#
> -ifdef CONFIG_MIPS_ATLAS
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/mips-boards/atlas/atlas.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/mips-boards/generic/mipsbo=
ards.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/mips-boards/generi=
c arch/mips/mips-boards/atlas
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# MIPS Malta board
> -#
> -ifdef CONFIG_MIPS_MALTA
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/mips-boards/malta/malta.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/mips-boards/generic/mipsbo=
ards.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/mips-boards/malta =
arch/mips/mips-boards/generic
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# MIPS SEAD board
> -#
> -ifdef CONFIG_MIPS_SEAD
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/mips-boards/sead/sead.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/mips-boards/generic/mipsbo=
ards.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/mips-boards/generi=
c arch/mips/mips-boards/sead
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Momentum Ocelot board
> -#
> -ifdef CONFIG_MOMENCO_OCELOT
> -# The Ocelot setup.o must be linked early - it does the ioremap() for th=
e
> -# mips_io_port_base.
> -CORE_FILES =A0 =A0 +=3D arch/mips/gt64120/common/gt64120.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/gt64120/momenco_ocelot/mom=
enco_ocelot.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/gt64120/common arc=
h/mips/gt64120/momenco_ocelot
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Momentum Ocelot-G board
> -#
> -ifdef CONFIG_MOMENCO_OCELOT_G
> -# The Ocelot-G setup.o must be linked early - it does the ioremap() for =
the
> -# mips_io_port_base.
> -CORE_FILES =A0 =A0 +=3D arch/mips/momentum/ocelot_g/ocelot_g.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/momentum/ocelot_g
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Momentum Ocelot-C and -CS boards
> -#
> -ifdef CONFIG_MOMENCO_OCELOT_C
> -# The Ocelot-C[S] setup.o must be linked early - it does the ioremap() f=
or the
> -# mips_io_port_base.
> -CORE_FILES =A0 =A0 +=3D arch/mips/momentum/ocelot_c/ocelot_c.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/momentum/ocelot_c
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_MOMENCO_JAGUAR_ATX
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/momentum/jaguar_atx/jaguar_atx.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/momentum/jaguar_at=
x
> -ifdef CONFIG_JAGUAR_DMALOW
> -LOADADDR =A0 =A0 =A0 :=3D 0x88000000
> -else
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -endif
> -
> -#
> -# NEC DDB Vrc-5074
> -#
> -ifdef CONFIG_DDB5074
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ddb5xxx/common arc=
h/mips/ddb5xxx/ddb5074
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/ddb5xxx/common/ddb5xxx.o arch/mi=
ps/ddb5xxx/ddb5074/ddb5074.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80080000
> -endif
> -
> -#
> -# NEC DDB Vrc-5476
> -#
> -ifdef CONFIG_DDB5476
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ddb5xxx/common arc=
h/mips/ddb5xxx/ddb5476
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/ddb5xxx/common/ddb5xxx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/ddb5xxx/ddb5476/ddb5476.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80080000
> -endif
> -
> -#
> -# NEC DDB Vrc-5477
> -#
> -ifdef CONFIG_DDB5477
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/ddb5xxx/common arc=
h/mips/ddb5xxx/ddb5477
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/ddb5xxx/common/ddb5xxx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/ddb5xxx/ddb5477/ddb5477.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -ifdef CONFIG_LASAT
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D arch/mips/lasat/lasatkern.o
> -SUBDIRS =A0 =A0 =A0 +=3D arch/mips/lasat
> -LOADADDR =A0 =A0 =A0+=3D 0x80000000
> -endif
> -#
> -# NEC Osprey (vr4181) board
> -#
> -ifdef CONFIG_NEC_OSPREY
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr4181/common arch=
/mips/vr4181/osprey
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/vr4181/common/vr4181.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr4181/osprey/osprey.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80002000
> -endif
> -
> -#
> -# NEC Eagle/Hawk (VR4122/VR4131) board
> -#
> -ifdef CONFIG_NEC_EAGLE
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/nec-eagle
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/nec-eagle/eagle.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# ZAO Networks Capcella (VR4131)
> -#
> -ifdef CONFIG_ZAO_CAPCELLA
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/zao-capcella
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/zao-capcella/capcel=
la.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# Victor MP-C303/304 (VR4122)
> -#
> -ifdef CONFIG_VICTOR_MPC30X
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/victor-mpc30x
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/victor-mpc30x/mpc30=
x.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80001000
> -endif
> -
> -#
> -# IBM WorkPad z50 (VR4121)
> -#
> -ifdef CONFIG_IBM_WORKPAD
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/ibm-workpad
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/ibm-workpad/workpad=
.o
> -LOADADDR =A0 =A0 =A0 +=3D 0x80004000
> -endif
> -
> -#
> -# CASIO CASSIPEIA E-55/65 (VR4111)
> -#
> -ifdef CONFIG_CASIO_E55
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/casio-e55
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/casio-e55/e55.o
> -LOADADDR =A0 =A0 =A0 +=3D 0x80004000
> -endif
> -
> -#
> -# TANBAC TB0226 Mbase (VR4131)
> -#
> -ifdef CONFIG_TANBAC_TB0226
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/tanbac-tb0226
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/tanbac-tb0226/tb022=
6.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# TANBAC TB0229 (VR4131DIMM)
> -#
> -ifdef CONFIG_TANBAC_TB0229
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/vr41xx/common \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/tanbac-tb0229
> -CORE_FILES =A0 =A0 +=3D arch/mips/vr41xx/common/vr41xx.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/vr41xx/tanbac-tb0229/tb022=
9.o
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# Philips Nino
> -#
> -ifdef CONFIG_NINO
> -CORE_FILES =A0 =A0 +=3D arch/mips/philips/nino/nino.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/philips/nino
> -LOADADDR =A0 =A0 =A0 :=3D 0x80000000
> -endif
> -
> -#
> -# SGI IP22 (Indy/Indigo2)
> -#
> -ifdef CONFIG_SGI_IP22
> -CORE_FILES =A0 =A0 +=3D arch/mips/sgi-ip22/ip22-kern.o
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/arc/arclib.a
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/sgi-ip22 arch/mips=
/arc
> -#
> -# Set LOADADDR to >=3D 0x88069000 if you want to leave space for symmon,
> -# 0x88002000 for production kernels. =A0Note that the value must be
> -# 8kb aligned or the handling of the current variable will break.
> -#
> -LOADADDR =A0 =A0 =A0 :=3D 0x88002000
> -endif
> -
> -#
> -# Sibyte SB1250 SOC and Broadcom (SiByte) BCM112x SOCs
> -#
> -ifneq ($(CONFIG_SIBYTE_SB1250)$(CONFIG_SIBYTE_BCM112X),)
> -# This is a LIB so that it links at the end, and initcalls are later
> -# the sequence; but it is built as an object so that modules don't get
> -# removed (as happens, even if they have __initcall/module_init)
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/sibyte/sb1250/sb1250.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/sibyte/sb1250
> -LOADADDR =A0 =A0 =A0 :=3D 0x80100000
> -endif
> -
> -#
> -# Sibyte boards:
> -#
> -# BCM91250A (SWARM),
> -# BCM91250E (Sentosa),
> -# BCM91120C (CRhine),
> -# BCM91120x (Carmel),
> -# BCM91125C (CRhone),
> -# BCM91125E (Rhone).
> -#
> -ifdef CONFIG_SIBYTE_BOARD
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/sibyte/swarm/sbswarm.a
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/sibyte/swarm
> -endif
> -
> -#
> -# Sibyte CFE firmware
> -#
> -ifdef CONFIG_SIBYTE_CFE
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/sibyte/cfe/cfe.a
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/sibyte/cfe
> -endif
> -
> -#
> -# SNI RM200 PCI
> -#
> -ifdef CONFIG_SNI_RM200_PCI
> -CORE_FILES =A0 =A0 +=3D arch/mips/sni/sni.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/sni arch/mips/arc
> -LIBS =A0 =A0 =A0 =A0 =A0 +=3D arch/mips/arc/arclib.a
> -LOADADDR =A0 =A0 =A0 :=3D 0x80080000
> -endif
> -
> -#
> -# Toshiba JMR-TX3927 board
> -#
> -ifdef CONFIG_TOSHIBA_JMR3927
> -CORE_FILES =A0 =A0 +=3D arch/mips/jmr3927/rbhma3100/jmr3927.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arch/mips/jmr3927/common/tx3927.o
> -SUBDIRS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D arch/mips/jmr3927/rbhma3100 =
arch/mips/jmr3927/common
> -LOADADDR =A0 =A0 =A0 :=3D 0x80050000
> -endif
> -
> -#
> -# Toshiba RBTX4927 board or
> -# Toshiba RBTX4937 board
> -#
> -ifdef CONFIG_TOSHIBA_RBTX4927
> -MIPS =A0 =A0 =A0 =A0 =A0 =3D arch/mips
> -CEC =A0 =A0 =A0 =A0 =A0 =A0=3D tx4927
> -COMMON =A0 =A0 =A0 =A0 =3D $(MIPS)/$(CEC)/common
> -BOARD =A0 =A0 =A0 =A0 =A0=3D $(MIPS)/$(CEC)/toshiba_rbtx4927
> -LIBS =A0 =A0 =A0 =A0 =A0+=3D $(BOARD)/toshiba_rbtx4927.o $(COMMON)/tx492=
7.o
> -SUBDIRS =A0 =A0 =A0 +=3D $(BOARD) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0$(COMMON)
> -LOADADDR =A0 =A0 =A0+=3D 0x80020000
> -endif
> -
> -#
> -# Choosing incompatible machines durings configuration will result in
> -# error messages during linking. =A0Select a default linkscript if
> -# none has been choosen above.
> -#
> -vmlinux: arch/$(ARCH)/ld.script
> -
> -arch/$(ARCH)/ld.script: arch/$(ARCH)/ld.script.in arch/$(ARCH)/Makefile
> - =A0 =A0 =A0 sed -e 's/@@LOADADDR@@/$(LOADADDR)/' <$< >$@
> -LINKFLAGS =A0 =A0 =A0+=3D -T arch/$(ARCH)/ld.script
> -
> -HEAD :=3D arch/mips/kernel/head.o arch/mips/kernel/init_task.o
> -
> -SUBDIRS :=3D $(addprefix arch/mips/, tools) $(SUBDIRS) $(addprefix arch/=
mips/, kernel mm lib)
> -CORE_FILES :=3D arch/mips/kernel/kernel.o arch/mips/mm/mm.o $(CORE_FILES=
)
> -LIBS :=3D arch/mips/lib/lib.a $(LIBS)
> -
> -ifdef CONFIG_BAGET_MIPS
> -
> -BAGETBOOT =3D $(MAKE) -C arch/$(ARCH)/baget
> -
> -balo: vmlinux
> - =A0 =A0 =A0 $(BAGETBOOT) balo
> -
> -endif
> -
> -ifdef CONFIG_MIPS_EV64120
> -gboot: vmlinux
> - =A0 =A0 =A0 $(MAKE) -C arch/$(ARCH)/galileo-boards/ev64120/compressed
> -endif
> -
> -ifdef CONFIG_LASAT
> -rom.bin rom.sw: vmlinux
> - =A0 =A0 =A0 $(MAKE) -C arch/$(ARCH)/lasat/image $@
> -endif
> -
> -MAKEBOOT =3D $(MAKE) -C arch/$(ARCH)/boot
> -MAKEZBOOT =3D $(MAKE) -C arch/$(ARCH)/zboot
> -BOOT_TARGETS =3D zImage zImage.initrd zImage.flash zImage.flash.bin
> -
> -vmlinux.ecoff: vmlinux
> - =A0 =A0 =A0 @$(MAKEBOOT) $@
> -
> - $(BOOT_TARGETS): vmlinux
> - =A0 =A0 =A0 @$(MAKEZBOOT) $@
> -
> -vmlinux.srec: vmlinux
> - =A0 =A0 =A0 @$(MAKEBOOT) $@
> -
> -archclean:
> - =A0 =A0 =A0 @$(MAKEBOOT) clean
> - =A0 =A0 =A0 @$(MAKEZBOOT) clean
> - =A0 =A0 =A0 rm -f arch/$(ARCH)/ld.script
> - =A0 =A0 =A0 $(MAKE) -C arch/$(ARCH)/tools clean
> - =A0 =A0 =A0 $(MAKE) -C arch/mips/baget clean
> - =A0 =A0 =A0 $(MAKE) -C arch/mips/lasat clean
> -
> -archmrproper:
> - =A0 =A0 =A0 @$(MAKEBOOT) mrproper
> - =A0 =A0 =A0 $(RM) $(TOPDIR)/include/asm-$(ARCH)/offset.h
> - =A0 =A0 =A0 $(MAKE) -C arch/$(ARCH)/tools mrproper
> -
> -archdep:
> - =A0 =A0 =A0 if [ ! -f $(TOPDIR)/include/asm-$(ARCH)/offset.h ]; then \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 touch $(TOPDIR)/include/asm-$(ARCH)/offset.=
h; \
> - =A0 =A0 =A0 fi;
> - =A0 =A0 =A0 @$(MAKEBOOT) dep
> diff --git a/recipes/linux/linux-xxs1500-2.4.21/defconfig-xxs1500 b/recip=
es/linux/linux-xxs1500-2.4.21/defconfig-xxs1500
> deleted file mode 100644
> index 0fc8486..0000000
> --- a/recipes/linux/linux-xxs1500-2.4.21/defconfig-xxs1500
> +++ /dev/null
> @@ -1,1199 +0,0 @@
> -#
> -# Automatically generated by make menuconfig: don't edit
> -#
> -CONFIG_MIPS=3Dy
> -CONFIG_MIPS32=3Dy
> -# CONFIG_MIPS64 is not set
> -
> -#
> -# Code maturity level options
> -#
> -CONFIG_EXPERIMENTAL=3Dy
> -
> -#
> -# Loadable module support
> -#
> -CONFIG_MODULES=3Dy
> -# CONFIG_MODVERSIONS is not set
> -CONFIG_KMOD=3Dy
> -
> -#
> -# Machine selection
> -#
> -# CONFIG_ACER_PICA_61 is not set
> -# CONFIG_MIPS_BOSPORUS is not set
> -# CONFIG_MIPS_MIRAGE is not set
> -# CONFIG_MIPS_DB1000 is not set
> -# CONFIG_MIPS_DB1100 is not set
> -# CONFIG_MIPS_DB1500 is not set
> -# CONFIG_MIPS_PB1000 is not set
> -# CONFIG_MIPS_PB1100 is not set
> -# CONFIG_MIPS_PB1500 is not set
> -CONFIG_MIPS_XXS1500=3Dy
> -# CONFIG_MIPS_MTX1 is not set
> -# CONFIG_BAGET_MIPS is not set
> -# CONFIG_CASIO_E55 is not set
> -# CONFIG_MIPS_COBALT is not set
> -# CONFIG_DECSTATION is not set
> -# CONFIG_MIPS_EV64120 is not set
> -# CONFIG_MIPS_EV96100 is not set
> -# CONFIG_MIPS_IVR is not set
> -# CONFIG_HP_LASERJET is not set
> -# CONFIG_IBM_WORKPAD is not set
> -# CONFIG_LASAT is not set
> -# CONFIG_MIPS_ITE8172 is not set
> -# CONFIG_MIPS_ATLAS is not set
> -# CONFIG_MIPS_MAGNUM_4000 is not set
> -# CONFIG_MIPS_MALTA is not set
> -# CONFIG_MIPS_SEAD is not set
> -# CONFIG_MOMENCO_OCELOT is not set
> -# CONFIG_MOMENCO_OCELOT_G is not set
> -# CONFIG_MOMENCO_OCELOT_C is not set
> -# CONFIG_DDB5074 is not set
> -# CONFIG_DDB5476 is not set
> -# CONFIG_DDB5477 is not set
> -# CONFIG_NEC_OSPREY is not set
> -# CONFIG_NEC_EAGLE is not set
> -# CONFIG_OLIVETTI_M700 is not set
> -# CONFIG_NINO is not set
> -# CONFIG_SGI_IP22 is not set
> -# CONFIG_SGI_IP27 is not set
> -# CONFIG_SIBYTE_SB1xxx_SOC is not set
> -# CONFIG_SNI_RM200_PCI is not set
> -# CONFIG_TANBAC_TB0226 is not set
> -# CONFIG_TANBAC_TB0229 is not set
> -# CONFIG_TOSHIBA_JMR3927 is not set
> -# CONFIG_TOSHIBA_RBTX4927 is not set
> -# CONFIG_VICTOR_MPC30X is not set
> -# CONFIG_ZAO_CAPCELLA is not set
> -# CONFIG_HIGHMEM is not set
> -CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
> -# CONFIG_RWSEM_XCHGADD_ALGORITHM is not set
> -CONFIG_SOC_AU1X00=3Dy
> -CONFIG_SOC_AU1500=3Dy
> -CONFIG_PCI=3Dy
> -CONFIG_NEW_PCI=3Dy
> -CONFIG_PCI_AUTO=3Dy
> -CONFIG_NONCOHERENT_IO=3Dy
> -CONFIG_PC_KEYB=3Dy
> -# CONFIG_MIPS_AU1000 is not set
> -
> -#
> -# CPU selection
> -#
> -CONFIG_CPU_MIPS32=3Dy
> -# CONFIG_CPU_MIPS64 is not set
> -# CONFIG_CPU_R3000 is not set
> -# CONFIG_CPU_TX39XX is not set
> -# CONFIG_CPU_VR41XX is not set
> -# CONFIG_CPU_R4300 is not set
> -# CONFIG_CPU_R4X00 is not set
> -# CONFIG_CPU_TX49XX is not set
> -# CONFIG_CPU_R5000 is not set
> -# CONFIG_CPU_R5432 is not set
> -# CONFIG_CPU_R6000 is not set
> -# CONFIG_CPU_NEVADA is not set
> -# CONFIG_CPU_R8000 is not set
> -# CONFIG_CPU_R10000 is not set
> -# CONFIG_CPU_RM7000 is not set
> -# CONFIG_CPU_SB1 is not set
> -CONFIG_CPU_HAS_PREFETCH=3Dy
> -# CONFIG_VTAG_ICACHE is not set
> -CONFIG_64BIT_PHYS_ADDR=3Dy
> -# CONFIG_CPU_ADVANCED is not set
> -CONFIG_CPU_HAS_LLSC=3Dy
> -# CONFIG_CPU_HAS_LLDSCD is not set
> -# CONFIG_CPU_HAS_WB is not set
> -CONFIG_CPU_HAS_SYNC=3Dy
> -
> -#
> -# General setup
> -#
> -CONFIG_CPU_LITTLE_ENDIAN=3Dy
> -CONFIG_NET=3Dy
> -CONFIG_PCI_NAMES=3Dy
> -# CONFIG_ISA is not set
> -# CONFIG_EISA is not set
> -# CONFIG_TC is not set
> -# CONFIG_MCA is not set
> -# CONFIG_SBUS is not set
> -CONFIG_HOTPLUG=3Dy
> -
> -#
> -# PCMCIA/CardBus support
> -#
> -CONFIG_PCMCIA=3Dm
> -# CONFIG_CARDBUS is not set
> -# CONFIG_TCIC is not set
> -# CONFIG_I82092 is not set
> -# CONFIG_I82365 is not set
> -CONFIG_PCMCIA_AU1X00=3Dm
> -# CONFIG_PCMCIA_PB1X00 is not set
> -# CONFIG_PCMCIA_DB1X00 is not set
> -CONFIG_PCMCIA_XXS1500=3Dy
> -# CONFIG_PCMCIA_VRC4173 is not set
> -
> -#
> -# PCI Hotplug Support
> -#
> -# CONFIG_HOTPLUG_PCI is not set
> -# CONFIG_HOTPLUG_PCI_COMPAQ is not set
> -# CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM is not set
> -# CONFIG_HOTPLUG_PCI_ACPI is not set
> -CONFIG_SYSVIPC=3Dy
> -# CONFIG_BSD_PROCESS_ACCT is not set
> -CONFIG_SYSCTL=3Dy
> -CONFIG_KCORE_ELF=3Dy
> -# CONFIG_KCORE_AOUT is not set
> -# CONFIG_BINFMT_AOUT is not set
> -CONFIG_BINFMT_ELF=3Dy
> -# CONFIG_MIPS32_COMPAT is not set
> -# CONFIG_MIPS32_O32 is not set
> -# CONFIG_MIPS32_N32 is not set
> -# CONFIG_BINFMT_ELF32 is not set
> -# CONFIG_BINFMT_MISC is not set
> -# CONFIG_PM is not set
> -
> -#
> -# Memory Technology Devices (MTD)
> -#
> -CONFIG_MTD=3Dy
> -# CONFIG_MTD_DEBUG is not set
> -CONFIG_MTD_PARTITIONS=3Dy
> -# CONFIG_MTD_CONCAT is not set
> -# CONFIG_MTD_REDBOOT_PARTS is not set
> -# CONFIG_MTD_CMDLINE_PARTS is not set
> -CONFIG_MTD_CHAR=3Dy
> -CONFIG_MTD_BLOCK=3Dy
> -# CONFIG_FTL is not set
> -# CONFIG_NFTL is not set
> -
> -#
> -# RAM/ROM/Flash chip drivers
> -#
> -CONFIG_MTD_CFI=3Dy
> -# CONFIG_MTD_JEDECPROBE is not set
> -CONFIG_MTD_GEN_PROBE=3Dy
> -# CONFIG_MTD_CFI_ADV_OPTIONS is not set
> -# CONFIG_MTD_CFI_INTELEXT is not set
> -CONFIG_MTD_CFI_AMDSTD=3Dy
> -# CONFIG_MTD_CFI_STAA is not set
> -# CONFIG_MTD_RAM is not set
> -# CONFIG_MTD_ROM is not set
> -# CONFIG_MTD_ABSENT is not set
> -# CONFIG_MTD_OBSOLETE_CHIPS is not set
> -# CONFIG_MTD_AMDSTD is not set
> -# CONFIG_MTD_SHARP is not set
> -# CONFIG_MTD_JEDEC is not set
> -
> -#
> -# Mapping drivers for chip access
> -#
> -# CONFIG_MTD_PHYSMAP is not set
> -# CONFIG_MTD_PB1000 is not set
> -# CONFIG_MTD_PB1500 is not set
> -# CONFIG_MTD_PB1100 is not set
> -# CONFIG_MTD_BOSPORUS is not set
> -CONFIG_MTD_XXS1500=3Dy
> -# CONFIG_MTD_MTX1 is not set
> -# CONFIG_MTD_DB1X00 is not set
> -# CONFIG_MTD_CSTM_MIPS_IXX is not set
> -# CONFIG_MTD_OCELOT is not set
> -# CONFIG_MTD_LASAT is not set
> -# CONFIG_MTD_PCI is not set
> -# CONFIG_MTD_PCMCIA is not set
> -
> -#
> -# Self-contained MTD device drivers
> -#
> -# CONFIG_MTD_PMC551 is not set
> -# CONFIG_MTD_SLRAM is not set
> -# CONFIG_MTD_MTDRAM is not set
> -# CONFIG_MTD_BLKMTD is not set
> -# CONFIG_MTD_DOC1000 is not set
> -# CONFIG_MTD_DOC2000 is not set
> -# CONFIG_MTD_DOC2001 is not set
> -# CONFIG_MTD_DOCPROBE is not set
> -
> -#
> -# NAND Flash Device Drivers
> -#
> -# CONFIG_MTD_NAND is not set
> -
> -#
> -# Parallel port support
> -#
> -CONFIG_PARPORT=3Dm
> -CONFIG_PARPORT_PC=3Dm
> -# CONFIG_PARPORT_PC_FIFO is not set
> -# CONFIG_PARPORT_PC_SUPERIO is not set
> -# CONFIG_PARPORT_PC_PCMCIA is not set
> -# CONFIG_PARPORT_AMIGA is not set
> -# CONFIG_PARPORT_MFC3 is not set
> -# CONFIG_PARPORT_ATARI is not set
> -# CONFIG_PARPORT_GSC is not set
> -# CONFIG_PARPORT_SUNBPP is not set
> -# CONFIG_PARPORT_IP22 is not set
> -# CONFIG_PARPORT_OTHER is not set
> -CONFIG_PARPORT_1284=3Dy
> -
> -#
> -# Plug and Play configuration
> -#
> -# CONFIG_PNP is not set
> -# CONFIG_ISAPNP is not set
> -
> -#
> -# Block devices
> -#
> -# CONFIG_BLK_DEV_FD is not set
> -# CONFIG_BLK_DEV_XD is not set
> -# CONFIG_PARIDE is not set
> -# CONFIG_BLK_CPQ_DA is not set
> -# CONFIG_BLK_CPQ_CISS_DA is not set
> -# CONFIG_CISS_SCSI_TAPE is not set
> -# CONFIG_BLK_DEV_DAC960 is not set
> -# CONFIG_BLK_DEV_UMEM is not set
> -CONFIG_BLK_DEV_LOOP=3Dy
> -# CONFIG_BLK_DEV_NBD is not set
> -# CONFIG_BLK_DEV_RAM is not set
> -# CONFIG_BLK_DEV_INITRD is not set
> -# CONFIG_BLK_STATS is not set
> -
> -#
> -# Multi-device support (RAID and LVM)
> -#
> -# CONFIG_MD is not set
> -# CONFIG_BLK_DEV_MD is not set
> -# CONFIG_MD_LINEAR is not set
> -# CONFIG_MD_RAID0 is not set
> -# CONFIG_MD_RAID1 is not set
> -# CONFIG_MD_RAID5 is not set
> -# CONFIG_MD_MULTIPATH is not set
> -# CONFIG_BLK_DEV_LVM is not set
> -
> -#
> -# Networking options
> -#
> -CONFIG_PACKET=3Dy
> -# CONFIG_PACKET_MMAP is not set
> -# CONFIG_NETLINK_DEV is not set
> -CONFIG_NETFILTER=3Dy
> -# CONFIG_NETFILTER_DEBUG is not set
> -CONFIG_FILTER=3Dy
> -CONFIG_UNIX=3Dy
> -CONFIG_INET=3Dy
> -CONFIG_IP_MULTICAST=3Dy
> -CONFIG_IP_ADVANCED_ROUTER=3Dy
> -CONFIG_IP_MULTIPLE_TABLES=3Dy
> -CONFIG_IP_ROUTE_FWMARK=3Dy
> -CONFIG_IP_ROUTE_NAT=3Dy
> -CONFIG_IP_ROUTE_MULTIPATH=3Dy
> -CONFIG_IP_ROUTE_TOS=3Dy
> -CONFIG_IP_ROUTE_VERBOSE=3Dy
> -CONFIG_IP_ROUTE_LARGE_TABLES=3Dy
> -CONFIG_IP_PNP=3Dy
> -CONFIG_IP_PNP_DHCP=3Dy
> -# CONFIG_IP_PNP_BOOTP is not set
> -# CONFIG_IP_PNP_RARP is not set
> -# CONFIG_NET_IPIP is not set
> -# CONFIG_NET_IPGRE is not set
> -# CONFIG_IP_MROUTE is not set
> -# CONFIG_ARPD is not set
> -CONFIG_INET_ECN=3Dy
> -CONFIG_SYN_COOKIES=3Dy
> -
> -#
> -# =A0 IP: Netfilter Configuration
> -#
> -CONFIG_IP_NF_CONNTRACK=3Dm
> -CONFIG_IP_NF_FTP=3Dm
> -CONFIG_IP_NF_AMANDA=3Dm
> -CONFIG_IP_NF_TFTP=3Dm
> -CONFIG_IP_NF_IRC=3Dm
> -CONFIG_IP_NF_QUEUE=3Dm
> -CONFIG_IP_NF_IPTABLES=3Dm
> -CONFIG_IP_NF_MATCH_LIMIT=3Dm
> -CONFIG_IP_NF_MATCH_MAC=3Dm
> -CONFIG_IP_NF_MATCH_PKTTYPE=3Dm
> -CONFIG_IP_NF_MATCH_MARK=3Dm
> -CONFIG_IP_NF_MATCH_MULTIPORT=3Dm
> -CONFIG_IP_NF_MATCH_TOS=3Dm
> -CONFIG_IP_NF_MATCH_ECN=3Dm
> -CONFIG_IP_NF_MATCH_DSCP=3Dm
> -CONFIG_IP_NF_MATCH_AH_ESP=3Dm
> -CONFIG_IP_NF_MATCH_LENGTH=3Dm
> -CONFIG_IP_NF_MATCH_TTL=3Dm
> -CONFIG_IP_NF_MATCH_TCPMSS=3Dm
> -CONFIG_IP_NF_MATCH_HELPER=3Dm
> -CONFIG_IP_NF_MATCH_STATE=3Dm
> -CONFIG_IP_NF_MATCH_CONNTRACK=3Dm
> -CONFIG_IP_NF_MATCH_UNCLEAN=3Dm
> -CONFIG_IP_NF_MATCH_OWNER=3Dm
> -CONFIG_IP_NF_FILTER=3Dm
> -CONFIG_IP_NF_TARGET_REJECT=3Dm
> -CONFIG_IP_NF_TARGET_MIRROR=3Dm
> -CONFIG_IP_NF_NAT=3Dm
> -CONFIG_IP_NF_NAT_NEEDED=3Dy
> -CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> -CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> -CONFIG_IP_NF_NAT_AMANDA=3Dm
> -# CONFIG_IP_NF_NAT_LOCAL is not set
> -CONFIG_IP_NF_NAT_SNMP_BASIC=3Dm
> -CONFIG_IP_NF_NAT_IRC=3Dm
> -CONFIG_IP_NF_NAT_FTP=3Dm
> -CONFIG_IP_NF_NAT_TFTP=3Dm
> -CONFIG_IP_NF_MANGLE=3Dm
> -CONFIG_IP_NF_TARGET_TOS=3Dm
> -CONFIG_IP_NF_TARGET_ECN=3Dm
> -CONFIG_IP_NF_TARGET_DSCP=3Dm
> -CONFIG_IP_NF_TARGET_MARK=3Dm
> -CONFIG_IP_NF_TARGET_LOG=3Dm
> -CONFIG_IP_NF_TARGET_ULOG=3Dm
> -CONFIG_IP_NF_TARGET_TCPMSS=3Dm
> -CONFIG_IP_NF_ARPTABLES=3Dm
> -CONFIG_IP_NF_ARPFILTER=3Dm
> -# CONFIG_IP_NF_COMPAT_IPCHAINS is not set
> -# CONFIG_IP_NF_COMPAT_IPFWADM is not set
> -CONFIG_IPV6=3Dm
> -
> -#
> -# =A0 IPv6: Netfilter Configuration
> -#
> -CONFIG_IP6_NF_QUEUE=3Dm
> -CONFIG_IP6_NF_IPTABLES=3Dm
> -CONFIG_IP6_NF_MATCH_LIMIT=3Dm
> -CONFIG_IP6_NF_MATCH_MAC=3Dm
> -CONFIG_IP6_NF_MATCH_RT=3Dm
> -CONFIG_IP6_NF_MATCH_OPTS=3Dm
> -CONFIG_IP6_NF_MATCH_FRAG=3Dm
> -CONFIG_IP6_NF_MATCH_HL=3Dm
> -CONFIG_IP6_NF_MATCH_MULTIPORT=3Dm
> -CONFIG_IP6_NF_MATCH_OWNER=3Dm
> -CONFIG_IP6_NF_MATCH_MARK=3Dm
> -CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> -CONFIG_IP6_NF_MATCH_AHESP=3Dm
> -CONFIG_IP6_NF_MATCH_LENGTH=3Dm
> -CONFIG_IP6_NF_MATCH_EUI64=3Dm
> -CONFIG_IP6_NF_FILTER=3Dm
> -CONFIG_IP6_NF_TARGET_LOG=3Dm
> -CONFIG_IP6_NF_MANGLE=3Dm
> -CONFIG_IP6_NF_TARGET_MARK=3Dm
> -# CONFIG_KHTTPD is not set
> -# CONFIG_ATM is not set
> -CONFIG_VLAN_8021Q=3Dm
> -# CONFIG_IPX is not set
> -# CONFIG_ATALK is not set
> -
> -#
> -# Appletalk devices
> -#
> -# CONFIG_DEV_APPLETALK is not set
> -# CONFIG_DECNET is not set
> -CONFIG_BRIDGE=3Dm
> -# CONFIG_X25 is not set
> -# CONFIG_LAPB is not set
> -# CONFIG_LLC is not set
> -# CONFIG_NET_DIVERT is not set
> -# CONFIG_ECONET is not set
> -# CONFIG_WAN_ROUTER is not set
> -# CONFIG_NET_FASTROUTE is not set
> -# CONFIG_NET_HW_FLOWCONTROL is not set
> -
> -#
> -# QoS and/or fair queueing
> -#
> -CONFIG_NET_SCHED=3Dy
> -CONFIG_NET_SCH_CBQ=3Dm
> -CONFIG_NET_SCH_HTB=3Dm
> -CONFIG_NET_SCH_CSZ=3Dm
> -CONFIG_NET_SCH_PRIO=3Dm
> -CONFIG_NET_SCH_RED=3Dm
> -CONFIG_NET_SCH_SFQ=3Dm
> -CONFIG_NET_SCH_TEQL=3Dm
> -CONFIG_NET_SCH_TBF=3Dm
> -CONFIG_NET_SCH_GRED=3Dm
> -CONFIG_NET_SCH_DSMARK=3Dm
> -CONFIG_NET_SCH_INGRESS=3Dm
> -CONFIG_NET_QOS=3Dy
> -CONFIG_NET_ESTIMATOR=3Dy
> -CONFIG_NET_CLS=3Dy
> -CONFIG_NET_CLS_TCINDEX=3Dm
> -CONFIG_NET_CLS_ROUTE4=3Dm
> -CONFIG_NET_CLS_ROUTE=3Dy
> -CONFIG_NET_CLS_FW=3Dm
> -CONFIG_NET_CLS_U32=3Dm
> -CONFIG_NET_CLS_RSVP=3Dm
> -CONFIG_NET_CLS_RSVP6=3Dm
> -CONFIG_NET_CLS_POLICE=3Dy
> -
> -#
> -# Network testing
> -#
> -# CONFIG_NET_PKTGEN is not set
> -
> -#
> -# Telephony Support
> -#
> -# CONFIG_PHONE is not set
> -# CONFIG_PHONE_IXJ is not set
> -# CONFIG_PHONE_IXJ_PCMCIA is not set
> -
> -#
> -# ATA/IDE/MFM/RLL support
> -#
> -CONFIG_IDE=3Dm
> -
> -#
> -# IDE, ATA and ATAPI Block devices
> -#
> -CONFIG_BLK_DEV_IDE=3Dm
> -# CONFIG_BLK_DEV_HD_IDE is not set
> -# CONFIG_BLK_DEV_HD is not set
> -CONFIG_BLK_DEV_IDEDISK=3Dm
> -CONFIG_IDEDISK_MULTI_MODE=3Dy
> -# CONFIG_IDEDISK_STROKE is not set
> -CONFIG_BLK_DEV_IDECS=3Dm
> -# CONFIG_BLK_DEV_IDECD is not set
> -# CONFIG_BLK_DEV_IDETAPE is not set
> -# CONFIG_BLK_DEV_IDEFLOPPY is not set
> -# CONFIG_BLK_DEV_IDESCSI is not set
> -# CONFIG_IDE_TASK_IOCTL is not set
> -# CONFIG_BLK_DEV_CMD640 is not set
> -# CONFIG_BLK_DEV_CMD640_ENHANCED is not set
> -# CONFIG_BLK_DEV_ISAPNP is not set
> -CONFIG_BLK_DEV_IDEPCI=3Dy
> -# CONFIG_BLK_DEV_GENERIC is not set
> -# CONFIG_IDEPCI_SHARE_IRQ is not set
> -CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
> -CONFIG_BLK_DEV_OFFBOARD=3Dy
> -# CONFIG_BLK_DEV_IDEDMA_FORCED is not set
> -CONFIG_IDEDMA_PCI_AUTO=3Dy
> -# CONFIG_IDEDMA_ONLYDISK is not set
> -CONFIG_BLK_DEV_IDEDMA=3Dy
> -# CONFIG_IDEDMA_PCI_WIP is not set
> -# CONFIG_BLK_DEV_ADMA100 is not set
> -# CONFIG_BLK_DEV_AEC62XX is not set
> -# CONFIG_BLK_DEV_ALI15X3 is not set
> -# CONFIG_WDC_ALI15X3 is not set
> -# CONFIG_BLK_DEV_AMD74XX is not set
> -# CONFIG_AMD74XX_OVERRIDE is not set
> -# CONFIG_BLK_DEV_CMD64X is not set
> -# CONFIG_BLK_DEV_TRIFLEX is not set
> -# CONFIG_BLK_DEV_CY82C693 is not set
> -# CONFIG_BLK_DEV_CS5530 is not set
> -# CONFIG_BLK_DEV_HPT34X is not set
> -# CONFIG_HPT34X_AUTODMA is not set
> -# CONFIG_BLK_DEV_HPT366 is not set
> -# CONFIG_BLK_DEV_PIIX is not set
> -# CONFIG_BLK_DEV_NS87415 is not set
> -# CONFIG_BLK_DEV_OPTI621 is not set
> -# CONFIG_BLK_DEV_PDC202XX_OLD is not set
> -# CONFIG_PDC202XX_BURST is not set
> -# CONFIG_BLK_DEV_PDC202XX_NEW is not set
> -# CONFIG_BLK_DEV_RZ1000 is not set
> -# CONFIG_BLK_DEV_SC1200 is not set
> -# CONFIG_BLK_DEV_SVWKS is not set
> -# CONFIG_BLK_DEV_SIIMAGE is not set
> -# CONFIG_BLK_DEV_SIS5513 is not set
> -# CONFIG_BLK_DEV_SLC90E66 is not set
> -# CONFIG_BLK_DEV_TRM290 is not set
> -# CONFIG_BLK_DEV_VIA82CXXX is not set
> -# CONFIG_IDE_CHIPSETS is not set
> -CONFIG_IDEDMA_AUTO=3Dy
> -# CONFIG_IDEDMA_IVB is not set
> -# CONFIG_DMA_NONPCI is not set
> -CONFIG_BLK_DEV_IDE_MODES=3Dy
> -# CONFIG_BLK_DEV_ATARAID is not set
> -# CONFIG_BLK_DEV_ATARAID_PDC is not set
> -# CONFIG_BLK_DEV_ATARAID_HPT is not set
> -# CONFIG_BLK_DEV_ATARAID_SII is not set
> -
> -#
> -# SCSI support
> -#
> -CONFIG_SCSI=3Dm
> -CONFIG_BLK_DEV_SD=3Dm
> -CONFIG_SD_EXTRA_DEVS=3D40
> -CONFIG_CHR_DEV_ST=3Dm
> -# CONFIG_CHR_DEV_OSST is not set
> -CONFIG_BLK_DEV_SR=3Dm
> -# CONFIG_BLK_DEV_SR_VENDOR is not set
> -CONFIG_SR_EXTRA_DEVS=3D2
> -# CONFIG_CHR_DEV_SG is not set
> -# CONFIG_SCSI_DEBUG_QUEUES is not set
> -# CONFIG_SCSI_MULTI_LUN is not set
> -CONFIG_SCSI_CONSTANTS=3Dy
> -# CONFIG_SCSI_LOGGING is not set
> -
> -#
> -# SCSI low-level drivers
> -#
> -# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> -# CONFIG_SCSI_7000FASST is not set
> -# CONFIG_SCSI_ACARD is not set
> -# CONFIG_SCSI_AHA152X is not set
> -# CONFIG_SCSI_AHA1542 is not set
> -# CONFIG_SCSI_AHA1740 is not set
> -# CONFIG_SCSI_AACRAID is not set
> -# CONFIG_SCSI_AIC7XXX is not set
> -# CONFIG_SCSI_AIC79XX is not set
> -# CONFIG_SCSI_AIC7XXX_OLD is not set
> -# CONFIG_SCSI_DPT_I2O is not set
> -# CONFIG_SCSI_ADVANSYS is not set
> -# CONFIG_SCSI_IN2000 is not set
> -# CONFIG_SCSI_AM53C974 is not set
> -# CONFIG_SCSI_MEGARAID is not set
> -# CONFIG_SCSI_BUSLOGIC is not set
> -# CONFIG_SCSI_CPQFCTS is not set
> -# CONFIG_SCSI_DMX3191D is not set
> -# CONFIG_SCSI_DTC3280 is not set
> -# CONFIG_SCSI_EATA is not set
> -# CONFIG_SCSI_EATA_DMA is not set
> -# CONFIG_SCSI_EATA_PIO is not set
> -# CONFIG_SCSI_FUTURE_DOMAIN is not set
> -# CONFIG_SCSI_GDTH is not set
> -# CONFIG_SCSI_GENERIC_NCR5380 is not set
> -# CONFIG_SCSI_INITIO is not set
> -# CONFIG_SCSI_INIA100 is not set
> -# CONFIG_SCSI_PPA is not set
> -# CONFIG_SCSI_IMM is not set
> -# CONFIG_SCSI_NCR53C406A is not set
> -# CONFIG_SCSI_NCR53C7xx is not set
> -# CONFIG_SCSI_SYM53C8XX_2 is not set
> -# CONFIG_SCSI_NCR53C8XX is not set
> -# CONFIG_SCSI_SYM53C8XX is not set
> -# CONFIG_SCSI_PAS16 is not set
> -# CONFIG_SCSI_PCI2000 is not set
> -# CONFIG_SCSI_PCI2220I is not set
> -# CONFIG_SCSI_PSI240I is not set
> -# CONFIG_SCSI_QLOGIC_FAS is not set
> -# CONFIG_SCSI_QLOGIC_ISP is not set
> -# CONFIG_SCSI_QLOGIC_FC is not set
> -# CONFIG_SCSI_QLOGIC_1280 is not set
> -# CONFIG_SCSI_SIM710 is not set
> -# CONFIG_SCSI_SYM53C416 is not set
> -# CONFIG_SCSI_DC390T is not set
> -# CONFIG_SCSI_T128 is not set
> -# CONFIG_SCSI_U14_34F is not set
> -# CONFIG_SCSI_NSP32 is not set
> -# CONFIG_SCSI_DEBUG is not set
> -
> -#
> -# PCMCIA SCSI adapter support
> -#
> -CONFIG_SCSI_PCMCIA=3Dy
> -CONFIG_PCMCIA_AHA152X=3Dm
> -CONFIG_PCMCIA_FDOMAIN=3Dm
> -CONFIG_PCMCIA_NINJA_SCSI=3Dm
> -# CONFIG_PCMCIA_QLOGIC is not set
> -
> -#
> -# I2O device support
> -#
> -# CONFIG_I2O is not set
> -# CONFIG_I2O_PCI is not set
> -# CONFIG_I2O_BLOCK is not set
> -# CONFIG_I2O_LAN is not set
> -# CONFIG_I2O_SCSI is not set
> -# CONFIG_I2O_PROC is not set
> -
> -#
> -# Network device support
> -#
> -CONFIG_NETDEVICES=3Dy
> -
> -#
> -# ARCnet devices
> -#
> -# CONFIG_ARCNET is not set
> -CONFIG_DUMMY=3Dm
> -CONFIG_BONDING=3Dm
> -CONFIG_EQUALIZER=3Dm
> -CONFIG_TUN=3Dm
> -# CONFIG_ETHERTAP is not set
> -
> -#
> -# Ethernet (10 or 100Mbit)
> -#
> -CONFIG_NET_ETHERNET=3Dy
> -CONFIG_MIPS_AU1X00_ENET=3Dy
> -CONFIG_BCM5222_DUAL_PHY=3Dy
> -# CONFIG_SUNLANCE is not set
> -# CONFIG_HAPPYMEAL is not set
> -# CONFIG_SUNBMAC is not set
> -# CONFIG_SUNQE is not set
> -# CONFIG_SUNGEM is not set
> -# CONFIG_NET_VENDOR_3COM is not set
> -# CONFIG_LANCE is not set
> -# CONFIG_NET_VENDOR_SMC is not set
> -# CONFIG_NET_VENDOR_RACAL is not set
> -# CONFIG_HP100 is not set
> -# CONFIG_NET_ISA is not set
> -# CONFIG_NET_PCI is not set
> -# CONFIG_NET_POCKET is not set
> -
> -#
> -# Ethernet (1000 Mbit)
> -#
> -# CONFIG_ACENIC is not set
> -# CONFIG_DL2K is not set
> -# CONFIG_E1000 is not set
> -# CONFIG_MYRI_SBUS is not set
> -# CONFIG_NS83820 is not set
> -# CONFIG_HAMACHI is not set
> -# CONFIG_YELLOWFIN is not set
> -# CONFIG_R8169 is not set
> -# CONFIG_SK98LIN is not set
> -# CONFIG_TIGON3 is not set
> -# CONFIG_FDDI is not set
> -# CONFIG_HIPPI is not set
> -# CONFIG_PLIP is not set
> -CONFIG_PPP=3Dm
> -CONFIG_PPP_MULTILINK=3Dy
> -CONFIG_PPP_FILTER=3Dy
> -CONFIG_PPP_ASYNC=3Dm
> -CONFIG_PPP_SYNC_TTY=3Dm
> -CONFIG_PPP_DEFLATE=3Dm
> -CONFIG_PPP_BSDCOMP=3Dm
> -CONFIG_PPPOE=3Dm
> -# CONFIG_SLIP is not set
> -
> -#
> -# Wireless LAN (non-hamradio)
> -#
> -CONFIG_NET_RADIO=3Dy
> -# CONFIG_STRIP is not set
> -# CONFIG_WAVELAN is not set
> -# CONFIG_ARLAN is not set
> -# CONFIG_AIRONET4500 is not set
> -# CONFIG_AIRONET4500_NONCS is not set
> -# CONFIG_AIRONET4500_PROC is not set
> -# CONFIG_AIRO is not set
> -# CONFIG_HERMES is not set
> -# CONFIG_PLX_HERMES is not set
> -# CONFIG_PCI_HERMES is not set
> -# CONFIG_PCMCIA_HERMES is not set
> -CONFIG_AIRO_CS=3Dm
> -CONFIG_NET_WIRELESS=3Dy
> -
> -#
> -# Token Ring devices
> -#
> -# CONFIG_TR is not set
> -# CONFIG_NET_FC is not set
> -# CONFIG_RCPCI is not set
> -CONFIG_SHAPER=3Dm
> -
> -#
> -# Wan interfaces
> -#
> -# CONFIG_WAN is not set
> -
> -#
> -# PCMCIA network device support
> -#
> -CONFIG_NET_PCMCIA=3Dy
> -CONFIG_PCMCIA_3C589=3Dm
> -CONFIG_PCMCIA_3C574=3Dm
> -CONFIG_PCMCIA_FMVJ18X=3Dm
> -CONFIG_PCMCIA_PCNET=3Dm
> -CONFIG_PCMCIA_AXNET=3Dm
> -CONFIG_PCMCIA_NMCLAN=3Dm
> -CONFIG_PCMCIA_SMC91C92=3Dm
> -CONFIG_PCMCIA_XIRC2PS=3Dm
> -# CONFIG_ARCNET_COM20020_CS is not set
> -# CONFIG_PCMCIA_IBMTR is not set
> -CONFIG_NET_PCMCIA_RADIO=3Dy
> -# CONFIG_PCMCIA_RAYCS is not set
> -# CONFIG_PCMCIA_NETWAVE is not set
> -# CONFIG_PCMCIA_WAVELAN is not set
> -# CONFIG_AIRONET4500_CS is not set
> -
> -#
> -# Amateur Radio support
> -#
> -# CONFIG_HAMRADIO is not set
> -
> -#
> -# IrDA (infrared) support
> -#
> -# CONFIG_IRDA is not set
> -
> -#
> -# ISDN subsystem
> -#
> -# CONFIG_ISDN is not set
> -
> -#
> -# Input core support
> -#
> -# CONFIG_INPUT is not set
> -# CONFIG_INPUT_KEYBDEV is not set
> -# CONFIG_INPUT_MOUSEDEV is not set
> -# CONFIG_INPUT_JOYDEV is not set
> -# CONFIG_INPUT_EVDEV is not set
> -
> -#
> -# Character devices
> -#
> -CONFIG_VT=3Dy
> -CONFIG_VT_CONSOLE=3Dy
> -# CONFIG_SERIAL is not set
> -# CONFIG_SERIAL_EXTENDED is not set
> -CONFIG_SERIAL_NONSTANDARD=3Dy
> -# CONFIG_COMPUTONE is not set
> -# CONFIG_ROCKETPORT is not set
> -# CONFIG_CYCLADES is not set
> -# CONFIG_DIGIEPCA is not set
> -# CONFIG_DIGI is not set
> -# CONFIG_ESPSERIAL is not set
> -# CONFIG_MOXA_INTELLIO is not set
> -# CONFIG_MOXA_SMARTIO is not set
> -# CONFIG_ISI is not set
> -# CONFIG_SYNCLINK is not set
> -# CONFIG_SYNCLINKMP is not set
> -# CONFIG_N_HDLC is not set
> -# CONFIG_RISCOM8 is not set
> -# CONFIG_SPECIALIX is not set
> -# CONFIG_SX is not set
> -# CONFIG_RIO is not set
> -# CONFIG_STALDRV is not set
> -# CONFIG_SERIAL_TX3912 is not set
> -# CONFIG_SERIAL_TX3912_CONSOLE is not set
> -# CONFIG_SERIAL_TXX9 is not set
> -# CONFIG_SERIAL_TXX9_CONSOLE is not set
> -CONFIG_AU1X00_UART=3Dy
> -CONFIG_AU1X00_SERIAL_CONSOLE=3Dy
> -# CONFIG_AU1X00_USB_TTY is not set
> -# CONFIG_AU1X00_USB_RAW is not set
> -# CONFIG_TXX927_SERIAL is not set
> -CONFIG_UNIX98_PTYS=3Dy
> -CONFIG_UNIX98_PTY_COUNT=3D256
> -# CONFIG_PRINTER is not set
> -# CONFIG_PPDEV is not set
> -# CONFIG_TIPAR is not set
> -
> -#
> -# I2C support
> -#
> -CONFIG_I2C=3Dm
> -CONFIG_I2C_ALGOBIT=3Dm
> -# CONFIG_I2C_PHILIPSPAR is not set
> -# CONFIG_I2C_ELV is not set
> -# CONFIG_I2C_VELLEMAN is not set
> -# CONFIG_SCx200_I2C is not set
> -# CONFIG_SCx200_ACB is not set
> -# CONFIG_I2C_ALGOPCF is not set
> -CONFIG_I2C_CHARDEV=3Dm
> -# CONFIG_I2C_PROC is not set
> -
> -#
> -# Mice
> -#
> -# CONFIG_BUSMOUSE is not set
> -# CONFIG_MOUSE is not set
> -
> -#
> -# Joysticks
> -#
> -# CONFIG_INPUT_GAMEPORT is not set
> -# CONFIG_QIC02_TAPE is not set
> -# CONFIG_IPMI_HANDLER is not set
> -# CONFIG_IPMI_PANIC_EVENT is not set
> -# CONFIG_IPMI_DEVICE_INTERFACE is not set
> -# CONFIG_IPMI_KCS is not set
> -# CONFIG_IPMI_WATCHDOG is not set
> -
> -#
> -# Watchdog Cards
> -#
> -# CONFIG_WATCHDOG is not set
> -# CONFIG_SCx200_GPIO is not set
> -# CONFIG_AMD_PM768 is not set
> -# CONFIG_NVRAM is not set
> -# CONFIG_RTC is not set
> -# CONFIG_DTLK is not set
> -# CONFIG_R3964 is not set
> -# CONFIG_APPLICOM is not set
> -
> -#
> -# Ftape, the floppy tape device driver
> -#
> -# CONFIG_FTAPE is not set
> -# CONFIG_AGP is not set
> -# CONFIG_DRM is not set
> -
> -#
> -# PCMCIA character devices
> -#
> -# CONFIG_PCMCIA_SERIAL_CS is not set
> -# CONFIG_SYNCLINK_CS is not set
> -# CONFIG_AU1X00_GPIO is not set
> -# CONFIG_TS_AU1X00_ADS7846 is not set
> -
> -#
> -# File systems
> -#
> -# CONFIG_QUOTA is not set
> -CONFIG_AUTOFS_FS=3Dm
> -CONFIG_AUTOFS4_FS=3Dm
> -CONFIG_REISERFS_FS=3Dm
> -# CONFIG_REISERFS_CHECK is not set
> -# CONFIG_REISERFS_PROC_INFO is not set
> -# CONFIG_ADFS_FS is not set
> -# CONFIG_ADFS_FS_RW is not set
> -# CONFIG_AFFS_FS is not set
> -# CONFIG_HFS_FS is not set
> -# CONFIG_BEFS_FS is not set
> -# CONFIG_BEFS_DEBUG is not set
> -# CONFIG_BFS_FS is not set
> -CONFIG_EXT3_FS=3Dm
> -CONFIG_JBD=3Dm
> -# CONFIG_JBD_DEBUG is not set
> -CONFIG_FAT_FS=3Dm
> -# CONFIG_MSDOS_FS is not set
> -# CONFIG_UMSDOS_FS is not set
> -CONFIG_VFAT_FS=3Dm
> -# CONFIG_EFS_FS is not set
> -# CONFIG_JFFS_FS is not set
> -CONFIG_JFFS2_FS=3Dy
> -CONFIG_JFFS2_FS_DEBUG=3D2
> -# CONFIG_CRAMFS is not set
> -CONFIG_TMPFS=3Dy
> -CONFIG_RAMFS=3Dy
> -CONFIG_ISO9660_FS=3Dm
> -CONFIG_JOLIET=3Dy
> -CONFIG_ZISOFS=3Dy
> -# CONFIG_JFS_FS is not set
> -# CONFIG_JFS_DEBUG is not set
> -# CONFIG_JFS_STATISTICS is not set
> -# CONFIG_MINIX_FS is not set
> -# CONFIG_VXFS_FS is not set
> -# CONFIG_NTFS_FS is not set
> -# CONFIG_NTFS_RW is not set
> -# CONFIG_HPFS_FS is not set
> -CONFIG_PROC_FS=3Dy
> -CONFIG_DEVFS_FS=3Dy
> -CONFIG_DEVFS_MOUNT=3Dy
> -# CONFIG_DEVFS_DEBUG is not set
> -CONFIG_DEVPTS_FS=3Dy
> -# CONFIG_QNX4FS_FS is not set
> -# CONFIG_QNX4FS_RW is not set
> -# CONFIG_ROMFS_FS is not set
> -CONFIG_EXT2_FS=3Dm
> -# CONFIG_SYSV_FS is not set
> -# CONFIG_UDF_FS is not set
> -# CONFIG_UDF_RW is not set
> -# CONFIG_UFS_FS is not set
> -# CONFIG_UFS_FS_WRITE is not set
> -
> -#
> -# Network File Systems
> -#
> -# CONFIG_CODA_FS is not set
> -# CONFIG_INTERMEZZO_FS is not set
> -CONFIG_NFS_FS=3Dy
> -CONFIG_NFS_V3=3Dy
> -CONFIG_ROOT_NFS=3Dy
> -CONFIG_NFSD=3Dy
> -CONFIG_NFSD_V3=3Dy
> -# CONFIG_NFSD_TCP is not set
> -CONFIG_SUNRPC=3Dy
> -CONFIG_LOCKD=3Dy
> -CONFIG_LOCKD_V4=3Dy
> -CONFIG_SMB_FS=3Dm
> -# CONFIG_SMB_NLS_DEFAULT is not set
> -# CONFIG_NCP_FS is not set
> -# CONFIG_NCPFS_PACKET_SIGNING is not set
> -# CONFIG_NCPFS_IOCTL_LOCKING is not set
> -# CONFIG_NCPFS_STRONG is not set
> -# CONFIG_NCPFS_NFS_NS is not set
> -# CONFIG_NCPFS_OS2_NS is not set
> -# CONFIG_NCPFS_SMALLDOS is not set
> -# CONFIG_NCPFS_NLS is not set
> -# CONFIG_NCPFS_EXTRAS is not set
> -CONFIG_ZISOFS_FS=3Dm
> -
> -#
> -# Partition Types
> -#
> -# CONFIG_PARTITION_ADVANCED is not set
> -CONFIG_MSDOS_PARTITION=3Dy
> -CONFIG_SMB_NLS=3Dy
> -CONFIG_NLS=3Dy
> -
> -#
> -# Native Language Support
> -#
> -CONFIG_NLS_DEFAULT=3D"iso8859-1"
> -# CONFIG_NLS_CODEPAGE_437 is not set
> -# CONFIG_NLS_CODEPAGE_737 is not set
> -# CONFIG_NLS_CODEPAGE_775 is not set
> -# CONFIG_NLS_CODEPAGE_850 is not set
> -# CONFIG_NLS_CODEPAGE_852 is not set
> -# CONFIG_NLS_CODEPAGE_855 is not set
> -# CONFIG_NLS_CODEPAGE_857 is not set
> -# CONFIG_NLS_CODEPAGE_860 is not set
> -# CONFIG_NLS_CODEPAGE_861 is not set
> -# CONFIG_NLS_CODEPAGE_862 is not set
> -# CONFIG_NLS_CODEPAGE_863 is not set
> -# CONFIG_NLS_CODEPAGE_864 is not set
> -# CONFIG_NLS_CODEPAGE_865 is not set
> -# CONFIG_NLS_CODEPAGE_866 is not set
> -# CONFIG_NLS_CODEPAGE_869 is not set
> -# CONFIG_NLS_CODEPAGE_936 is not set
> -# CONFIG_NLS_CODEPAGE_950 is not set
> -# CONFIG_NLS_CODEPAGE_932 is not set
> -# CONFIG_NLS_CODEPAGE_949 is not set
> -# CONFIG_NLS_CODEPAGE_874 is not set
> -# CONFIG_NLS_ISO8859_8 is not set
> -# CONFIG_NLS_CODEPAGE_1250 is not set
> -# CONFIG_NLS_CODEPAGE_1251 is not set
> -# CONFIG_NLS_ISO8859_1 is not set
> -# CONFIG_NLS_ISO8859_2 is not set
> -# CONFIG_NLS_ISO8859_3 is not set
> -# CONFIG_NLS_ISO8859_4 is not set
> -# CONFIG_NLS_ISO8859_5 is not set
> -# CONFIG_NLS_ISO8859_6 is not set
> -# CONFIG_NLS_ISO8859_7 is not set
> -# CONFIG_NLS_ISO8859_9 is not set
> -# CONFIG_NLS_ISO8859_13 is not set
> -# CONFIG_NLS_ISO8859_14 is not set
> -# CONFIG_NLS_ISO8859_15 is not set
> -# CONFIG_NLS_KOI8_R is not set
> -# CONFIG_NLS_KOI8_U is not set
> -# CONFIG_NLS_UTF8 is not set
> -
> -#
> -# Multimedia devices
> -#
> -CONFIG_VIDEO_DEV=3Dm
> -
> -#
> -# Video For Linux
> -#
> -CONFIG_VIDEO_PROC_FS=3Dy
> -# CONFIG_I2C_PARPORT is not set
> -CONFIG_VIDEO_BT848=3Dm
> -# CONFIG_VIDEO_PMS is not set
> -CONFIG_VIDEO_BWQCAM=3Dm
> -CONFIG_VIDEO_CQCAM=3Dm
> -CONFIG_VIDEO_W9966=3Dm
> -CONFIG_VIDEO_CPIA=3Dm
> -# CONFIG_VIDEO_CPIA_PP is not set
> -CONFIG_VIDEO_CPIA_USB=3Dm
> -# CONFIG_VIDEO_SAA5249 is not set
> -# CONFIG_TUNER_3036 is not set
> -# CONFIG_VIDEO_STRADIS is not set
> -# CONFIG_VIDEO_ZORAN is not set
> -# CONFIG_VIDEO_ZORAN_BUZ is not set
> -# CONFIG_VIDEO_ZORAN_DC10 is not set
> -# CONFIG_VIDEO_ZORAN_LML33 is not set
> -# CONFIG_VIDEO_ZR36120 is not set
> -# CONFIG_VIDEO_MEYE is not set
> -
> -#
> -# Radio Adapters
> -#
> -# CONFIG_RADIO_GEMTEK_PCI is not set
> -# CONFIG_RADIO_MAXIRADIO is not set
> -# CONFIG_RADIO_MAESTRO is not set
> -# CONFIG_RADIO_MIROPCM20 is not set
> -
> -#
> -# Console drivers
> -#
> -CONFIG_VGA_CONSOLE=3Dy
> -# CONFIG_MDA_CONSOLE is not set
> -
> -#
> -# Frame-buffer support
> -#
> -CONFIG_FB=3Dy
> -CONFIG_DUMMY_CONSOLE=3Dy
> -# CONFIG_FB_RIVA is not set
> -# CONFIG_FB_CLGEN is not set
> -# CONFIG_FB_PM2 is not set
> -# CONFIG_FB_PM3 is not set
> -# CONFIG_FB_CYBER2000 is not set
> -# CONFIG_FB_MATROX is not set
> -# CONFIG_FB_ATY is not set
> -# CONFIG_FB_RADEON is not set
> -# CONFIG_FB_ATY128 is not set
> -# CONFIG_FB_INTEL is not set
> -# CONFIG_FB_SIS is not set
> -# CONFIG_FB_NEOMAGIC is not set
> -# CONFIG_FB_3DFX is not set
> -# CONFIG_FB_VOODOO1 is not set
> -# CONFIG_FB_TRIDENT is not set
> -# CONFIG_FB_E1356 is not set
> -CONFIG_FB_MB86290=3Dy
> -CONFIG_FB_LYNX3DM=3Dy
> -# CONFIG_FB_VIRTUAL is not set
> -CONFIG_FBCON_ADVANCED=3Dy
> -# CONFIG_FBCON_MFB is not set
> -# CONFIG_FBCON_CFB2 is not set
> -# CONFIG_FBCON_CFB4 is not set
> -# CONFIG_FBCON_CFB8 is not set
> -CONFIG_FBCON_CFB16=3Dy
> -# CONFIG_FBCON_CFB24 is not set
> -# CONFIG_FBCON_CFB32 is not set
> -# CONFIG_FBCON_AFB is not set
> -# CONFIG_FBCON_ILBM is not set
> -# CONFIG_FBCON_IPLAN2P2 is not set
> -# CONFIG_FBCON_IPLAN2P4 is not set
> -# CONFIG_FBCON_IPLAN2P8 is not set
> -# CONFIG_FBCON_MAC is not set
> -# CONFIG_FBCON_VGA_PLANES is not set
> -# CONFIG_FBCON_VGA is not set
> -# CONFIG_FBCON_HGA is not set
> -# CONFIG_FBCON_FONTWIDTH8_ONLY is not set
> -CONFIG_FBCON_FONTS=3Dy
> -CONFIG_FONT_8x8=3Dy
> -CONFIG_FONT_8x16=3Dy
> -# CONFIG_FONT_SUN8x16 is not set
> -# CONFIG_FONT_SUN12x22 is not set
> -# CONFIG_FONT_6x11 is not set
> -# CONFIG_FONT_PEARL_8x8 is not set
> -# CONFIG_FONT_ACORN_8x8 is not set
> -
> -#
> -# Sound
> -#
> -CONFIG_SOUND=3Dy
> -# CONFIG_SOUND_ALI5455 is not set
> -# CONFIG_SOUND_BT878 is not set
> -# CONFIG_SOUND_CMPCI is not set
> -# CONFIG_SOUND_EMU10K1 is not set
> -# CONFIG_MIDI_EMU10K1 is not set
> -# CONFIG_SOUND_FUSION is not set
> -# CONFIG_SOUND_CS4281 is not set
> -# CONFIG_SOUND_ES1370 is not set
> -# CONFIG_SOUND_ES1371 is not set
> -# CONFIG_SOUND_ESSSOLO1 is not set
> -# CONFIG_SOUND_MAESTRO is not set
> -# CONFIG_SOUND_MAESTRO3 is not set
> -# CONFIG_SOUND_FORTE is not set
> -# CONFIG_SOUND_ICH is not set
> -# CONFIG_SOUND_RME96XX is not set
> -# CONFIG_SOUND_SONICVIBES is not set
> -CONFIG_SOUND_AU1X00=3Dy
> -# CONFIG_SOUND_TRIDENT is not set
> -# CONFIG_SOUND_MSNDCLAS is not set
> -# CONFIG_SOUND_MSNDPIN is not set
> -# CONFIG_SOUND_VIA82CXXX is not set
> -# CONFIG_MIDI_VIA82CXXX is not set
> -# CONFIG_SOUND_OSS is not set
> -# CONFIG_SOUND_TVMIXER is not set
> -
> -#
> -# USB support
> -#
> -CONFIG_USB=3Dy
> -# CONFIG_USB_DEBUG is not set
> -# CONFIG_USB_DEVICEFS is not set
> -# CONFIG_USB_BANDWIDTH is not set
> -# CONFIG_USB_EHCI_HCD is not set
> -# CONFIG_USB_UHCI is not set
> -# CONFIG_USB_UHCI_ALT is not set
> -CONFIG_USB_OHCI=3Dy
> -CONFIG_USB_NON_PCI_OHCI=3Dy
> -# CONFIG_USB_AUDIO is not set
> -# CONFIG_USB_EMI26 is not set
> -# CONFIG_USB_BLUETOOTH is not set
> -# CONFIG_USB_MIDI is not set
> -CONFIG_USB_STORAGE=3Dm
> -CONFIG_USB_STORAGE_DEBUG=3Dy
> -# CONFIG_USB_STORAGE_DATAFAB is not set
> -# CONFIG_USB_STORAGE_FREECOM is not set
> -# CONFIG_USB_STORAGE_ISD200 is not set
> -# CONFIG_USB_STORAGE_DPCM is not set
> -# CONFIG_USB_STORAGE_HP8200e is not set
> -CONFIG_USB_STORAGE_SDDR09=3Dy
> -# CONFIG_USB_STORAGE_SDDR55 is not set
> -CONFIG_USB_STORAGE_JUMPSHOT=3Dy
> -# CONFIG_USB_ACM is not set
> -CONFIG_USB_PRINTER=3Dm
> -CONFIG_USB_HID=3Dm
> -# CONFIG_USB_HIDINPUT is not set
> -# CONFIG_USB_HIDDEV is not set
> -# CONFIG_USB_KBD is not set
> -# CONFIG_USB_MOUSE is not set
> -# CONFIG_USB_AIPTEK is not set
> -# CONFIG_USB_WACOM is not set
> -# CONFIG_USB_KBTAB is not set
> -# CONFIG_USB_POWERMATE is not set
> -# CONFIG_USB_DC2XX is not set
> -# CONFIG_USB_MDC800 is not set
> -# CONFIG_USB_SCANNER is not set
> -# CONFIG_USB_MICROTEK is not set
> -# CONFIG_USB_HPUSBSCSI is not set
> -CONFIG_USB_IBMCAM=3Dm
> -CONFIG_USB_KONICAWC=3Dm
> -CONFIG_USB_OV511=3Dm
> -CONFIG_USB_PWC=3Dm
> -CONFIG_USB_SE401=3Dm
> -CONFIG_USB_STV680=3Dm
> -CONFIG_USB_VICAM=3Dm
> -# CONFIG_USB_DSBR is not set
> -CONFIG_USB_DABUSB=3Dm
> -CONFIG_USB_PEGASUS=3Dm
> -CONFIG_USB_RTL8150=3Dm
> -CONFIG_USB_KAWETH=3Dm
> -CONFIG_USB_CATC=3Dm
> -CONFIG_USB_CDCETHER=3Dm
> -CONFIG_USB_USBNET=3Dm
> -CONFIG_USB_USS720=3Dm
> -
> -#
> -# USB Serial Converter support
> -#
> -CONFIG_USB_SERIAL=3Dm
> -# CONFIG_USB_SERIAL_DEBUG is not set
> -CONFIG_USB_SERIAL_GENERIC=3Dy
> -# CONFIG_USB_SERIAL_BELKIN is not set
> -# CONFIG_USB_SERIAL_WHITEHEAT is not set
> -# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> -# CONFIG_USB_SERIAL_EMPEG is not set
> -# CONFIG_USB_SERIAL_FTDI_SIO is not set
> -# CONFIG_USB_SERIAL_VISOR is not set
> -# CONFIG_USB_SERIAL_IPAQ is not set
> -# CONFIG_USB_SERIAL_IR is not set
> -# CONFIG_USB_SERIAL_EDGEPORT is not set
> -# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> -# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> -# CONFIG_USB_SERIAL_KEYSPAN is not set
> -# CONFIG_USB_SERIAL_MCT_U232 is not set
> -# CONFIG_USB_SERIAL_KLSI is not set
> -# CONFIG_USB_SERIAL_KOBIL_SCT is not set
> -# CONFIG_USB_SERIAL_PL2303 is not set
> -# CONFIG_USB_SERIAL_CYBERJACK is not set
> -# CONFIG_USB_SERIAL_XIRCOM is not set
> -# CONFIG_USB_SERIAL_OMNINET is not set
> -# CONFIG_USB_RIO500 is not set
> -# CONFIG_USB_AUERSWALD is not set
> -# CONFIG_USB_TIGL is not set
> -# CONFIG_USB_BRLVGER is not set
> -CONFIG_USB_LCD=3Dm
> -
> -#
> -# Bluetooth support
> -#
> -# CONFIG_BLUEZ is not set
> -
> -#
> -# Kernel hacking
> -#
> -CONFIG_CROSSCOMPILE=3Dy
> -# CONFIG_RUNTIME_DEBUG is not set
> -# CONFIG_KGDB is not set
> -# CONFIG_GDB_CONSOLE is not set
> -# CONFIG_MAGIC_SYSRQ is not set
> -# CONFIG_MIPS_UNCACHED is not set
> -
> -#
> -# Library routines
> -#
> -CONFIG_ZLIB_INFLATE=3Dy
> -CONFIG_ZLIB_DEFLATE=3Dy
> diff --git a/recipes/linux/linux-xxs1500-2.4.21/zboot-Makefile-flags.diff=
 b/recipes/linux/linux-xxs1500-2.4.21/zboot-Makefile-flags.diff
> deleted file mode 100644
> index da17a12..0000000
> --- a/recipes/linux/linux-xxs1500-2.4.21/zboot-Makefile-flags.diff
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- arch/mips/zboot/Makefile.o 2004-10-09 19:44:27.380145288 +0200
> -+++ arch/mips/zboot/Makefile =A0 2004-10-09 19:46:17.643382728 +0200
> -@@ -27,7 +27,7 @@
> -
> - CFLAGS =A0 =A0 =A0 =A0:=3D $(CPPFLAGS) -O2 -D__BOOTER__ \
> - =A0 =A0 =A0 -fomit-frame-pointer -fno-strict-aliasing -fno-common \
> -- =A0 =A0 =A0-G 0 -mno-abicalls -fno-pic -mcpu=3Dr4600 -mips2 \
> -+ =A0 =A0 =A0-G 0 -mno-abicalls -fno-pic -mabi=3D32 -march=3Dmips32 -mip=
s32 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -I$(TOPDIR)/arch/$(ARCH)/zboot/include \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -I$(TOPDIR)/include/asm
> - AFLAGS =A0 =A0 =A0 =A0+=3D -D__BOOTER__
> diff --git a/recipes/linux/linux-xxs1500_2.4.21.bb b/recipes/linux/linux-=
xxs1500_2.4.21.bb
> deleted file mode 100644
> index ec51b85..0000000
> --- a/recipes/linux/linux-xxs1500_2.4.21.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SECTION =3D "kernel"
> -DESCRIPTION =3D "Linux kernel for mycable xxs1500"
> -LICENSE =3D "GPLv2"
> -KV =3D "2.4.21"
> -PV =3D "${KV}"
> -
> -SRC_URI =3D "http://mycable.de/xxs1500/cms/index.php?download=3Dlinux-2.=
4.21-20040514.1522.tgz \
> - =A0 =A0 =A0 file://Makefile \
> - =A0 =A0 =A0 file://defconfig-xxs1500 \
> - =A0 =A0 =A0 file://zboot-Makefile-flags.diff;striplevel=3D0"
> -
> -S =3D "${WORKDIR}/linux"
> -
> -inherit kernel
> -
> -COMPATIBLE_MACHINE =3D "xxs1500"
> -
> -PACKAGE_ARCH =3D "xxs1500"
> -ARCH =3D "mips"
> -KERNEL_OUTPUT =3D "arch/mips/zboot/images/xxs1500.flash.srec"
> -KERNEL_IMAGETYPE =3D "zImage.flash"
> -KERNEL_IMAGEDEST =3D "tmp"
> -
> -do_configure_prepend() {
> - =A0 =A0 =A0 install -m 0644 ${WORKDIR}/defconfig-xxs1500 ${S}/.config
> - =A0 =A0 =A0 cp ${WORKDIR}/Makefile ${S}/arch/mips
> -}
> -
> -FILES_kernel +=3D " /tmp"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


