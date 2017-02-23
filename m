Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 070F972FC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:01:27 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x35so2496062qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=toiQgzIJTkB53CCRjDp3UncCZ3PIjB5VQMmyr/44oyA=;
	b=tNwzoBNNt67VA+J5BEkvW5ajzT+xfUUYAzyTHhSF9DAXZEzJm+YbuI2wRfDz8GXeFH
	/rRHbWl7w77E63FW9d6bw7HEjwUeWOeRAXiVYRk89fu+u7ch/GZ9mw9eyTgm2Qij+0b4
	7+pkMIvw7dNBqpHt5n/nmlVgxbDVldkHrj8eBJDQ9VHu5nbNb3ZP81UmBMmqWp/jBOza
	0FgjCN+6sU71gC3XoKdjnPem27qFMPGy8cJP9EFL86V8AqrlnM5t5cDtoHHdvpMTS59o
	9ueAigrFqh1NbmJKrMxnaXA0JyhAuQBQtbIM3pbKrcVvnq5l71cA8Q64rgYkvkqd6Wsr
	d/tQ==
X-Gm-Message-State: AMke39lQPcMH6zwm8Qja6lEjiRZr6rcF59F5qp5996s70EHsx24gm6IzJybYXzNj1AdM+Q==
X-Received: by 10.237.63.39 with SMTP id p36mr4155999qtf.187.1487808088305;
	Wed, 22 Feb 2017 16:01:28 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r24sm1677430qkl.54.2017.02.22.16.01.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:01:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:01:18 -0500
Message-Id: <1487808078-25327-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.55
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
X-List-Received-Date: Thu, 23 Feb 2017 00:01:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.53.bb => python-pyro4_4.55.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.53.bb => python-pyro4_4.55.bb} (70%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb
similarity index 70%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb
index 4730150..cc28a81 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
 
-SRC_URI[md5sum] = "71a2629229b7101996d41282c5c7157f"
-SRC_URI[sha256sum] = "c6ca6461472a74a7608a2247413b66e951889351fcf8e9eed5d7232ae844b702"
+SRC_URI[md5sum] = "0400a4d260dbeaa4e7e725c4ba310ead"
+SRC_URI[sha256sum] = "49a7a142542d87dde1cecc8d3ee048ec9481ba861d61234d219fadd06e6ced96"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


