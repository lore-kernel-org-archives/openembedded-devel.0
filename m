Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 064B560796
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 16:20:21 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 1so16985439qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 08:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QjhXEiRsR0GVTKKXyvM2SflAlCVtvXQYaGRQf+M5B9Q=;
	b=G0RKyUKqC5kh1jjloGzB6EXJydB3Spai9TokGGvJuXpTklC5tPk4q4VG6I47lDyVLA
	+AXPbLywhc74e5KRq9s8Q/1LDo2thnDPoKhRedZ4jeFU5PExDwawK28f5PSS4JvjhDr1
	tGI3bQ8gxU+Ticr+qBAXcdw2PIcYT08KiZuFxKA9ZBm64vPaUumDOwyf7uWNFwPujsFh
	vimS881O24VPnbVMIBSDev50Cxw+TMfLPXnwsPu/2XXTkzaBO7O+Of6k0cGsS4eGipZM
	et/Njqo3FkVY3X9iJD269gRuv7fRgm+IVqWzjKI2HqXR1IZUks7xg2lDuUeQY/UYTCnP
	3ZoA==
X-Gm-Message-State: AJaThX6HXbYfDM+Zz1SAuMpBPoFuQOyqElEQ6PnyzWtE/SQ0swtpr8J6
	TsQzV6ZcpjWfE8ev8pMrP6VhTkqL
X-Google-Smtp-Source: AGs4zMbZ6d2+OG4w+jbpgff6sGlJiv6+OJO+drBb6VaobrvwXlZSYl8sEGN8/ScF/XbPefy8BP66pg==
X-Received: by 10.237.60.120 with SMTP id u53mr9547568qte.202.1510503622553;
	Sun, 12 Nov 2017 08:20:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s51sm9638268qtk.32.2017.11.12.08.20.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 08:20:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 11:17:47 -0500
Message-Id: <1510503467-28767-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-multidict: update to version 3.3.2
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
X-List-Received-Date: Sun, 12 Nov 2017 16:20:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-multidict_3.3.0.bb => python3-multidict_3.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_3.3.0.bb => python3-multidict_3.3.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
index 1a3eb0a..7f9cd55 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7ecd7c2807fd76ba7ca83e4e0c7fdf5f"
-SRC_URI[sha256sum] = "e76909da2fad6966281d4e0e4ccfd3c3025699ebcc30806afa09fa1384c3532b"
+SRC_URI[md5sum] = "06ca91d993de2d04c7ee6df0cbb44ea2"
+SRC_URI[sha256sum] = "f82e61c7408ed0dce1862100db55595481911f159d6ddec0b375d35b6449509b"
-- 
2.7.4


