Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id EC67465DC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:35:09 +0000 (UTC)
Received: by mail-bk0-f45.google.com with SMTP id na10so880935bkb.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E69ln9pFMOImIPuttHzD0GjkJGK/YAo1S5ijiu3ny50=;
	b=I39v8/Xj0KTpk+ip9r3beKEkgmbn4RaeXva9x56Kg3jobLICVcUEap+JwvuBdhqR8x
	ySTwnR92gixgb7Lb4BXR25qmLo+X55IB2dK3Ar9RrLHO+1CPCfyIMtkvFdvrNvUfkR64
	XyL4a4xqwjSl861bq4/hOPmimFj6UHJNu4yyR5/P7bfazXvExhazGpkYYWo9A+v7HijJ
	HXYf8cu2FgTS9GjZp6hACk6WJ4Da1xTlKRTxx2YNrgCr2CwpPxqqplLg4PFBjhlYOOs2
	QLR3Yp3on6bHgHNqEaNJJb8OyLIFQGuTQdlL6NNHmd1cJMrZpL0/NPjAzwXV2FCCJIbA
	zDIw==
X-Gm-Message-State: ALoCoQkY3VCZunE5SDebRwLeMd4HX7g5XoQWq6Mv5W07YFe2wP+SCbDbjtzoizFOXmtTp6t5swqe
X-Received: by 10.152.7.8 with SMTP id f8mr1531887laa.39.1396873927140;
	Mon, 07 Apr 2014 05:32:07 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id zf7sm16621901lab.7.2014.04.07.05.32.05
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 05:32:06 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Apr 2014 15:32:01 +0300
Message-Id: <1396873921-25816-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] fwts: update to 14.03.01 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Apr 2014 17:35:13 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-extended/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/fwts/fwts_git.bb b/meta-oe/recipes-extended/fwts/fwts_git.bb
index 086e6d9..6f6df0b 100644
--- a/meta-oe/recipes-extended/fwts/fwts_git.bb
+++ b/meta-oe/recipes-extended/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
 
-PV = "14.02.00"
+PV = "14.03.01"
 
-SRCREV = "628534d216f135939f2f7b6b0a6c076c8d73bff9"
+SRCREV = "8ec44dc1e55ecf334f4afa8eed8795ed5776c396"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


