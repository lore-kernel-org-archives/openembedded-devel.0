Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E283E71AD6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:33:03 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n189so8473190qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gty4KpXSWv63patPpVbOQdZeadVGhIdj22BkxNZe144=;
	b=F0QhatKJHy6fYE7D/WILrey2JoUmMTl8jwn+OedJu+NvQpIl5LBENgyZm/jR26IUWn
	qWzxxYneGijbdquM/Fff0LiZq1b59czxFKdy4gKgxhJjjCxV684O+kTnJ9UClgJw9s8o
	fsH/aaFaF0FiQV1QjzF4Q+qeXuBKZDKltbgaG6gx1DKbnB/hFWMb9dAmF5g/fr+KlEE6
	sSUc76wYHUBZmYPIxOmth/a7YgE4mkHFxMl1sV4qthTR4s9P75d0sJgaltrOlQLicQjg
	NMoz62b2Opr9HTN0UzHFHLv1RWVkzTx0HbYBqoC0bSkcYGGujMKkF8NcWkqNfqxseb+I
	9BDQ==
X-Gm-Message-State: AA6/9Rn8MXdBlJdg5iwvq9rHWQs/AaRADmvB0IsrXYofT+xFd3hWWfOukBw/bmiCgwrTUw==
X-Received: by 10.55.19.106 with SMTP id d103mr10909035qkh.258.1476448385073; 
	Fri, 14 Oct 2016 05:33:05 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	o25sm7418593qta.39.2016.10.14.05.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 05:32:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 08:32:46 -0400
Message-Id: <1476448366-30186-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-evdev: update to version 0.6.4
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
X-List-Received-Date: Fri, 14 Oct 2016 12:33:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-evdev_0.6.1.bb => python-evdev_0.6.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-evdev_0.6.1.bb => python-evdev_0.6.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-evdev_0.6.1.bb b/meta-python/recipes-devtools/python/python-evdev_0.6.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-evdev_0.6.1.bb
rename to meta-python/recipes-devtools/python/python-evdev_0.6.4.bb
index 963b162..1948263 100644
--- a/meta-python/recipes-devtools/python/python-evdev_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-evdev_0.6.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[md5sum] = "8a3ff1012534963cfc16efebcc208fa6"
-SRC_URI[sha256sum] = "67b3c71461e5ce191a34cd4ec17f6b3d59e66f6013f98f84c2fba817b8738a3b"
+SRC_URI[md5sum] = "40c8c01b337874c64638948a4d7cb404"
+SRC_URI[sha256sum] = "5268744d8493c273614036cf6423fa175952c64fc1d8d265210e48a4437a6af2"
 
 inherit pypi setuptools
 
-- 
2.7.4


