Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 359BE7017C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:23 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id c67so8515222qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=U2Mbv2Tjv1lGqZkzg3xeWxscmEXktYC9iy2qpVO1Dzg=;
	b=VPTWJe5kKmVxh4tqnC6rloDsZ0sZjwAs0PbQGVlmvM9X8X+MvtOfiit1jq+G2gm8xS
	C4rvqZbQpocOA0QJplqMssJ8Ou28gFJcYg+yjsjSLE2/3FPtoQyJGfHko8LP0vARFj9Q
	6gihPllmA/O3JtRTaKz4t3VzzjHbkUZ6+Ot2Z8Av8sCRg8WSXRtekFDDfyMbpApUNNAK
	aMnjcPd38bGwFjpQWcV7Q/jJGCnjE67mAScdxPE14SK7uZEAFmUFLKvr5NAnAsfx08ju
	YdAhAbI0dReqWrMuwDQjCLqvN17WQTq5PSb6m8ZNvbUZVK1MmBddBhp1E0nmqPDpPe88
	y5wA==
X-Gm-Message-State: AD7BkJL/n0dxcuI72NlEMKM3S1o69owO/ONwNc1ucPUANTyMAw5LTuI6XsvlumCFNS9A+Q==
X-Received: by 10.140.135.84 with SMTP id 81mr25111932qhh.26.1458997524486;
	Sat, 26 Mar 2016 06:05:24 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:46 -0400
Message-Id: <95a6192317b1a6dba0bbca5c9bcbcd48eeb51a2a.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 26/30] python-pytz: update to 2016.3
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pytz_2015.4.bb => python-pytz_2016.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2015.4.bb => python-pytz_2016.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-pytz_2015.4.bb b/meta-python/recipes-devtools/python/python-pytz_2016.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-pytz_2015.4.bb
rename to meta-python/recipes-devtools/python/python-pytz_2016.3.bb
index dedd864..da4e2d6 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.3.bb
@@ -10,5 +10,5 @@ RDEPENDS_${PN} = "\
     python-datetime \
 "
 
-SRC_URI[md5sum] = "417a47b1c432d90333e42084a605d3d8"
-SRC_URI[sha256sum] = "c4ee70cb407f9284517ac368f121cf0796a7134b961e53d9daf1aaae8f44fb90"
+SRC_URI[md5sum] = "abae92c3301b27bd8a9f56b14f52cb29"
+SRC_URI[sha256sum] = "3449da19051655d4c0bb5c37191331748bcad15804d81676a88451ef299370a8"
-- 
1.9.1


