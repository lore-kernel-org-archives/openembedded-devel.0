Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8930977CF6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 19:58:10 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id s3so15988101qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 11:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P4+Jkl5NErhh3mKk3bQG5x1U9ESpHY/cQkr7CvLm9Yw=;
	b=pEY7DszDk6I5LWnxfU+ZNIxwC/juldiFO2oHtbtlTekSE3qORDagw3DsVOOQjaigTt
	LZr2PfvUR3Qibr83yInKF1Kxq9MEwgYyj80zx1EzKZgg1k3UvbqZ/Pnw3llGDS4E2tGI
	C4/5jRXzcgiVlbPqGsF1eQ0EmU0UsgknA+Syd6RgryX/VH5SwWimq/IvPaZUgatswkRB
	UPSjOT9TIu7Q69SWSO6f+ARdex3kkxOC0XV6E97CYhyy3yF4YiyT2PlsHJ9q+G+cUyqC
	3qyWzvYGJkfcPEZQc6Txqi2wF88Rnu9m0nUB8QDEzKzX+rzL3XzKaZNJYR90QTyMm+VA
	fkMQ==
X-Gm-Message-State: AKwxyte9Z9pHOppZpDxs9TBX0gBpwiagJ/vPNrUejupO7JCMF7z1kv/Y
	poGaHehsnxJBLGRXDGN5BsjeFG5A
X-Google-Smtp-Source: AH8x227j1G2ocVRratZu7S7seDhFh/uqOXWRAQ5yraec9cvlTa/uOb3wU94W2RoE3Zr7io6KYK388w==
X-Received: by 10.200.27.232 with SMTP id m37mr7632780qtk.171.1516564691227;
	Sun, 21 Jan 2018 11:58:11 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t23sm10137751qtc.95.2018.01.21.11.58.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 11:58:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:58:04 -0500
Message-Id: <1516564684-1690-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-tornado: update license checksum for whitespace changes
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
X-List-Received-Date: Sun, 21 Jan 2018 19:58:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tornado.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 052b76a..29d10da 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,7 +4,7 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
 
 SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
 SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
-- 
2.7.4


