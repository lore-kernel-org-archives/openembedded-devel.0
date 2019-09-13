Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 79FFC7ED59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:27:50 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id e17so28132101ljf.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QIR8IcHeEGuIFImlPwdzHjn3QvMVTJzZQXpYtDi8lsQ=;
	b=Ls5KiWAgTCraEXuFljp8d4kuv827yFdwV/8HmwUPhnaT+YVIpliCPG/5CVs+W+AS2B
	gSL3OryVL1tKWTYQ9H+cAGxkA3m7xGrpamvo1H+EYL6TgjQ/JSHDp3Xxpgs0BtlwvHSR
	xKRdM5UUkdAEs7gOKn8WdGxRAJsOds//0Cu/WVoiigJKqPhvKkNQu+zS8V79htN8xpZK
	oJwH3gsxgD/Y1cpvUJePYFmRle6Mmp876ak833j5xC/ov2QiEwoo5c5E+ulPDfrIBX+g
	YnBMgL3XKhi2Ftc0Hnngw53UQcLFlc+oKVpRBLHKtFSpzY/PbtK6SeTNR5JTAnWXpV6/
	MPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QIR8IcHeEGuIFImlPwdzHjn3QvMVTJzZQXpYtDi8lsQ=;
	b=HTtbtSpfMhhkleNHr59sDiCHPUfT0tCZJpVesS0bPSCSM7FKXq3Fbdc5kTWmPZDRtw
	vo/rhymvWMucDCvL/UQK5PKvVPTM3IsAtTaT3m8cZdU0/AKYEm+nEPKOzmK+7U9PeYCq
	URPv6m2V1LwPw7v2wq+6KSzZxDKdEVarzs9Eh/VGqPSsya8+uerR7JtV1z3P0zMiFSp5
	BL8UGDRFxrhHEg2GA/KK2dqA1KWDK7rqCJSoPlyjhLRLfwlrbiG8TFXNkdFcDp8OD3dB
	xwx6jm7lVWfAvYgtvtRbfnuBfIa4ZE2fEkeYYQgcAqXCX5miozBi2BZiuZL+MKdf3Mh8
	kmNQ==
X-Gm-Message-State: APjAAAXhMS8G7p7973k7YoUaXcgGYNlTF1ysSy9NueQYjJef0WXm5n/1
	pYF2QfkZPO9C3kLSVh2u+b/qXikQfE8=
X-Google-Smtp-Source: APXvYqy7KwKstKM/gVpofiXXaNuayVyukK1E8rev4nIEv0aYqEXYKrTjeO0Qm9yAkjmQKjzSBYEKSg==
X-Received: by 2002:a2e:1415:: with SMTP id u21mr31910737ljd.22.1568402870560; 
	Fri, 13 Sep 2019 12:27:50 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	h25sm8387679lfj.81.2019.09.13.12.27.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 12:27:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 21:27:45 +0200
Message-Id: <20190913192745.1825-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] avro-c: update to 1.9.1
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
X-List-Received-Date: Fri, 13 Sep 2019 19:27:51 -0000

Removed patch was upstreamed.

License checksum changed since http links were replaced with https ones
(see b83441d5d5a88c3ea6e9f7df9746e3060beb4512).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...avro-c-Fix-build-with-clang-compiler.patch | 37 -------------------
 .../avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} |  8 ++--
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} (50%)

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
deleted file mode 100644
index 01235d8ef..000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Apr 2017 09:15:04 -0700
-Subject: [PATCH] avro-c: Fix build with clang compiler
-
-Clang advertizes itself to be compatible with gcc 4.2.1
-while that was true several years ago, it now supports
-a lot more newer features, the test to just check gcc
-version should be supplanted with clang check as well
-so atomic support in clang can be asserted as well
-
-Fixes
-
-lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lang/c/src/avro/refcount.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
-index 69afa4fc..d76ba057 100644
---- a/lang/c/src/avro/refcount.h
-+++ b/lang/c/src/avro/refcount.h
-@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
-  * GCC intrinsics
-  */
- 
--#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
-+#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
-+|| defined(__clang__)
- 
- static inline void
- avro_refcount_set(volatile int *refcount, int value)
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
similarity index 50%
rename from meta-oe/recipes-support/avro/avro-c_1.8.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.9.1.bb
index 276fe2b5a..05cb46e0f 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
@@ -3,15 +3,13 @@ HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 
 DEPENDS = "jansson zlib xz"
 PV .= "+git${SRCPV}"
 
-SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
-SRC_URI = "git://github.com/apache/avro \
-           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
-"
+SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
+SRC_URI = "git://github.com/apache/avro;branch=branch-1.9"
 
 S = "${WORKDIR}/git/lang/c"
 
-- 
2.17.1


