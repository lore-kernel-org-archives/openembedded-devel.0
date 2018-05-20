Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id C89FF745D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 21:24:18 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u6-v6so7565394pls.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DH/GpaAQmbaBMy9/CvGfJj5yT+RwO5nSxtVnQgJY3Gs=;
	b=gL+AN1ONajBaQ0YTGdK6cPsm/xkhJ+GK0gJacjgnndyOrwE/sBARIlsw/WmGTKtTg9
	NIghOqbzNVtlud5fXARElGrJ+ojv0Mpzm7fokhZxWmGdmKC/b0vLOnuRezS50Sx5pkZz
	N7WuTjqmbcctkYt8KCFWwnbN2hh1poHxBOK64/DdfGKaDITHN0I9gj8x0h2k6jC+rqlR
	HaFpIAbRSWLV7VpQiJD0KT9GzsnqZM2q186rVGPi9eUxBHWbPFPnUeZC1ZMQOZG2ENeC
	4tqpSuqBtGLtkfT0+/ckxKSWdqQx2ZOYkA3SVsXL8dOR+7kembBTUaF78nvIqV9HZG9X
	Dwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DH/GpaAQmbaBMy9/CvGfJj5yT+RwO5nSxtVnQgJY3Gs=;
	b=qOJjDB8Vt9QMvi7hGNsP6uMazUKGXKVUfPEahf+4VNQAZYIa6qWN9+6KfHURPV0zQE
	clcc3FrTuPgJ0L9fSTRF5pHMAbH3sida+zFt4zIQZuuhf8GLLYfBYb1mqQKdWAGcwWY8
	Zzzr3QWdUXaWDkC50ebQm4Y2Vt+LeaXwnQkmHVVzQB+l2n+bxuYRi10h3sm1kjhrWf6l
	Any2xJAnDDUPjlELPnadTJTclI8tbrKkp8SQx374Cu3DYHmWBj0Ktg3kLBsUpqahkpcL
	eY3Yxc8tFhQksjzOju7L9mMC1Yu+aB16HvktNS33gQJWovMqxGZ+p49mHHB4YZ+kkAqs
	5+zQ==
X-Gm-Message-State: ALKqPwdLo94PUC+2nXPGMUupjMaGzbk2CQtUc8zCuYA2Hzi8yXPc8xaE
	dEEf16xJhphYU5Ltb+pMRjzfJw==
X-Google-Smtp-Source: AB8JxZo3Lj9Zv2//Yr+U2+ptCo+0awOtNRqSQxGCPhFrP95ABZQMWmR/0LChcW/zh5Jiyy5vYaAtug==
X-Received: by 2002:a17:902:b68f:: with SMTP id
	c15-v6mr17857520pls.201.1526851459540; 
	Sun, 20 May 2018 14:24:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:292e:9ff2:c3a4:d8d5])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm21711754pfb.127.2018.05.20.14.24.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 May 2018 14:24:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 14:24:16 -0700
Message-Id: <1526851456-17624-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526851456-17624-1-git-send-email-akuster808@gmail.com>
References: <1526851456-17624-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] boinc: refresh patches
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
X-List-Received-Date: Sun, 20 May 2018 21:24:18 -0000

used quilt refresh patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
index 7becb94..ab8042f 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
@@ -3,17 +3,19 @@ Add configure check for gtk2+ and objc++
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
---- A/configure.ac
-+++ B/configure.ac
-@@ -39,6 +39,7 @@ AC_PROG_CC
- AC_PROG_CXX
+Index: boinc-client_release-7.6-7.6.33/configure.ac
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/configure.ac
++++ boinc-client_release-7.6-7.6.33/configure.ac
+@@ -64,6 +64,7 @@ m4_ifdef([AC_PROG_OBJCXX],[AC_PROG_OBJCX
+ dnl ------
  AC_PROG_F77
  AC_PROG_CPP
 +AC_PROG_OBJCXX
  AC_PROG_MAKE_SET
  SAH_LINKS
  AC_LANG_PUSH(C)
-@@ -744,6 +745,8 @@ AM_CONDITIONAL(ENABLE_LIBRARIES, [test "
+@@ -1081,6 +1082,8 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test
  AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
  AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
  
-- 
2.7.4


