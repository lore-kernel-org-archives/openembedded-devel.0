Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEF7780BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:42:23 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r58so10335904qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 09:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D0W43ug8ny2gkSr7eCfwwYLBQDUifFzB31McK9a60X4=;
	b=pDBHGWkYPdhz0YrWYoB3p38aagKndtMRmo21cy08ZKNiZT1o0biVvPpR8EUDFVe64m
	2pHDXHbn6WOCEi1yz+N4+LT0aoeLdsyBjsLORTtzf7u/ZSY4wzugHB/V3K8EaodKfKrG
	wIKLNfPLc4krUcnRVLHHgAyYIJYoQ2dPYMZ0Nkes3uUPg+mhnSLpDVSDSOBQNZnMmISH
	i1EyXV9Fejyt/4rznTE2Hvtc0CdIhf/DAkoU135fPF0B7UZHIo8QJlRmpUvKSD0Y2UPu
	SN3o246zce4nitl0WpEGF6UKG7KofclFez2iety9FtWUFJ7JyO90Sdwfne7BCJX5ILj4
	l/eQ==
X-Gm-Message-State: AODbwcBpH3P12beuTcvRX0zaavKKWvYxHrxadtVyFyB1OozoFOlsdQFa
	fvVzDr9x3deAjQ==
X-Received: by 10.237.63.168 with SMTP id s37mr10543301qth.61.1495212145215;
	Fri, 19 May 2017 09:42:25 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r19sm6195536qkl.54.2017.05.19.09.42.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 09:42:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 12:42:17 -0400
Message-Id: <1495212137-32248-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: update to version 3.0.0
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
X-List-Received-Date: Fri, 19 May 2017 16:42:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pbr_2.0.0.bb => python-pbr_3.0.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_2.0.0.bb => python-pbr_3.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_2.0.0.bb b/meta-python/recipes-devtools/python/python-pbr_3.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pbr_2.0.0.bb
rename to meta-python/recipes-devtools/python/python-pbr_3.0.0.bb
index a044a9e..f1660ea 100644
--- a/meta-python/recipes-devtools/python/python-pbr_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_3.0.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "dfc1c3788eff06acfaade6f1655fa490"
-SRC_URI[sha256sum] = "0ccd2db529afd070df815b1521f01401d43de03941170f8a800e7531faba265d"
+SRC_URI[md5sum] = "b9ef99a98350a57bbe55b1142807f224"
+SRC_URI[sha256sum] = "568f988af109114fbfa0525dcb6836b069838360d11732736ecc82e4c15d5c12"
 
 inherit pypi setuptools
 
-- 
2.7.4


