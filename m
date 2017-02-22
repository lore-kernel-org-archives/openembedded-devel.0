Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A11A73157
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:45:44 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b16so1303400qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F2eoLJdW30jAJYOauVSq3xLyEh08SxxGhd6YzcQFgWU=;
	b=IkjK35Yw8H06B779TRWRMS8V1hqkZiKKqqZohZNBtyEYmR5r9ipx0VL8bMkPxFs3tC
	dChqEH+muhKS8VcGCpj/PKArY7N2YcnQzGQSKJPV4nKtm+POYk+VyWBM6lYkD5VTfM5W
	S2ymQF0Ab1XDQ1Sv4mILe10lVKWP72sE0nS9t5x2jJN8QAdK82oeVRO2XDQkKTtMJtmG
	/5RLZPvLLdhvuzger08d+UdkSS5yUl3lt7zkuMx20LW5iR2xOYq1OZARzKMf0HQWOvQX
	XcFFrno1BRJ6AI9vLBTbmdRq76LtZSOdu4kbngDRESKppEZBsP+NHsxhS+GxVndX0KH4
	iQSg==
X-Gm-Message-State: AMke39k+95U+WDtx5cVnV+fl4/4l1o62hCQWgWnhBmJcPeGwvCsaeUvRZ8JOIS3WjW6qyQ==
X-Received: by 10.200.1.14 with SMTP id e14mr9442354qtg.244.1487785545734;
	Wed, 22 Feb 2017 09:45:45 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 30sm1096941qtr.38.2017.02.22.09.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 09:45:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 12:45:36 -0500
Message-Id: <1487785536-13777-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 17:45:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
index b8f5f3f..c8acfc5 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
@@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
                python-threading \
 "
 
-SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
-SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e"
+SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
+SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f"
-- 
2.7.4


