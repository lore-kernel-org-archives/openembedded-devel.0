Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 95D157309D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 18:15:36 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j127so28213408qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 10:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TeqDTrqJn3bk+oChh2pvaovy5DdJ5xESOVStDDAQFh4=;
	b=cU3ClUwv9heWPmgJ2+NkHLLOGgi0A6d+Em0dfrbgNFf/gNix0rJFTN6V/Oc0k4YzYn
	oeT/Uqw3R3NoRU3Ryml/Z/5gNrNhyiVpPudhA9utBUKHLKIVKeYBoIJuQlf/exANecTs
	K7skfW6+IH3e9ZAuMT/A8GtmkOPkWRc1Q+srb8IFQDG42QWae9OohA0gl8o3GjsbazJh
	jlblei3feFMPnBS3SLp0snVQeVFXQrFbdzYmYx1fj9xSEQ/FxdVBM507s9Cn02ncYGOS
	D/zFhnc9TLYm0go4Keys3iymrecpMohTKwbCb2pSq5bzntV+FnAwERTZXAnu4yiis2zS
	5RoA==
X-Gm-Message-State: AMke39lMStT94EDDqZ0A5wr6WttXIv63KjEIpz3ypjHzS+9h9u3Arcu+hFR7IJ7KJVN24g==
X-Received: by 10.55.33.205 with SMTP id f74mr14255198qki.165.1488824138373;
	Mon, 06 Mar 2017 10:15:38 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d26sm1384231qtg.26.2017.03.06.10.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 10:15:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: paul.eggleton@linux.intel.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 13:14:49 -0500
Message-Id: <1488824089-5430-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] Update meta-webserver README to add Derek Straka as the maintainer
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
X-List-Received-Date: Mon, 06 Mar 2017 18:15:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/README b/meta-webserver/README
index 379b54a..7b60630 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -54,7 +54,7 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-webserver]' in the subject.
 
-Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
+Layer maintainer: Derek Straka <derek@asterius.io>
 
 
 License
-- 
2.7.4


