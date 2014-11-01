Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAA771F1D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Nov 2014 12:21:01 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id gd6so6182724lab.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Nov 2014 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nMWtRZUzT5nMeWmfEwmI+zr4oC2PbYVrKOKqcvJ9PDw=;
	b=M5vF8jgqi9gXZ+b2kU/FFlz1i3TXwTLlAcy60S9F6emWNNuvA7tKOPjYcQGL6YswUw
	+ku0kqZmk74OJayXw106GIGYRc9vk5lzgDDvMDLpv9VHnxhVLtM/dHrVGcrUbcIeAZXr
	EhuWPn/gBEr+C+1O3xBpATZCfqGvwNAflwhyy5JtxIHOJQEqbsJaC3dhYBSYian9kf2A
	49WBfYpRViDjmWOpUgNI9d/TZ4/ZOs+KVMSN4W0Vby8uy1MRCPZQ8Utv4qRPwT34kiUp
	35IB+3UzB1MRgqHioY5ZMgxGgNenWGNYszCjCEWCreIWa6aqsSkLrSpXqh6mYaZTSmVm
	cYKg==
X-Received: by 10.152.228.140 with SMTP id si12mr33230964lac.66.1414844461334; 
	Sat, 01 Nov 2014 05:21:01 -0700 (PDT)
Received: from localhost.localdomain ([194.44.84.130])
	by mx.google.com with ESMTPSA id dq5sm5557843lbc.11.2014.11.01.05.20.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Nov 2014 05:21:00 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Nov 2014 14:20:56 +0200
Message-Id: <1414844456-20731-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH] rabbitmq-c: update to v0.5.2.
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
X-List-Received-Date: Sat, 01 Nov 2014 12:21:03 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.5.0.bb => rabbitmq-c_0.5.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.5.0.bb => rabbitmq-c_0.5.2.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
index 91acb1d..762ecd6 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "b1f902c658c772cda464754678d8deb6"
-SRC_URI[sha256sum] = "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa"
+SRC_URI[md5sum] = "aa8d4d0b949f508c0da25a9c20bd7da7"
+SRC_URI[sha256sum] = "1ec3c1141593b91c57bf1051657a1d64fb87da38760c7128a9622b107990f2f2"
 
 DEPENDS = "popt openssl"
 
-- 
1.9.1


