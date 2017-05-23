Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC41777FB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:40:36 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r58so23968911qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rG6YF8BAJCxu7Izs52NIVfiixZBI/Ku4SC8bq+CeXTc=;
	b=nTyzOY9z5REPDG6ggeV/ZUoo+wAdnD7+3TO2UrrQAluMpVqrMAnyWlpsZQ3GRRH3Of
	CEWhItxrVyYqKK1AlRHojIL9jpNFxfulj84qKV0Vaq8v2AOrInbjFwaL8eCFKRtgIGQb
	YLCtQOsPz8MLz8zdJL6mRcYShalTFjLeSWE1MX9ECGPNUOvaP+ZnmrW1Lxejt98wXIwg
	WJMC4X171Vk/6+N3hzxxVwktrxV94+g5ojpqXJdv/+uWZskujDRr7FmmdWkXMfVBskPS
	HTVlAuHpmmNlS2sGot//LxQuKTzIC1iBCKy9gOilSs1Y/wVppG0ovZ+Nsi2NUNDONHr0
	wRxg==
X-Gm-Message-State: AODbwcCKV/y3O1f+yD9dhL7nGFDkYgjFhwMznMZBRXvOaUMok8o+lvrF
	d89/ICoh6gCFkg==
X-Received: by 10.237.37.154 with SMTP id x26mr32155334qtc.133.1495575637702; 
	Tue, 23 May 2017 14:40:37 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id r24sm1289881qtc.1.2017.05.23.14.40.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 14:40:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 17:40:30 -0400
Message-Id: <1495575630-29645-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libxml-libxml-perl: update to version 2.0129
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
X-List-Received-Date: Tue, 23 May 2017 21:40:37 -0000

Update debian packaging license checksum with latest upstream author contact info

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libxml-libxml-perl_2.0121.bb => libxml-libxml-perl_2.0129.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0121.bb => libxml-libxml-perl_2.0129.bb} (84%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb
similarity index 84%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb
index 8bc00c4..a8cc269 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb
@@ -24,11 +24,11 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
     file://fix-CATALOG-conditional-compile.patch \
     file://using-DOCB-conditional.patch \
 "
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
 "
-SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
-SRC_URI[libxml.sha256sum] = "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
+SRC_URI[libxml.md5sum] = "5806b69d54a2d7884b8d22b395888436"
+SRC_URI[libxml.sha256sum] = "5ca0269ba06800c84061a7f3333c85fab5584d69cd7b4e0641963da7fd36b366"
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
-- 
2.7.4


