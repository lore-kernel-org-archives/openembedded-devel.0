Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 45D1D78456
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:05:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15so9657346qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MbYsrE90jDkSk7rZvVbFrk8RxgyIHQZryZzkw6DofPA=;
	b=hUayWOJzp2OnV8yHyLAGoym+tpIR205ljqIt7df0Lqw5C0Wom7Gr89qQmV1TToW6hV
	VKbnSJfeuo0ZcFSpnynMg7cOApMasntRzTDN3GgwYYN+Zrx0gIuGEZVTydm/ZT2BkG7Q
	7NHLpclQfGFs50PIFGvcdTIRDwx5RqgZf7p/f/8xhCMMZT3ub5fq58WtYycEyAeS0e7F
	jQCj47DhngliVM1QVTvv2XpzsGbyQ/H63489WbjtzZYqHmp1lkPlxsYznqBvJWR2eze4
	2++A0FuvfO20ppTX72mzevsdINZmBNcdHj/frbl51Ac0FlU6I+2dhOohP2gBiCJlx2M9
	nyEg==
X-Gm-Message-State: AHYfb5h8nlLT0x55SajX69INTbhrQGH73zWe1/4lsgeyzYSmm/Uj2MG9
	ay68s3FIcaGWd6S1FEw=
X-Received: by 10.200.44.97 with SMTP id e30mr33571185qta.319.1502719524111;
	Mon, 14 Aug 2017 07:05:24 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	h42sm5215416qtb.97.2017.08.14.07.05.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 07:05:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:05:17 -0400
Message-Id: <1502719517-14943-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.6
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
X-List-Received-Date: Mon, 14 Aug 2017 14:05:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.5.bb => python-cmd2_0.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.5.bb => python-cmd2_0.7.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb
index 9621326..d136672 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "9f758f3a6a20f1220d60f6320bb839b3"
-SRC_URI[sha256sum] = "7a47afafc5ad45649a2998df8d96f39d8e1d0686f55c785285889e45151ff75f"
+SRC_URI[md5sum] = "71f862cb2817b207c9cecec7382324d6"
+SRC_URI[sha256sum] = "fcf116b44a46188bbae2ba852a5c2354c069b798feda314a452cb927054d2f86"
 
 inherit pypi setuptools
 
-- 
2.7.4


