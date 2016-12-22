Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 81E267740F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:08:35 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n21so95235554qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 18:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UWH8y+8TVsQ9tUGwQePu1KxbCE+54LnDHkRwAgrInyY=;
	b=RT/ixuWRc2wD2Qemw8Ti7HkMWzDj1XhEIGPnqgmgze7b8bNxh9Ixqk/mnJoysIHLV9
	oZB6UnWxYZHf1mXL519xF3X7u3n82knZR5tIA102hI7NjIx5FnUeV8AsfSVaQfp0On08
	SdxWXhljZRTPy4E/Ptw7duZt6slkuGbFgdNWhcq/kJ1YkPrWoPPkEmuTs6JwzhoYKAjo
	+A+d8pRNzQhbON7dYHfmTsLZhYXZWX5Yo0laD5XvHmkbi/a0BCD8qSo8iUkm7LYVvkGr
	epONlRgs0CC+Rp3+5HsTuKlk1jQ6TOUxr/SetalCbdtFE8kXC9gX/TZOpS2Hy4MMosl1
	PhXg==
X-Gm-Message-State: AIkVDXJWpoAsfzZUb+Ww46OuBGYohSEzs5FqKge14LEA7uU7J0tqO0+MTUIjsRb55gVWIA==
X-Received: by 10.233.239.194 with SMTP id d185mr8903080qkg.122.1482372516452; 
	Wed, 21 Dec 2016 18:08:36 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 83sm9794732qky.43.2016.12.21.18.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 18:08:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 21:08:26 -0500
Message-Id: <1482372506-1134-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.3.3
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
X-List-Received-Date: Thu, 22 Dec 2016 02:08:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-zopeinterface_4.3.2.bb => python-zopeinterface_4.3.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.3.2.bb => python-zopeinterface_4.3.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
index 461fcc6..7596394 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "5f7e15a5bcdfa3c6c0e93ffe45caf87c"
-SRC_URI[sha256sum] = "6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee"
+SRC_URI[md5sum] = "ba3f32eacaea66094b7e2ae2788cec89"
+SRC_URI[sha256sum] = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"
 
 PYPI_PACKAGE = "zope.interface"
 inherit pypi setuptools
-- 
2.7.4


