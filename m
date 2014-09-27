Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB8465E2B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 10:28:38 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id z2so784938wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 03:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ixBJhKRw8oqSukeBE6UeJ9Z/fj5KlCHDd34AalIDYA4=;
	b=cyU7RsQCmTGROopibbZpKQ9V+HusV7b0jQiQiAA/t5RvJsqKkHF7SGMUtR3RoC+y5i
	3Y9GYqjg9QPM5FtdoedxzHbzbXis7kSFgmFU4NBS1GJ/Ms3vVjULzQWtbANNada6/3hQ
	F9IjkPJ541jLMsggPDoDSAHf3H9SsVXdF03v+w9jv75WX+e3eL4BDnWHiLEU+ZCAA5Hd
	PXiroqqv40ILFGAZDpasU896LIe2amRs8Hi0h7xWT46jyF/YDLJbKvzErERtphgoi+a7
	oIc5aHqT/7hxzQsMShJZfPBPQgq/WsRlM/cGsGjPhyc3g2akkv40VcbK1tauXkhUGLAP
	FbPw==
X-Gm-Message-State: ALoCoQn4xbhVqCx2Fm0V/k4e7duc0n5FXUKTjOrBD85WTo4nGaoIAQD1zq/b0ZWikrlkgINf0Jkg
X-Received: by 10.194.63.205 with SMTP id i13mr30575452wjs.74.1411813719102;
	Sat, 27 Sep 2014 03:28:39 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id ka3sm9057145wjc.3.2014.09.27.03.28.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Sep 2014 03:28:38 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Sep 2014 12:28:33 +0200
Message-Id: <1411813713-11909-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: danders.dev@gmail.com, Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fb-test: update to 1.1.0
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
X-List-Received-Date: Sat, 27 Sep 2014 10:28:43 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/fbtest/fb-test_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
index c8b4a1b..65f98c1 100644
--- a/meta-oe/recipes-support/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Test suite for Linux framebuffer"
 
-PV = "0.0"
+PV = "1.1.0"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRCREV = "85eab266b123a08098af86afdb1599947d276e32"
+SRCREV = "063ec650960c2d79ac51f5c5f026cb05343a33e2"
 SRC_URI = "git://github.com/prpplague/fb-test-app.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.0


