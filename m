Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 826DF771A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:30 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id b67so110641157qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m46hhcG2Mpv5FHdE0ifqaO+YAj8KjwVrr792m661AgA=;
	b=dw3fiijyCy6G+EFYVZcF+kG+mMzDqRJGMroUOlUKvoWf+DwpMw74MAKIdR9Dl9MuUF
	Ew2NV7CwpWRUIZ99uTRf2LjpIng7sk+/JMhHlWjwVZPIlLLuS/BdRQyHIUdo20uehoKn
	kgKyfyXkwKq+eiOQBB3ntVWKPc0TOpixffvBKo1rtvHCLQ1j49CiygJdzS3HQaoczR8n
	w0RN3EUCFEYGZ2heQcxGq8fsWYE/cmbKcT+fBmVSYZn5M6Fqe2kBkpJF1Y126r0doc1r
	A9uLQdCR/q+CAwi1ymlWTaPZ9uJUI3FCIzJUUeIXb4ZQMWeOE4b2At9PiV9i6xI4Znp5
	0o2A==
X-Gm-Message-State: AG10YORal8UViM2x/E6+f18dkbivazsnCHqS68exQRrcMg/Egt1H3wmxPceVGEeVXWHxQg==
X-Received: by 10.140.92.181 with SMTP id b50mr34665832qge.44.1456148130734;
	Mon, 22 Feb 2016 05:35:30 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:34:56 -0500
Message-Id: <1456148105-9644-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 02/11] python-flufl-enum: update to 4.1
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
rename to meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
index fe25fd7..ef10848 100644
--- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
@@ -4,10 +4,10 @@ specific, concise semantics in an easy to read and write syntax. flufl.enum has
 features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
 
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=250adb4c74c359b7049abcd9d6b115e7"
 
-SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
-SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
+SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
+SRC_URI[sha256sum] = "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
 
 PYPI_PACKAGE = "flufl.enum"
 inherit pypi setuptools
-- 
1.9.1


