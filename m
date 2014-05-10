Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f53.google.com (unknown [209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id ACED060E49
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 11:40:06 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id ec20so623547lab.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 04:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WZWDZBCjMSznpmLBFQPVBSbQ978o8adlyLVM9ALSxM0=;
	b=W3CvOpzZycKyBGg6D5Gu1+1U8cTQhq/IkFqin7i6O5wZgBWW8V7cd33VvVEPpSM/8F
	GOJ74ifql/1NIIiqm1hmHM0UAOKRv++tLYZQnfNL1O7fbQ8UHhJcEvReoAsQ3sjPzGJU
	bJFDEGhK8ruFKH3xDGYdo6k5a/oKdqcFSavjEoz0MOGkuafge0MsxxoIIPK+Ur/78hjV
	yJ4HYddkkWrcZFDng0fas8KIFuqsUB6Kktv+MwTmwdAsUop7cGVbAt39Rna52A5RyJeF
	bvJOK8Ok2uxHXX0+EsIzpRIdwi7stS7nh4O/KtkzsRCcjcTyuW+N6tUtdpZtnzHzG4rG
	EsxA==
X-Gm-Message-State: ALoCoQmjtXfaQq7ydgbHdkuvhKdfmtN54kJAzX281/0kU3hL2KpYzZHEDEpO5PwHQyaMpIBRVGDi
X-Received: by 10.152.88.10 with SMTP id bc10mr3567622lab.23.1399721563414;
	Sat, 10 May 2014 04:32:43 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id r9sm4253389lal.0.2014.05.10.04.32.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 May 2014 04:32:42 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 May 2014 14:32:33 +0300
Message-Id: <1399721553-2020-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pm-qa: update to 0.4.9 release
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
X-List-Received-Date: Sat, 10 May 2014 11:40:08 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 4d33975..f6ffcb6 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.8"
+PV = "0.4.9"
 
 BRANCH ?= "master"
 
-# Corresponds to tag pm-qa-v0.4.8
-SRCREV = "6a8c2ae8a6035b15a7fbe61b6ca56841e056fa37"
+# Corresponds to tag pm-qa-v0.4.9
+SRCREV = "c54941a9bbaac33e44e6d0c7f5344e21102642cf"
 
 SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.3


