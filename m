Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 56D967FC50
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:08:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q9so5126236wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hpnWgJTdEz0hT9KU/8cRC4gK167tk1Wz45kkO6ielE0=;
	b=qhPdqP51RL2Uj7RSN0fC+ISSUTz7Gcd1oJUkupEyZWWKk+UCE+hRZomn442wj2M/YO
	W2ReY5A/v11ztO0LXlmvBPRwpNBnHZxB2jbNqZYAhdAQ+rm8fSZQBtKWiijRqw268Sin
	2pN/tOhT1zPgxEtXZMVevQ3C8eJ+I8tBWQMrn0A+ttE3mZMpo5YBUUuBd9bW80/ZL1Sk
	sJ3LX7X7CqKXUM8K00K7UrzHy5f8ssLA3XjwxNo0wW2nXhDAQzgo90moCkHJAmoq6FWl
	SFhbEJJNur1V16dMk+sPM/0Y7XE2X3i3Cyq+L/cAHMMMgAyXNyUviZ7HdIXmyahjDZtk
	SgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hpnWgJTdEz0hT9KU/8cRC4gK167tk1Wz45kkO6ielE0=;
	b=cKsPD37jpnWzJ8HaByhCIPMLSNTRzEyALIIlG79Ks955knqBisM1m737laHbj4Vjes
	Gjx13u/coCLxPxK5QfXfL0aBkzo37d+Xk5BaWRWmzpLf+skSeURcNz3ZGgNoE6tz1KPJ
	E8Gz89ssFHxoBj0ZSxau5dfGyd6GoF9OJ2TAno0HfKIZmMB0T1z4+QvdrmzLM7LZZzrh
	/Qqr1axHYk+WvqSIxAwd6DzQ2OjbOkpfrA69HruftNkoDjL/GiasZgDRWw5IrdRvD8Ht
	f7828FzrU1sypTvBjLAtW9Ik6bbwnp521QZiJIc/HNIqpQ/mOa7/m/iwUx4ugc/BHoF4
	FDpw==
X-Gm-Message-State: APjAAAVx2dW4ppzRpQ2sPi6nzXmNz9gEv/8JlyGP8apCcmF3LbMW8S8w
	LpReJa5Mm5WRjUvgDwt2nSyQlUua
X-Google-Smtp-Source: APXvYqyjIX7ZBCzRmlvvMREWBWpOiGqvzdQhDituLE/XHPJNquBHjNdIKfRKv2QlfdrZ44o06csdCg==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr54831wmj.75.1576022935998;
	Tue, 10 Dec 2019 16:08:55 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A278D51D7E1425A5C61C.dip0.t-ipconnect.de.
	[2003:f0:7f05:a278:d51d:7e14:25a5:c61c])
	by smtp.gmail.com with ESMTPSA id h8sm163481wrx.63.2019.12.10.16.08.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 16:08:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 01:08:45 +0100
Message-Id: <20191211000845.13166-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211000845.13166-1-schnitzeltony@gmail.com>
References: <20191211000845.13166-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gnome-font-viewer: fix copy & paste typo in SUMMARY
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
X-List-Received-Date: Wed, 11 Dec 2019 00:08:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
index 5be8d5037..d8f7e301e 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "GNOME bluetooth manager"
+SUMMARY = "GNOME font viewer"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
2.21.0


