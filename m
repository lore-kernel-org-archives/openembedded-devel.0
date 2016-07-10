Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D0822601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 11:10:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c52so1309103qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 04:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O45kfh5lUYtBaCQxExAYszW4HN6kXL5q0wgg4PNTPU8=;
	b=d/ijQREsGsNxdG3dwzBcUL9qjYSMULskbhc8JJz2V+1Y2pMuq+iQZ9QlQ8QoIMjXjB
	NZaAbFQj3acPiC4X9YQbCC+nc9dUw7bHTSjrufnvgziM3VtJBjW/F+zw2PQNiXrq7JuJ
	+yLstgvBfnakbQqagIqyZ9BGxFG3Ag18On/JGk63COmAp6HLGi41WPr32YOAUDDflGhQ
	Mrg0e4jbVudEB8Sn/OixZeLjCZD3HzQ5qUZNjSlP0rZlzjAWZ1qXh9q9pzdDx/Ug3KCP
	PkMZsEUbK7HWcIDCvVpzoUOBMx9oRwigzYyqCngob0FKfm0Oa0lxvBVuCLBiauGGIJE3
	YRqg==
X-Gm-Message-State: ALyK8tKbs8wZ7eX5BaFRUK3lXGfW211m9P8lbgsaPO51POSVKlUuwRlpEeWOKh0ZlIL8oA==
X-Received: by 10.200.40.181 with SMTP id i50mr21801327qti.89.1468149022049;
	Sun, 10 Jul 2016 04:10:22 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	128sm1787379qke.10.2016.07.10.04.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 04:10:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 07:10:11 -0400
Message-Id: <1468149011-28273-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.1.1
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
X-List-Received-Date: Sun, 10 Jul 2016 11:10:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-zopeinterface_4.1.1.bb => python-zopeinterface_4.2.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.1.1.bb => python-zopeinterface_4.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb
index 15f8e20..985074b 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.2.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "edcd5f719c5eb2e18894c4d06e29b6c6"
-SRC_URI[sha256sum] = "91cba7b7cd7cb82f6f4e023fe77f94dc3df4ae5287fd55def2148dc232d0c7da"
+SRC_URI[md5sum] = "2950a6db7e985e19c7a846cc20f5d82a"
+SRC_URI[sha256sum] = "36762743940a075283e1fb22a2ec9e8231871dace2aa00599511ddc4edf0f8f9"
 
 PYPI_PACKAGE = "zope.interface"
 inherit pypi setuptools
-- 
1.9.1


