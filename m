Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpH-0006pk-5I
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:03 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id ABEADD22D6;
	Tue,  9 Oct 2012 09:52:48 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:32 +0200
Message-Id: <1349769155-12643-12-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 11/14] libedit: update to latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 08:06:03 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../libedit/{libedit_20110802.bb => libedit_20120601.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20110802.bb => libedit_20120601.bb} (70%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20110802.bb b/meta-oe/recipes-devtools/libedit/libedit_20120601.bb
similarity index 70%
rename from meta-oe/recipes-devtools/libedit/libedit_20110802.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20120601.bb
index 2aac727..1be967d 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20120601.bb
@@ -12,5 +12,5 @@ SRC_URI = "http://www.thrysoee.dk/editline/${PN}-${PV}-3.0.tar.gz"
 
 S = "${WORKDIR}/${PN}-${PV}-3.0"
 
-SRC_URI[md5sum] = "0ea42e2c794da8ed32f6307b427f6590"
-SRC_URI[sha256sum] = "0b5ec9aa41faff761cda7819add93e9d8cb9c0bad85e65a686475e8375ac8a71"
+SRC_URI[md5sum] = "e50f6a7afb4de00c81650f7b1a0f5aea"
+SRC_URI[sha256sum] = "51f0f4b4a97b7ebab26e7b5c2564c47628cdb3042fd8ba8d0605c719d2541918"
-- 
1.7.10.4



