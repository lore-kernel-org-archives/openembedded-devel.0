Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C38AF77EAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 14:12:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l25so1807573qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YZsNKht+lizEHR6/zCyPjiKQgyhXtM/aNyc7i3B6wW8=;
	b=GnRnq+GrBQqMpdjl5LwKKXZ50P4rYZLH+nauIb8x6/JpecC+BtphhqxNQrItYoshvu
	GLayFkHoMl7JocK0pDnMYegZP6VT4d3tgXJoNGBllb/aFgvATUjS0x+ZfTE8+pO3rvGV
	1oklaZ0mmeEqBVF+kZ9vg63iM6yYWY2gTRXoU+aKGhq5RuBhmEG5ZAe6v3SApN8j7WYb
	h71ibyM3YhJYz2XcqT07JP81lLZm4Xsd0AWwMD9V94LC3LPOGnwxRj1s/fL0mZ8P3l80
	m3VWyYLCpWWBCbm87OWaHB3wSii9PTs5yxqMan0iKgLDLnBYzFOB4BAEcBif1Tau0VhN
	5QFg==
X-Gm-Message-State: AHPjjUiYkf8Il0dJAwB4YmeyJRdci9P1JavTJU4mRP5InT0aHnXF/UBy
	aotk+Y7XNXO1yKWUW+2ol0k1lSKD
X-Google-Smtp-Source: AOwi7QA3l2ZGxuRSdNly7dfOVAjit1J8MyyRhRB0qxETq0BNN3VxFyH6Ub/EdXC3Q44GEecEQ89YWg==
X-Received: by 10.200.63.197 with SMTP id v5mr368936qtk.288.1505916777334;
	Wed, 20 Sep 2017 07:12:57 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	u133sm1316011qka.92.2017.09.20.07.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 07:12:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:12:50 -0400
Message-Id: <1505916770-19667-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCHv2] jsoncpp: update to version 1.8.3
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
X-List-Received-Date: Wed, 20 Sep 2017 14:12:56 -0000

Checksum update for copyright year

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


