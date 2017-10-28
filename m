Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DBFF278299
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 12:47:24 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id 1so11466806qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 05:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GzMP5AtsY11Oa5e44aulLbfy1rLZ8PYplEwkxZtoqas=;
	b=D0kE915cRGJNH7r2j2upSIyqF5ijx0IB6IIH5if4P2jdzuJtUHgJJeItlIjjKIMl8p
	Mvb5MhZ27hlezQQUMpsrrhhGLKBGpjLXHdCCPUfaHbdDvOpe928hiBo3N5AGORNMYnlh
	0h3jM+HiDo4o5Joy4ML0OfY2ovsNBxpjbtQSyffeavmD97dxvakYF8sIotV25ZbqqrEf
	I7rhpAk+7MBdt5SrB268M3ryw5b20NujLhLssb0+sL00DSAJsFqNd17UreEkBD+VMncN
	S+ttjipi8U9omQxhlMHMPcV8NBfTDOxIGRvsdBYN5rYkadQjB0Kd0IbXF5l8768D6E78
	90Zg==
X-Gm-Message-State: AMCzsaWMHhIk5Cv833s7RA+WaOMYEO4Q5TY54FMQvcZ9YTSmxZHl5xqx
	2d4Ghj4ZcxmpNOzHGOXZ6bDMglG1
X-Google-Smtp-Source: ABhQp+QhYdNUp0vNU0QwqZ8rz2cDQZ4SamgcV7pCjoys+INlcVEtH8h30kBu/LFxpsHSXUSzyJr0jQ==
X-Received: by 10.200.4.169 with SMTP id s41mr5686710qtg.212.1509194845830;
	Sat, 28 Oct 2017 05:47:25 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id i1sm7052454qta.19.2017.10.28.05.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 05:47:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Oct 2017 08:47:17 -0400
Message-Id: <1509194837-3156-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libxml-libxml-perl: update to version 2.0131
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
X-List-Received-Date: Sat, 28 Oct 2017 12:47:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libxml-libxml-perl_2.0129.bb => libxml-libxml-perl_2.0131.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0129.bb => libxml-libxml-perl_2.0131.bb} (90%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb
similarity index 90%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb
index a8cc269..4105249 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0129.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0131.bb
@@ -27,8 +27,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
 "
-SRC_URI[libxml.md5sum] = "5806b69d54a2d7884b8d22b395888436"
-SRC_URI[libxml.sha256sum] = "5ca0269ba06800c84061a7f3333c85fab5584d69cd7b4e0641963da7fd36b366"
+SRC_URI[libxml.md5sum] = "4dd1efcda5159c9e73139a4546190665"
+SRC_URI[libxml.sha256sum] = "b04c77dea55f9f270e1040e3a1d4f79b81dcdcd4da3e648f92dcf6c80bbe19df"
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
-- 
2.7.4


