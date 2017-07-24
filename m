Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC042782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:16:01 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p3so2349491qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MraboWYN7NEi5Y3b8AWM7NPtgneIPq1+supSoYTZXPY=;
	b=gxpq4AR5q9s+SHxFKGZXvCd06/YrjSbtzGIrlUhelEDPVTVjoJgWF3RwmgIUkW9hWa
	c1Q5BdptXrStTOp4L7lg+Ng97244HLNAOMwEuNyr/7lZISt6I7bGRPjNn/ESo56M59rr
	ujkxBdMJ60BVudKFz8lqaNNJDoSI5yRGw2etawK3lYkg6IcUikA1K1drHqdmkkJ6JJa5
	Yxk8rEUEn93bFqyp6zb4veKXo3RxK0L5XtC+j7jdzWtNByd2rm3TO7iZMIOco/5daDWI
	BFU9WnNWT246quMHIGcBK8snNOzjg8s8XzLbCLkOrRZ3E17b3+Q5dd6OK37eUT50T2+X
	8Qbg==
X-Gm-Message-State: AIVw111VHOVIy47PQNL0sE8lvtBAdt+DQnUQlcV2jVjdA9FRMGJ2gc7t
	n5TJ+8QJPeeq+dq3zuU=
X-Received: by 10.237.43.163 with SMTP id e32mr7860198qtd.200.1500920162986;
	Mon, 24 Jul 2017 11:16:02 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	t57sm9015648qtt.18.2017.07.24.11.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:16:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:15:55 -0400
Message-Id: <1500920155-14828-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.5
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
X-List-Received-Date: Mon, 24 Jul 2017 18:16:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.2.bb => python-cmd2_0.7.5.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.2.bb => python-cmd2_0.7.5.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
index a379de0..9621326 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=43;endline=43;md5=0f13c9cfc75288223cf7edd2f3b985a2"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "4a5b5aab407bdeb49634789f9a42902b"
-SRC_URI[sha256sum] = "d06301cc578a83531261121c0b11d79d29d0a80aca01ed6752c20c4cfcda2dd9"
+SRC_URI[md5sum] = "9f758f3a6a20f1220d60f6320bb839b3"
+SRC_URI[sha256sum] = "7a47afafc5ad45649a2998df8d96f39d8e1d0686f55c785285889e45151ff75f"
 
 inherit pypi setuptools
 
-- 
2.7.4


