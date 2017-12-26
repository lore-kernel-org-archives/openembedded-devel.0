Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id D7CB371A32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 15:45:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q14so31043380qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 07:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0uVaCyWXDr+2ZG44iIrcOT76pqAaZjhURnJvXIwc7bU=;
	b=OXNX5Qi4yn56PRlY7AAeNKnwosJfPlsgMFxIsAdSqNkSeOSuxGZ8DBqbf/GUFD+oXO
	d2mUYmSzrUaqocao8JkPcUyiMzc+KVLQxiOA40cXIAHuj2HKmMzmQZXCABVN9xQtnDKs
	sEOmiptbEmySDtOhs8CFAscA0scEt+9Z65/vq9L9JwK2zDyrjKMNROSeYpeLfk+L6G8a
	Fji/hOGT40YiRL8hmA/dEDXrBP3BS9TexRHxUZxf+iIBx+Tkcp7RvSSCEhe4LzMLWgwy
	wjYWceCULDtCR1AsN30qRNX99o08T8Q/FaCJMrZXwqS+WjB99FCJ7es7oFyX6h/2xXRr
	vkEA==
X-Gm-Message-State: AKGB3mJh0aVgw1669mcpPiNorj0xFpqjTOZnnGLAeSSONM5HYPaANtLM
	ODFUi/hcD2OzM+g6370aC7HefSD5
X-Google-Smtp-Source: ACJfBouxn3URs4+jTVJnrqBy5htY9iJeqiOYm90HrG70aqox9bea9t8gDBD/LU4md/M6GbNqi7tzDw==
X-Received: by 10.55.98.65 with SMTP id w62mr27436982qkb.322.1514303146699;
	Tue, 26 Dec 2017 07:45:46 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	185sm13752741qkd.1.2017.12.26.07.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 07:45:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 10:45:40 -0500
Message-Id: <1514303140-7737-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-langtable: update to version 0.0.38
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
X-List-Received-Date: Tue, 26 Dec 2017 15:45:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-langtable_0.0.37.bb => python3-langtable_0.0.38.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.37.bb => python3-langtable_0.0.38.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
index 4a3b2a9..177a2b5 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "3f001eef027ba69ef2fdb35c670b7da26b79b5e2"
-PV = "0.0.37+git${SRCPV}"
+SRCREV = "35687ca957b746f153a6872139462b1443f8cad1"
+PV = "0.0.38+git${SRCPV}"
 SRC_URI = "git://github.com/mike-fabian/langtable.git;branch=master \
 "
 
-- 
2.7.4


