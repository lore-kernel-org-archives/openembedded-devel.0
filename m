Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 446DA7829E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:54:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 77so242702wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=w4YaQgfanQn4cjFOUemVZGNE26ocQhUXOJTNE2nx+Pc=;
	b=RYI2SZPZpBKJSUHhjUu50fKHKpdy9FN6bsVw7al+TRWpjaEnhEBrsjG6SfQprWGTK6
	X1KIA0O7JJR/dA4CUDR/u6LiOrju5bXH73TqBuWRAHgpPS8GUgEbs7A42mQgwTCtgGI5
	YFK8a1o41iNWePeqOFASA5DGhu8tf431S10GQVIrFTEOooKobnldMDSZVgxgNAkguU00
	AcVzZfH2Anmf6oczT2RC+o5BA1Te8O7fsIFR8Nwuce2ghclOnrifhNSGrahookWzNEb+
	y+MfFPuRMXXeD24XZD4dC8jR7Zq2dCpMoX2mfvuNxaq91dUpa6eNd3jIXULOU6n4qYvy
	gN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=w4YaQgfanQn4cjFOUemVZGNE26ocQhUXOJTNE2nx+Pc=;
	b=SDyQSwDlLNHYIa41Rwg6SQ2/M1gigLmbs8C5I0O4TlxtsBbmuDUkLkFmxw0386fbJq
	XCBc+yYuxJByiolO/hC3222DdLvqBxQ3PyQRiaLBOfszt2CU6kZG2TLLONbokFEHzvHs
	WhPpqPiCG8d7Km7NdWC8gGWDRjBlrQKA99YMfPISOBwpWMEGTIiXEO4Tre6erUQypJM4
	Z/Z5uPXV9yiQI2EA8dOkVDlQJ+AEMr1g1XPhUSuS63zmlA5Ax7+0a/T8FQ3l5q6Pu55S
	9f9yS8MhrbZuFDav1o2sBkNNjKLlif4eH2Arq0gw85302ZO+WpiyQm/QrdeAD6h+exvl
	M8ZA==
X-Gm-Message-State: AKS2vOwW86v3ZooKd4Va/brgjQh8uNKA2yjA12jMO3ORj8IDPA6LI1WC
	7n9ovyF9+kh5ag==
X-Received: by 10.223.130.199 with SMTP id 65mr3477775wrc.150.1497365674198;
	Tue, 13 Jun 2017 07:54:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m191sm15617995wmg.30.2017.06.13.07.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 07:54:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Jun 2017 16:54:32 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170613145432.GB3088@jama>
References: <20170608235641.16251-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170608235641.16251-1-raj.khem@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V4] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Tue, 13 Jun 2017 14:54:34 -0000
X-Groupsio-MsgNum: 67145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 04:56:41PM -0700, Khem Raj wrote:
> Helps fixing build issues with gcc7
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Acked-by: Koen Kooi <koen.kooi@linaro.org>
> Acked-by: Fathi Boudra <fathi.boudra@linaro.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2 -> v3
> - move the LDFLAGS after CFLAGS
> v3 -> v4
> - Fix point-to-int incompatibilities seen on x86 with off_t being 64bit
> - Fix printf formatting issues

I'm sorry but still fails to build for qemux86:
http://errors.yoctoproject.org/Errors/Details/145075/
>=20
>  ...01-Add-correct-printf-qualifier-for-off_t.patch | 35 ++++++++++
>  ...e-poll.h-instead-of-deprecated-sys-poll.h.patch | 48 ++++++++++++++
>  ...-C99-defined-format-for-printing-uint64_t.patch | 53 +++++++++++++++
>  ...efine-__SWORD_TYPE-if-not-defined-by-libc.patch | 33 ++++++++++
>  .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch        | 30 +++++++++
>  ...ntptr_t-to-fix-pointer-to-int-cast-issues.patch | 76 ++++++++++++++++=
++++++
>  meta-oe/recipes-test/fwts/fwts_git.bb              | 12 +++-
>  7 files changed, 285 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Add-correct-print=
f-qualifier-for-off_t.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-in=
stead-of-deprecated-sys-poll.h.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-f=
ormat-for-printing-uint64_t.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TY=
PE-if-not-defined-by-libc.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZ=
E.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-f=
ix-pointer-to-int-cast-issues.patch
>=20
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-quali=
fier-for-off_t.patch b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-prin=
tf-qualifier-for-off_t.patch
> new file mode 100644
> index 000000000..891185de6
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-fo=
r-off_t.patch
> @@ -0,0 +1,35 @@
> +From 232daf5fca6fb52cced5e810f2601fe1a71b96d8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 8 Jun 2017 16:49:50 -0700
> +Subject: [PATCH 1/3] Add correct printf qualifier for off_t
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/bios/ebda_region/ebda_region.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/bios/ebda_region/ebda_region.c b/src/bios/ebda_region/e=
bda_region.c
> +index 54768a95..fec04445 100644
> +--- a/src/bios/ebda_region/ebda_region.c
> ++++ b/src/bios/ebda_region/ebda_region.c
> +@@ -83,7 +83,7 @@ static int ebda_test1(fwts_framework *fw)
> + 	if ((entry !=3D NULL) &&
> + 	    (entry->type =3D=3D FWTS_MEMORY_MAP_RESERVED ||
> + 	     entry->type =3D=3D FWTS_MEMORY_MAP_ACPI)) {
> +-		fwts_passed(fw, "EBDA region mapped at 0x%lx and reserved as a %" PRI=
d64
> ++		fwts_passed(fw, "EBDA region mapped at 0x%jdx and reserved as a %" PR=
Id64
> + 			"K region in the %s table at 0x%" PRIx64 "..0x%" PRIx64 ".",
> + 			ebda_addr,
> + 			(entry->end_address - entry->start_address) / 1024,
> +@@ -93,7 +93,7 @@ static int ebda_test1(fwts_framework *fw)
> + 	} else
> + 		fwts_failed(fw, LOG_LEVEL_MEDIUM,
> + 			"EBDAMappedNotReserved",
> +-			"EBDA region mapped at 0x%lx but not reserved in the %s table.",
> ++			"EBDA region mapped at 0x%jdx but not reserved in the %s table.",
> + 			ebda_addr, memory_map_name);
> + 	=09
> + 	return FWTS_OK;
> +--=20
> +2.13.1
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-o=
f-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0001-Include=
-poll.h-instead-of-deprecated-sys-poll.h.patch
> new file mode 100644
> index 000000000..8ad078936
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-depre=
cated-sys-poll.h.patch
> @@ -0,0 +1,48 @@
> +From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:25:09 -0700
> +Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_ipmi.c   | 3 ++-
> + src/lib/src/fwts_pipeio.c | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
> +index cbb27611..70d11cfa 100644
> +--- a/src/lib/src/fwts_ipmi.c
> ++++ b/src/lib/src/fwts_ipmi.c
> +@@ -18,10 +18,11 @@
> +  *
> +  */
> +=20
> ++#include <poll.h>
> ++
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <fcntl.h>
> +-#include <sys/poll.h>
> + #include <sys/ioctl.h>
> + #include <linux/ipmi.h>
> +=20
> +diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
> +index fd719640..bdc5b2ea 100644
> +--- a/src/lib/src/fwts_pipeio.c
> ++++ b/src/lib/src/fwts_pipeio.c
> +@@ -30,9 +30,9 @@
> + #include <stdlib.h>
> + #include <string.h>
> + #include <paths.h>
> ++#include <poll.h>
> +=20
> + #include <sys/param.h>
> +-#include <sys/poll.h>
> + #include <sys/types.h>
> + #include <sys/wait.h>
> + #include <errno.h>
> +--=20
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-f=
or-printing-uint64_t.patch b/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-de=
fined-format-for-printing-uint64_t.patch
> new file mode 100644
> index 000000000..35ce883a2
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-prin=
ting-uint64_t.patch
> @@ -0,0 +1,53 @@
> +From 25f18b9ac37960dc12a3b648a5c866bd56ef2cbe Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 8 Jun 2017 16:50:23 -0700
> +Subject: [PATCH 2/3] Add C99 defined format for printing uint64_t
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/opal/reserv_mem.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/opal/reserv_mem.c b/src/opal/reserv_mem.c
> +index eeec2947..f0672e05 100644
> +--- a/src/opal/reserv_mem.c
> ++++ b/src/opal/reserv_mem.c
> +@@ -185,7 +185,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
> + 		regions[j].start =3D (uint64_t)be64toh(ranges[2 * j]);
> + 		regions[j].len =3D (uint64_t)be64toh(ranges[2 * j + 1]);
> + 		fwts_log_info(fw, "Region name %80s"
> +-			" start: 0x%08lx, len: 0x%08lx\n",
> ++			" start: 0x%08" PRIx64 ", len: 0x%08" PRIx64 "\n",
> + 			regions[j].name, regions[j].start, regions[j].len);
> + 	}
> +=20
> +@@ -248,7 +248,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
> + 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
> + 					"ImageSizeMismatch",
> + 					"Mismatch in homer-image size, "
> +-					"expected: 0x%lx, actual: 0x%lx",
> ++					"expected: 0x%" PRIx64 ", actual: 0x%" PRIx64 "",
> + 					configstruct.homer, regions[j].len);
> + 				ok =3D false;
> + 			} else
> +@@ -261,7 +261,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
> + 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
> + 					"ImageSizeMismatch",
> + 					"Mismatch in slw-image size, "
> +-					"expected: 0x%lx, actual: 0x%lx",
> ++					"expected: 0x%" PRIx64 ", actual: 0x%" PRIx64 "",
> + 					configstruct.slw, regions[j].len);
> + 				ok =3D false;
> + 			} else
> +@@ -274,7 +274,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
> + 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
> + 					"ImageSizeMismatch",
> + 					"Mismatch in occ-common-area size, "
> +-					"expected: 0x%lx, actual: 0x%lx",
> ++					"expected: 0x%" PRIx64", actual: 0x%" PRIx64"",
> + 					configstruct.occ_common,
> + 					regions[j].len);
> + 				ok =3D false;
> +--=20
> +2.13.1
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-n=
ot-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWO=
RD_TYPE-if-not-defined-by-libc.patch
> new file mode 100644
> index 000000000..3b83ca57c
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defi=
ned-by-libc.patch
> @@ -0,0 +1,33 @@
> +From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:37:20 -0700
> +Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
> +
> +__SWORD_TYPE is internal to glibc, therefore
> +check and define it if needed e.g. on musl
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_uefi.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
> +index 1f9d31fa..2d925f8d 100644
> +--- a/src/lib/src/fwts_uefi.c
> ++++ b/src/lib/src/fwts_uefi.c
> +@@ -59,6 +59,10 @@ typedef struct {
> + #define UEFI_IFACE_SYSFS		(2)	/* sysfs */
> + #define UEFI_IFACE_EFIVARS		(3)	/* efivar fs */
> +=20
> ++#ifndef __SWORD_TYPE
> ++typedef __typeof__( ((struct statfs *)0)->f_type )	__SWORD_TYPE;
> ++#endif
> ++
> + /* File system magic numbers */
> + #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
> + #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
> +--=20
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch=
 b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> new file mode 100644
> index 000000000..f84fbffd8
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> @@ -0,0 +1,30 @@
> +From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:39:28 -0700
> +Subject: [PATCH 3/3] Undefine PAGE_SIZE
> +
> +musl defines PAGE_SIZE and build complains
> +of multiple definitions
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_acpi_tables.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tabl=
es.c
> +index 1d4fc705..71023ad2 100644
> +--- a/src/lib/src/fwts_acpi_tables.c
> ++++ b/src/lib/src/fwts_acpi_tables.c
> +@@ -42,6 +42,7 @@
> + #define BIOS_START	(0x000e0000)		/* Start of BIOS memory */
> + #define BIOS_END  	(0x000fffff)		/* End of BIOS memory */
> + #define BIOS_LENGTH	(BIOS_END - BIOS_START)	/* Length of BIOS memory */
> ++#undef PAGE_SIZE
> + #define PAGE_SIZE	(4096)
> +=20
> + static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
> +--=20
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-poin=
ter-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0003-use-intp=
tr_t-to-fix-pointer-to-int-cast-issues.patch
> new file mode 100644
> index 000000000..3cd3fbbc1
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-=
int-cast-issues.patch
> @@ -0,0 +1,76 @@
> +From d0d76820efe51dd404d381fc4c46544008e757dd Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 8 Jun 2017 16:50:59 -0700
> +Subject: [PATCH 3/3] use intptr_t to fix pointer-to-int-cast issues
> +
> +uintptr_t is guaranteed to be wide enough that
> +converting a void* to uintptr_t and back again
> +will yield the original pointer value
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_acpi_tables.c | 4 ++--
> + src/lib/src/fwts_mmap.c        | 2 +-
> + src/lib/src/fwts_smbios.c      | 4 ++--
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tabl=
es.c
> +index 832f8d66..d0006529 100644
> +--- a/src/lib/src/fwts_acpi_tables.c
> ++++ b/src/lib/src/fwts_acpi_tables.c
> +@@ -150,7 +150,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts=
_framework *fw, void *addr,
> + 	fwts_acpi_table_rsdp *rsdp =3D NULL;
> + 	*rsdp_len =3D 0;
> +=20
> +-	if ((mem =3D fwts_mmap((off_t)addr, sizeof(fwts_acpi_table_rsdp))) =3D=
=3D FWTS_MAP_FAILED)
> ++	if ((mem =3D fwts_mmap((uintptr_t)addr, sizeof(fwts_acpi_table_rsdp)))=
 =3D=3D FWTS_MAP_FAILED)
> + 		return NULL;
> +=20
> + 	if (fwts_safe_memread(mem, sizeof(fwts_acpi_table_rsdp)) !=3D FWTS_OK)=
 {
> +@@ -456,7 +456,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_=
framework *fw)
> + 	if ((rsdp =3D fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) =3D=3D NUL=
L)
> + 		return FWTS_ERROR;
> +=20
> +-	fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(off_t)rsdp_addr, rsdp_len=
, FWTS_ACPI_TABLE_FROM_FIRMWARE);
> ++	fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(uintptr_t)rsdp_addr, rsdp=
_len, FWTS_ACPI_TABLE_FROM_FIRMWARE);
> +=20
> + 	/* Load any tables from XSDT if it's valid */
> + 	if (rsdp->xsdt_address) {
> +diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
> +index a09f688e..9fe6329a 100644
> +--- a/src/lib/src/fwts_mmap.c
> ++++ b/src/lib/src/fwts_mmap.c
> +@@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
> + 	off_t offset;
> +=20
> + 	page_size =3D fwts_page_size();
> +-	offset =3D ((off_t)(mem)) & (page_size - 1);
> ++	offset =3D ((uintptr_t)(mem)) & (page_size - 1);
> +=20
> + 	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
> + 		return FWTS_ERROR;
> +diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
> +index 8d0ea39b..63b4bf25 100644
> +--- a/src/lib/src/fwts_smbios.c
> ++++ b/src/lib/src/fwts_smbios.c
> +@@ -54,7 +54,7 @@ static void *fwts_smbios_find_entry_uefi(fwts_framewor=
k *fw, fwts_smbios_entry *
> + 	if ((addr =3D fwts_scan_efi_systab("SMBIOS")) !=3D NULL) {
> + 		fwts_smbios_entry *mapped_entry;
> +=20
> +-		if ((mapped_entry =3D fwts_mmap((off_t)addr, sizeof(fwts_smbios_entry=
))) !=3D FWTS_MAP_FAILED) {
> ++		if ((mapped_entry =3D fwts_mmap((uintptr_t)addr, sizeof(fwts_smbios_e=
ntry))) !=3D FWTS_MAP_FAILED) {
> + 			*entry =3D *mapped_entry;
> + 			(void)fwts_munmap(mapped_entry, sizeof(fwts_smbios_entry));
> + 			*type  =3D FWTS_SMBIOS;
> +@@ -84,7 +84,7 @@ static void *fwts_smbios30_find_entry_uefi(fwts_framew=
ork *fw, fwts_smbios30_ent
> + 	if ((addr =3D fwts_scan_efi_systab("SMBIOS3")) !=3D NULL) {
> + 		fwts_smbios30_entry *mapped_entry;
> +=20
> +-		if ((mapped_entry =3D fwts_mmap((off_t)addr, sizeof(fwts_smbios30_ent=
ry))) !=3D FWTS_MAP_FAILED) {
> ++		if ((mapped_entry =3D fwts_mmap((uintptr_t)addr, sizeof(fwts_smbios30=
_entry))) !=3D FWTS_MAP_FAILED) {
> + 			*entry =3D *mapped_entry;
> + 			(void)fwts_munmap(mapped_entry, sizeof(fwts_smbios30_entry));
> + 			return addr;
> +--=20
> +2.13.1
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test=
/fwts/fwts_git.bb
> index 4c4ae66d6..87a23af19 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -5,11 +5,17 @@ HOMEPAGE =3D "https://wiki.ubuntu.com/Kernel/Reference/=
fwts"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://src/main.c;beginline=3D1;endline=3D16;md5=
=3D31da590f3e9f3bd34dcdb9e4db568519"
> =20
> -PV =3D "17.03.00"
> +PV =3D "17.03.00+git${SRCPV}"
> =20
> -SRCREV =3D "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
> +SRCREV =3D "0153ea51cb648b3067a1b327eee6a075b6cfa330"
>  SRC_URI =3D "git://kernel.ubuntu.com/hwe/fwts.git \
>             file://0001-ignore-constant-logical-operand-warning-with-clan=
g.patch \
> +           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.p=
atch \
> +           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
> +           file://0003-Undefine-PAGE_SIZE.patch \
> +           file://0001-Add-correct-printf-qualifier-for-off_t.patch \
> +           file://0002-Add-C99-defined-format-for-printing-uint64_t.patc=
h \
> +           file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.pa=
tch \
>             "
> =20
>  S =3D "${WORKDIR}/git"
> @@ -17,10 +23,12 @@ S =3D "${WORKDIR}/git"
>  COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|powerpc64).*-linux"
> =20
>  DEPENDS =3D "libpcre json-c glib-2.0 dtc"
> +DEPENDS_append_libc-musl =3D " libexecinfo"
> =20
>  inherit autotools pkgconfig
> =20
>  CFLAGS +=3D "-I${STAGING_INCDIR}/json-c -Wno-error=3Dunknown-pragmas"
> +LDFLAGS_append_libc-musl =3D " -lexecinfo"
> =20
>  FILES_${PN} +=3D "${libdir}/fwts/lib*${SOLIBS}"
>  FILES_${PN}-dev +=3D "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib=
*.la"
> --=20
> 2.13.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWT/8qAAKCRA3VSO3ZXaA
HLcKAKCO8ZDZGOMZn+pOxnNuk4tEbWPF8wCfVlk8YnJplWmP+oDbjAugOLpwnTs=
=+Xyj
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
