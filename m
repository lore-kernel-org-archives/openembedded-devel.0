Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAB7731D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:31:54 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so18783152qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0xvQQA7+KvtClShh7K/dNNtvZGCHwoLAfq2LTxIkDE=;
	b=fc/FI8RzSJXny11TseFGIVeC3yfMTEtJRcarDTEUmcXRDhFzyIOYjxF6MeRoGpQJ+G
	ItJ/WIp8ToDZdR+IP/D6hG5jvjTEcKP8OzNeOnphl//l5A7XHw8hi3eg6SYU3KwT+vj0
	4VUpCbWG6ysIabkumyD+P63WSxmf0pRbwqIaLsVpGb//xwiuTHtR8VqrUn9lFNiwLoTv
	vXnRVY7/iYpEJbWjL0XkBiEYHl+uSM9xJO6xYh/DImkExutmTQMTFgtAvljMbo1q2O28
	JSNSn1fXKtfTA/uNQyh84fQ+sNQndl550nLaEKCeOKYncY6+GWzZ7Pjhx2XfG4ag034S
	Ckzw==
X-Gm-Message-State: AIkVDXKcAohcAOFQnLGh+RKCA8jrPVcjKyNfX06q6e9sczbHWQPhV+r8wPRyzRchgCWq5g==
X-Received: by 10.55.82.84 with SMTP id g81mr26489670qkb.235.1485192714976;
	Mon, 23 Jan 2017 09:31:54 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r131sm13695875qke.14.2017.01.23.09.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 09:31:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:31:41 -0500
Message-Id: <1485192701-13956-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-flask-bootstrap: update to version 3.3.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 17:31:56 -0000

  * Updated license checksum for new release revision

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...flask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
rename to meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index a115f23..2b2a6f9 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3452e378337a5cc2092d32a140178d5a"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
-SRC_URI[md5sum] = "b8aedbe51f2bf511af955f2bc288cd8c"
-SRC_URI[sha256sum] = "3a7b71e22596a6d559965e059958960e0bb671adc131537a79edb491a8f31714"
+SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
+SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
 
 PYPI_PACKAGE = "Flask-Bootstrap"
 
-- 
2.7.4


