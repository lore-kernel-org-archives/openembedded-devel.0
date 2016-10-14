Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A370D71B4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:23:43 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y38so3664093qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tTJ0DcGCVX+2R8K7pnOX32tRlXZRf3ffbfSBQatlzRo=;
	b=ZGkcPTminA55yFd3icQ1ePG/k+z7wEuieA2ysX7jQi/joBMvkHkdMybBc1oSn91IdJ
	7W0B4D+TS2D269KOpJF1+zlv6rZoQYktJsL8HkiQMp3RlCHWuaIIq5RxYbwQg8UjABmJ
	LAZBOrCnZW0pTAln7xURSTx7qNJoatYavm3vGIzPyjIJ9pSaAIbjBOnGc0pDRjJIDzLL
	a6aoKDa+0kB0W0EFnmYrl+M0FoS+Z6sd2fdKELipNCNy++9WGcYpINNHziyfdxM1GMxZ
	8hJCeTUzpypAONfEZ/5NYMzWR7Iwt6xyZX71G64XAzHtgTc75A9KxzwDh85GDNlNjF3q
	f3MQ==
X-Gm-Message-State: AA6/9RktQVw/C357exGUoTIy1D0xgaSkFgKEHTx+XeNa1eeQmk1uQxaF1xcV+iXaWIL9Kw==
X-Received: by 10.237.43.7 with SMTP id p7mr11848637qtd.143.1476447824704;
	Fri, 14 Oct 2016 05:23:44 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id c5sm3750899qke.22.2016.10.14.05.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 05:23:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 08:23:26 -0400
Message-Id: <1476447806-29195-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.6.9
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
X-List-Received-Date: Fri, 14 Oct 2016 12:23:43 -0000

 * Verified license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.6.8.bb => python-cmd2_0.6.9.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.8.bb => python-cmd2_0.6.9.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb
index ddc7f38..ed99792 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.9.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=17;endline=17;md5=25c0f7ede01b1eab41daf880e5791f05"
 
-SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
-SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
+SRC_URI[md5sum] = "cf39b5a34955d263b42a7ffc9d3e536d"
+SRC_URI[sha256sum] = "ef09745c91dbc13344db6d81f4dea4c844bf2fabf3baf91fab1bb54e4b3bb328"
 
 inherit pypi setuptools
 
-- 
2.7.4


