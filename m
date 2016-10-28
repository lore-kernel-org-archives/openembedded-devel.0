Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49FAA71985
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 13:52:35 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v138so2191700qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LHPOm6izyU956isLPCKTYpnUAhs4yr+ywmuayAHWsZk=;
	b=SIcKsm454qpwlxQu6C+tIqWP4CvsLez//+IkPlRAf27bo1vLoa6X0c9qdx8qHnvSOc
	7bDblcCfk1adLpAzt0UAzbfGD93+dihuHk/+L6yLJXM/d4naKOXwFlhdR8vSN52ont3I
	Uuw6LjiToUuM64/7z7xxryMStcOQxCas5xXISBhiWYgkTxhYbqwFYmGw029FJjq+HCT+
	HruxDfhX7OC85PWb/vrq7MEHDdhGSvUF/1W88qxvl0Zv1IeYCV9j8Yv4JLQveDGDVh85
	XA7KorWRY8jSbefPi50m0aW7G0dqj+IS5ugn8P6CEJok4HQLxvFRafZ3Z2Yr5cfPQ4R9
	J8kA==
X-Gm-Message-State: ABUngvfSNjXYVYnjn+AKp/gremMDMCAMSYj5FEWMiR4IDvq7j2KSP+c3CsSajObh7C413Q==
X-Received: by 10.55.92.66 with SMTP id q63mr12948097qkb.54.1477662756751;
	Fri, 28 Oct 2016 06:52:36 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id x2sm6274569qkc.14.2016.10.28.06.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 06:52:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 09:52:27 -0400
Message-Id: <1477662747-3385-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ipaddress: update to version 1.0.17
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
X-List-Received-Date: Fri, 28 Oct 2016 13:52:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ipaddress_1.0.16.bb => python-ipaddress_1.0.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ipaddress_1.0.16.bb => python-ipaddress_1.0.17.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
rename to meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
index 1e97ef7..686d5fd 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
 DEPENDS += "python-pip"
 
-SRC_URI[md5sum] = "1e27b62aa20f5b6fc200b2bdbf0d0847"
-SRC_URI[sha256sum] = "5a3182b322a706525c46282ca6f064d27a02cffbd449f9f47416f1dc96aa71b0"
+SRC_URI[md5sum] = "8bbf0326719fafb1f453921ef96729fe"
+SRC_URI[sha256sum] = "3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716"
 
 inherit pypi setuptools
-- 
2.7.4


