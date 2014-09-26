Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCE765E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:43:36 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so2420970lbi.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7RRxmpgEg+ilCyNHbvVEc8tCXpxYdghbjEzuBDRCuzM=;
	b=ACHjJMOUnyfeYy6Z7MyRIuqCzDot9eUQ23FVWOTZok7jv/o5ukpIjd6TJhU9aEqMP4
	vAchKs2d2S2tjRVTM7dL+Ab9k2NWMUS8RfO2EsHcQw6a0hnToyvfCGMqKdXlCSNSEc9m
	uEM/mJ/YnVyd29x1iYbcX15nwZYEx8cpsYsLF0lC3hegDt8BDFBwUAdZTie3Hg9GkoRl
	WboJ785EqFzPiGSETNXAE4eM59JebEYC37wefkHW+XyV4+PcdZ6Tmrfd1qyNyeH1/lGf
	UNOvTAbbEzUJJ5KYeVVSkYPKlwoUg0tw7IQYzXjYNKKmlpUreWabeaZRAIqdUIN6Ncmp
	DgnA==
X-Gm-Message-State: ALoCoQm828bkZvmywmjcoALgQ15m0t6AdO6Hg2L7e0sSftcJ1ZlElfBuNOUJMDoh6ZrMXXRHYAXY
X-Received: by 10.152.28.74 with SMTP id z10mr19603758lag.10.1411724615907;
	Fri, 26 Sep 2014 02:43:35 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id g18sm1709386lbo.41.2014.09.26.02.43.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Sep 2014 02:43:35 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Sep 2014 12:43:32 +0300
Message-Id: <1411724612-16616-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pm-qa: update to 0.4.14 release
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
X-List-Received-Date: Fri, 26 Sep 2014 09:43:47 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 61511a3..dc16aef 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.12"
+PV = "0.4.14"
 
 BRANCH ?= "master"
 
-# Corresponds to tag pm-qa-v0.4.12
-SRCREV = "16c5d643c2a2318f8dfe12079a160cf41c17ec06"
+# Corresponds to tag pm-qa-v0.4.14
+SRCREV = "9111d1930f02337394cf16e84ad2a27f33607cbb"
 
 SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
2.1.1


