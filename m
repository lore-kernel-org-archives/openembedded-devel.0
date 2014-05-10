Return-Path: <fathi.boudra@linaro.org>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 May 2014 11:39:36 UTC
Received: from mail-la0-f47.google.com (unknown [209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0C60702
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 11:39:36 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so629462lab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 04:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1xLsKW2vguYzjNc471yTHm5Y5qSAwPfr2tQBkB5edNo=;
	b=Q0jKSN2VneGl/AxPHCnt5sWahJd6rOdUI4LWJQNtizUGZ2budZ8fjG58TS2BfmvKuM
	Co0PKlVWeXjmqbVFoN6NQ2jBWHycTm4CPUu0U5Qw/E3D7WL6evIhBLhMvMZAh4GF2XkH
	pCfclW11pKhHFtU3CHyPeSGxGCYkYmXOplVrwWVjxVM2N1fMYuYIDieXDr7Da6WcTiJv
	RVqn1z1fz1894bYHlxw2rlxyh0Ant7+n7m8R1OERPnFugySf+yjnGZB2GIfK6epJ5nwV
	TsvVf7yijbw8OA/AjVA7cnhI6e1OcTZGLDz7iWSkJg3Ewyn9FcWAGF1IJHIj2izBnGDb
	2F9w==
X-Gm-Message-State: ALoCoQmWSQctdOg/0btmEZ21pS1agwqt8RCTaDry3w30TQ45VfFrnezQ/tv8BJtB3OPcrJdxNXM9
X-Received: by 10.152.170.169 with SMTP id an9mr3707725lac.14.1399721977030;
	Sat, 10 May 2014 04:39:37 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id g6sm4267751laa.10.2014.05.10.04.39.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 May 2014 04:39:36 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 May 2014 14:39:24 +0300
Message-Id: <1399721964-17473-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fwts: update to 14.05.00 release
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
X-List-Received-Date: Sat, 10 May 2014 11:39:42 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-extended/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/fwts/fwts_git.bb b/meta-oe/recipes-extended/fwts/fwts_git.bb
index d704d84..4fa1d6b 100644
--- a/meta-oe/recipes-extended/fwts/fwts_git.bb
+++ b/meta-oe/recipes-extended/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
 
-PV = "14.03.01"
+PV = "14.05.00"
 
-SRCREV = "8ec44dc1e55ecf334f4afa8eed8795ed5776c396"
+SRCREV = "fb5385fec1f3468b479e87c0bba38ab76f60915b"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.3


