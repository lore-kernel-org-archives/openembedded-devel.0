Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF9077EAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:09:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so1755334qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=58wUcbaIL9LSl+iM3DOuHPKnzXwsYxB13jTO3ma2SOo=;
	b=lG3bmq+dTiS0AAU/Udxhqukz603tsBBQKiK9qJilmvoRfDefzwtUBwoh82aVc9kiX8
	9v6fNeouYhYNnzFp7H0uMikexVtJ87WO1YjMJ7pZYGLRSCHC5kib3yoGHvEkry52CCzb
	gYa3aj1D6xMYRKS50OzUwp+BoVaSa1Png2WtDjWa0I0h/Z54oCYivXOb5PRmxh8pdKBg
	HPgCzOBjrNLPAFF63kvP6VM+qufp6pWKPiwSXCahSxQRnFKQvuNP9xzx/clGIDTzQPcV
	BIRMJMBBuiQVw9jmN+rSz6vb9Bmemq6nQv9wMDbM7fRurezdZ52KHCzVwAN63E0Q2ldW
	oBYQ==
X-Gm-Message-State: AHPjjUjloQom8HTjV1Y483PCHMSv5NLQPW4wKQZ2U99WevfoxlELPJW2
	TelHSnexmQd6dcT5o4dZqTySwD/G
X-Google-Smtp-Source: AOwi7QAJKe04QkmK6+tV23hR34ZyeuI3gvQxJdQj6ha1VZ2latOthVXoPiGmAGp/1iWc8Caeh3npqw==
X-Received: by 10.55.42.130 with SMTP id q2mr7275220qkq.331.1505916588469;
	Wed, 20 Sep 2017 07:09:48 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	i124sm1331460qkf.84.2017.09.20.07.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 07:09:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:09:27 -0400
Message-Id: <1505916567-19611-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] jsoncpp: update to version 1.8.3
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
X-List-Received-Date: Wed, 20 Sep 2017 14:09:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/jsoncpp/{jsoncpp_1.8.0.bb => jsoncpp_1.8.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.8.0.bb => jsoncpp_1.8.3.bb} (83%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb
similarity index 83%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb
index fe6ae24..b7a02ef 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb
@@ -9,9 +9,9 @@ HOMEPAGE = "https://github.com/open-source-parsers/jsoncpp"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "f700fe455940d4d325c088b9174a173e130e0fa8"
+SRCREV = "2de18021fcb11370e9b5a1fbe7dcfd673533a134"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


