Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC4378259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 22:27:33 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u42so41215209qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 14:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7zWbDWfwOsYbS24v5I4E8wES+dzlOILuwMgHPJNbuRc=;
	b=nOUrMb5pWN4xSxuYOdpaQixb9ivK0/dVD+GCFS9/uZxviu9vcFp2nmEUdf06YMCHSG
	MfvWrohXZCThj4CrfokMBqmHnPZuQq3jy0ufSY8En3TzyJWtId+IDrqtakTNzISOPU0L
	5XOvP0MME1ggCgIkNzWsOFSDzqCDxJMEs5kBWsmqaK2Qj0N1MnbWA7eBXjrE6RaNhZC9
	3OJD939JzhZEANiwt46j1zmGzzjmBsBrgqMTYTqI32tMRdiGHs1Ys4TDvVTB6EcD4DjL
	BS4eFJShNd8A7pImw0170LRxsV45UorDmJTg9mMihPkpEL4Lt8zrjKm1VXPml0lHTRKH
	mPsQ==
X-Gm-Message-State: AJaThX40XM5d7dG5xe5W2dethJ8kjGbrm3zLWs9Y3HI4gomCjJszAzVq
	GX3fXh4eq0Zod1q+9X2Cs4ideq7O
X-Google-Smtp-Source: AGs4zMa5wV5wf+cWDbQ4qEnw+GdBK3RvAze1oDHaEiH05uS9n+zm1lToDcGQxwtPezpFmB3Y3KxBOA==
X-Received: by 10.200.34.239 with SMTP id g44mr64496748qta.11.1511821654926;
	Mon, 27 Nov 2017 14:27:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s27sm14878623qtj.42.2017.11.27.14.27.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 14:27:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 17:27:24 -0500
Message-Id: <1511821644-30673-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] dos2unix: update to version 7.4.0
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
X-List-Received-Date: Mon, 27 Nov 2017 22:27:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/dos2unix/{dos2unix_7.3.4.bb => dos2unix_7.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/dos2unix/{dos2unix_7.3.4.bb => dos2unix_7.4.0.bb} (93%)

diff --git a/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb b/meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb
similarity index 93%
rename from meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
rename to meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb
index abf7d1c..8d3c578 100644
--- a/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
+++ b/meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
 
-# Release 7.3.4
-SRCREV = "8381ba4e1c4cd5ce98ebd9c24726d51cb203cde0"
+# Release 7.4.0
+SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.7.4


