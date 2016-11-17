Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4042B605BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:14:08 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 124so24089863qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3UHQmTHTKs09U4cpK+6E8iATOJSJ31S3w+i42m2qwZA=;
	b=E58JphjAhGP5FLcDdDZShRae3rEl6DeKakVv5iUTFfXfjSSnc+lufExxKZfxfTaSK1
	rzcHKscFNBkoF/YI8br0L9lS+n6/suFobNkt1fTmisi1sHrOBAV8mp+ugWbV1a6rsVEy
	xjE5Mexp0hTJM3Cuvz/ZNY/wXEiNQ8IUOFRe0bygDzXlXHMVA+/zWK2uEPL0aYPRafj+
	DQHNrBTEV30QmDJNXW9/9mlzCIgRqSQ93fTyg9xrfn4j+JgMpWg8HFPPI5PTK+IiXVkV
	rjdqy4nWm9xbf8n7MZZHjjT7OwLIapjlcY4Y4luTHrD1XEkuW5Zdc/qYnEZMwOG/RT/h
	w0Sw==
X-Gm-Message-State: AKaTC03TWfG2v++K3hApa/WxsnnYJNRgxwfXUcqd7pw2uZv2tYtcnDwMg/DVTOHhjKw75g==
X-Received: by 10.55.203.22 with SMTP id d22mr855324qkj.240.1479348850166;
	Wed, 16 Nov 2016 18:14:10 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	x123sm372861qkx.46.2016.11.16.18.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 18:14:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 21:14:04 -0500
Message-Id: <1479348844-16407-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.3.2
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
X-List-Received-Date: Thu, 17 Nov 2016 02:14:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-zopeinterface_4.2.0.bb => python-zopeinterface_4.3.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.2.0.bb => python-zopeinterface_4.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb
index 985074b..461fcc6 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "2950a6db7e985e19c7a846cc20f5d82a"
-SRC_URI[sha256sum] = "36762743940a075283e1fb22a2ec9e8231871dace2aa00599511ddc4edf0f8f9"
+SRC_URI[md5sum] = "5f7e15a5bcdfa3c6c0e93ffe45caf87c"
+SRC_URI[sha256sum] = "6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee"
 
 PYPI_PACKAGE = "zope.interface"
 inherit pypi setuptools
-- 
2.7.4


