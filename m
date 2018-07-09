Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3FA75223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 22:16:01 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id e19-v6so2552082qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 15:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t2HQUqaMCaSH/H7zR2hlzS0sgGNCBrronmnx7ju8MSg=;
	b=Uam+WWoUrHGGAW6waDmJnJ/AFiXRxHnrEdwNxVJ2rpe046SzP/CEP1ncz5/wLlvGWe
	DcP6Lqt7LC/iCsxvoxOtf9jMhT/plkQJw4QPmQJCmAUpwDH3UNQMHyB3E7h+ryXl7Qdh
	wcIHWpuKVVQs4SLq8d7qpLYloUvW9HnlW1/EJuezmFlWg6D0ttLzb8syvWr338erTYTl
	BygwxxrlgYisd5EfB+Ir0oZMbny/cO9zQO/a7TnROgs6KaqddflWZ2tpOQWFAybGO4VB
	m8i38Ov5pYj8cDO9Bus686Gtr++0R1qzCX5N4Gu134iqhYrb/C3HSPXAbX21KELTzyFJ
	zgPw==
X-Gm-Message-State: APt69E1fEZd8FI/5hW0pV1atKd8kcuuMw+BZAVwCB5iY5FoxVgaR3F2Y
	5EojYkX4nWYNJzkMbepMrB/rgbWh
X-Google-Smtp-Source: AAOMgpeW/LSt62EhPhpJEtpv8SzxnC59kniMmcXE8VXcyETlFw0ROM11/aykTT+BQHwzTEDZgC+V0w==
X-Received: by 2002:a0c:ae71:: with SMTP id
	z46-v6mr18402979qvc.108.1531174561779; 
	Mon, 09 Jul 2018 15:16:01 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q22-v6sm8681313qtc.33.2018.07.09.15.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 15:16:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 18:15:53 -0400
Message-Id: <1531174553-27187-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.73
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
X-List-Received-Date: Mon, 09 Jul 2018 22:16:01 -0000

License-Update: Update the license checksum based on whitespace changes

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.63.bb => python-pyro4_4.73.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.63.bb => python-pyro4_4.73.bb} (55%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.73.bb
similarity index 55%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.73.bb
index 6f683e3..88f5b18 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.73.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
 
-SRC_URI[md5sum] = "e1d772b67bf7c6f75fa3174bc95c8839"
-SRC_URI[sha256sum] = "67d2b34156619ba37e92100af95aade8129dd2b7327eb05821d43887451f7d7b"
+SRC_URI[md5sum] = "0375c061b93411feb86da01e801df888"
+SRC_URI[sha256sum] = "536b07a097d0619e7ab1effa3747fda177a24168d17a07a93ca9ac30977608f7"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


