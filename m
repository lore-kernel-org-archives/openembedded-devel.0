Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A34071C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:35:01 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i19so2278439qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nPdoWwWVLzKhFlnbFQa+Dw0Nxc2Az7sXMNOfjUWLY7o=;
	b=HgqLlRP3MkDz3NoVxVHM2iDnxcJ21saCBLi0BzfKhdQKYJelobvnDVT9O+dhjVw9Xc
	QrySJaAUMQw3IftQwYlpZDqoXNbpWgNEJnBfmVrINA44Bbp/dGGix5+Ry7pA615tZb/n
	oE2vLrKfDpsOTN7ymdddECVmhJDTfxpp0NGxsdwK53JyrOzQbSBUh6cKLlax+3dPcZxr
	aSNitQJ/EEuhfmGTGy0X2EETzUYolexqg1sZLvlkGuXG3CKDqcPP3G/assHmLXCrmmwq
	01dQ5DvxGq+Cq18bj/Mp4qdEkO9jiKilqOPagVvnStCyu+NLMQdIo/BstjkGzzLIwYqI
	2DAw==
X-Gm-Message-State: AIVw113A0J6GBK0QK26KZegKwiHrsJW8qm4wQHuC3L6NOFKhIJTzuf1n
	F3TTRgTDm+9Aa/6breg=
X-Received: by 10.237.42.55 with SMTP id c52mr22843496qtd.311.1500921302127;
	Mon, 24 Jul 2017 11:35:02 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id w42sm218356qta.27.2017.07.24.11.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:35:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:34:56 -0400
Message-Id: <1500921296-15446-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-evdev: update to version 0.7.0
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
X-List-Received-Date: Mon, 24 Jul 2017 18:35:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-evdev_0.6.4.bb => python-evdev_0.7.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-evdev_0.6.4.bb => python-evdev_0.7.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-evdev_0.6.4.bb b/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-evdev_0.6.4.bb
rename to meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
index 1948263..0875da4 100644
--- a/meta-python/recipes-devtools/python/python-evdev_0.6.4.bb
+++ b/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[md5sum] = "40c8c01b337874c64638948a4d7cb404"
-SRC_URI[sha256sum] = "5268744d8493c273614036cf6423fa175952c64fc1d8d265210e48a4437a6af2"
+SRC_URI[md5sum] = "c7e855ae9f97f869a59e75b29f05ce74"
+SRC_URI[sha256sum] = "57edafc469a414f58b51af1bfb9ee2babb9f626dd2df530d71c1176871850aa1"
 
 inherit pypi setuptools
 
-- 
2.7.4


