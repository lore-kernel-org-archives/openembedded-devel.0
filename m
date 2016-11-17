Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DEDA260762
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:31:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h201so24118899qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CMPLzJYwJv34XTktkBOqsfkHwGuNXq+lYEOUcW9wb4E=;
	b=IeU0UKDUlPWEAL8ZdamysLN/JCBjxfNkYIvm8Vhg9D3VPR7ouM1DqnPfps4dIm6svn
	fVm2WBO7mgSHSOgLT/cd4O1DIdL4eqlXJc993txrP7zvpTXi6Gz0vBEc6hLLX9Kg5l4V
	VhidtwAL0fW/5S3K5RUnvLoyd4/eg0mF0CtFFOYI15fv58ZtmIQYCpp+P8WWpGcFRqy1
	rP/Kz36QpkhvO/ZMRX6S6vsVZSQJ6FfCUKeWSjlNW550MwBWmkTiOoQZvep9R7bZ4kq9
	TeOdLq7LgywOL6L046VFwn3/hnE0lzTF/NIVbBzqfjDFzQRliCHwk7CK0cAQ/iAgbdWg
	wvbQ==
X-Gm-Message-State: AKaTC01lASZUKFheoO2xSTVxzm7qUF4TGfMI+64WqY7phrxzHyiIXTV7DFkcn49unGp44A==
X-Received: by 10.55.143.195 with SMTP id r186mr913903qkd.152.1479349902924;
	Wed, 16 Nov 2016 18:31:42 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 30sm430112qth.14.2016.11.16.18.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 18:31:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 21:31:33 -0500
Message-Id: <1479349893-31538-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-vobject: update to version 0.9.3
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
X-List-Received-Date: Thu, 17 Nov 2016 02:31:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-vobject_0.9.2.bb => python-vobject_0.9.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vobject_0.9.2.bb => python-vobject_0.9.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.9.3.bb
index 56f0112..58cf00b 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "ccf66aeb1c896d8c34ac62a8b4e7ecfb"
-SRC_URI[sha256sum] = "8b310c21a4d58e13aeb7e60fd846a1748e1c9c3374f3e2acc96f728c3ae5d6e1"
+SRC_URI[md5sum] = "fe5996008d5e4858d63156b37b43d59c"
+SRC_URI[sha256sum] = "10b150b87ee5fffefd3aa1ea12f31aab45a7b7d010d1ce6816afaff8db726520"
 
 inherit pypi setuptools
 
-- 
2.7.4


