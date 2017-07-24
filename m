Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA630782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:25:45 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d10so1052549qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CYCUIYFo03VUWEWP87rglXTbQep04iF2UsOnKoDCGOU=;
	b=m9l2cneibI+Oz4A4B31uvLI8aWE+ywJMWTtZcLJppovpN366sQWSmGy3tGpRk+jh0u
	GH1xgfwH8slxTmLT+eCOqb315X1BZh5VypGNkbj0ZojF/oHSWFk7SLSlXB8Cd0tzo44w
	nlV0yt7r/Os5NZKia03fYStyr6wQ9sOmRyAityfxiBgApblBsLNvRlJHfH/d5G/8YNCR
	HHScpy2rpbnsF8rfpcwygSNktilJcbxR+TTxWIrv9rxD39vjJCDFFlS8BBDihcO8xg8r
	zDTLYRJryrWwixYCiXlqIAKoZQnzM4D9sLceK4UV1FwdTJUb23ylIuCUdhV4oAzmXWB1
	zr7Q==
X-Gm-Message-State: AIVw113hjtCc++lSZnoBm3alniUsIbjjWdvIVHgKRUBYEKLEYG6pDqA9
	6ZdQIP3VVu43rHQHlZI=
X-Received: by 10.237.34.39 with SMTP id n36mr21969370qtc.258.1500920746077;
	Mon, 24 Jul 2017 11:25:46 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id 33sm9131292qtv.76.2017.07.24.11.25.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:25:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:25:38 -0400
Message-Id: <1500920738-14992-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.22
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
X-List-Received-Date: Mon, 24 Jul 2017 18:25:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-urllib3_1.21.1.bb => python-urllib3_1.22.bb}           | 0
 .../python/{python3-urllib3_1.21.1.bb => python3-urllib3_1.22.bb}         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.21.1.bb => python-urllib3_1.22.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.21.1.bb => python3-urllib3_1.22.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.22.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
-- 
2.7.4


