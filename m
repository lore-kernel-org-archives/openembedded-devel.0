Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7F471AB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 23:03:20 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id m59so4046062qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 15:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kmdtvWqkm02zPvD2y8AKwaBKaFLPDezVlav7pWlBNJ4=;
	b=RH9Vkp6stQ/9SxdbePZVgqxigW1LezhUrZpIbIZaAOf/Ud2q7iJ28fUdNa0pjpvGai
	+CLe8IyuUOX7i8tHskwqSa6+9Po6jl+ndyoJeTaxFUlGW2woJp7taiOFieoCLYopH7df
	4iIkSuuR6I4v+JF8ZRtU/mE3SoABd/9X/tr0hlsumo4r4Z3A+8L98mylBo2rbeC5s6+B
	KDC7zDByaAW8bUuEVsds/gGJat82C3DCaqNXc7wLoh4wNtgpm217lLVelJ9UfBjr1XAM
	zmnZuuA5TZFZZTZS4Jxb7z508/QT0jqJ0vnaeqL63Dui6Gqi1gOev4LernlWh4nRub5v
	vbvA==
X-Gm-Message-State: AKGB3mLkF6GTSIG9+JUy9IEBR7gE6DvxYoQOjeWjFUibD7w6qsXVcqCF
	4kvDgmc8qf8l3jUJ3Cp9mzk5BqV8
X-Google-Smtp-Source: ACJfBosKp0eyyIb3nwMdRyyz/XsHt3t2862x3uRvGnp0nQeRiHgOK1QnURmdo1IuZdF6gaetizreoQ==
X-Received: by 10.237.59.74 with SMTP id q10mr3840181qte.254.1515020601117;
	Wed, 03 Jan 2018 15:03:21 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z128sm1277496qke.92.2018.01.03.15.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 15:03:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 18:03:14 -0500
Message-Id: <1515020594-22582-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] jsoncpp: update to version 1.8.4
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
X-List-Received-Date: Wed, 03 Jan 2018 23:03:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.8.3.bb => jsoncpp_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.8.3.bb => jsoncpp_1.8.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
index b7a02ef..88e3320 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.3.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "2de18021fcb11370e9b5a1fbe7dcfd673533a134"
+SRCREV = "ddabf50f72cf369bf652a95c4d9fe31a1865a781"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


