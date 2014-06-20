Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id C97316FE02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 12:24:53 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id p9so2257697lbv.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 05:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xHJrjDnLML08+zjW6gAWlt/MswR9R/fkgAblO1fbYz0=;
	b=TCIQOatKfMfClZ5066+Y+M/t4zT+NzrzWwue789k6oQ3dJGRickdVD6epCKY7fGs4G
	XS//lBQJg2UvaDtdFsUe9U9Wu6/9tOCjcF3G46bANg2giogVaAg0MgbXchwXUteQuKoO
	iBnEYhK8d32KyS54/4tYnFJbC0E7mwH3DNs1/2J5xbOSWeE5h3Z1+xvAAMldxp/egrjJ
	nRT75roc6LpUplLB47fEDSWgRlFTkW8lDj+2Vm3qm2LGaQuGirH8YthJObk45gS0Rl3p
	pD4nLYc7hjwEcEXnWafHpWyj/a72DBNgp/wov7b2Qy4u5pPyBFaqEfrV1Fvysbjfi9YN
	/mow==
X-Gm-Message-State: ALoCoQmnXmhvzsJI9gTfmXv6dM9yLJLVnJ9e6ZtKECnn5fDVSLKg5NX3FfY7y9Hw6F+l3ZW8auY+
X-Received: by 10.112.126.38 with SMTP id mv6mr2263419lbb.54.1403267094103;
	Fri, 20 Jun 2014 05:24:54 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id b8sm6479050lbq.25.2014.06.20.05.24.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jun 2014 05:24:53 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jun 2014 15:24:42 +0300
Message-Id: <1403267082-3533-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.0.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pm-qa: update to 0.4.11 release
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
X-List-Received-Date: Fri, 20 Jun 2014 12:24:57 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index 9243340..30b383c 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.10"
+PV = "0.4.11"
 
 BRANCH ?= "master"
 
-# Corresponds to tag pm-qa-v0.4.10
-SRCREV = "03a22d5ad7deb6021b2ec1d546a960d8a9878255"
+# Corresponds to tag pm-qa-v0.4.11
+SRCREV = "cd280a9ed159100c0f5f3c1eec4ed8465fe0292f"
 
 SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
 
-- 
2.0.0


