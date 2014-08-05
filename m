Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id D60DC61585
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 06:14:14 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id e16so345288lan.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 23:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XYLGcREJCYBQ+FWuilFqIBaqLHt30igeDYuyVoPlteM=;
	b=mFc9wIbJ7gTs5mCbmVpnCTiVE8avodbl1eh5P619n6rruL4DR0k+m+I4iC0iqYXnrj
	78HFB3CE0DX/Jl8XzkLsS6vtF08ch84u0WPpceNPoOY6oj+2pebZm/KD4sqwQMVY1jO8
	nSlPCN7vYepIUDq+5Orj+9sKnNytDxaIQYfhbTMYKtVhssgVGcIIdSPizxT/u+o454yQ
	2pU/mAkYnmbVBZs7GYz/gItyaX1tcJ1rVN/0nyvPWgL5eiY1V2VVF2tJ02joWTQWB0iX
	5y+EFePn+JFwfr5um6EGd9b7XJNQcvDRn6DZpndz9CoVg347m0N6f5dNOXdmls/Txm2q
	xXKg==
X-Gm-Message-State: ALoCoQlHv39apkKYfO/vHCMBoYrajQxN1/+kaUmtfgW7HjeESpcOC/ebvyumKsco9e0n87kbZDRR
X-Received: by 10.152.228.164 with SMTP id sj4mr1544168lac.7.1407219255142;
	Mon, 04 Aug 2014 23:14:15 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id xo1sm1234020lbb.16.2014.08.04.23.14.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Aug 2014 23:14:14 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 09:14:01 +0300
Message-Id: <1407219241-22086-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.0.4
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pm-qa: update to 0.4.12 release
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
X-List-Received-Date: Tue, 05 Aug 2014 06:14:18 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 30b383c..61511a3 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.11"
+PV = "0.4.12"
 
 BRANCH ?= "master"
 
-# Corresponds to tag pm-qa-v0.4.11
-SRCREV = "cd280a9ed159100c0f5f3c1eec4ed8465fe0292f"
+# Corresponds to tag pm-qa-v0.4.12
+SRCREV = "16c5d643c2a2318f8dfe12079a160cf41c17ec06"
 
 SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
2.0.4


