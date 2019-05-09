Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1DC87DF7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:16:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so3842672wro.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pK2A2UJiMnEutJdWhjpiW1WffK3gpJeuInNWwouNIRk=;
	b=iaCSSpyHHC+/wtMEPIil4xU1try75w7s2tsZYJpgnAu3ogG0JQe8SS0tH6KoTaTNFh
	vPvysUZDHh9lWm/3BCjcRUFOGlW1YK7P66XCsEdxjfAzZ5jQBkXuf3EcDCPE4eSnaJGN
	BDBaDI+pCJg7sF7kwJmBqpC/jvUKzoZcsewm2hy5DhB2z7p+k1iXed+EqanR/IIEW94/
	kEfghxZn8xLwvmShcOQWL31mPYXywWQ6XEtnLK6/+bpS3CLksX1cMH4qZGE7Uv6F5utY
	iy8z4ixeSGYjwCxcLgAjBSa1Ary+pKHvULVdg2aoFWtMy8SA0bhPw0VVQSDsgJpe0lxJ
	1VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pK2A2UJiMnEutJdWhjpiW1WffK3gpJeuInNWwouNIRk=;
	b=CifuHrnminYoO/zqy16PKFswnDFRXy+t1R7VchXwUGSn0Yd4xaWSgOqTmnKuz4/Xq4
	a7/gYZ/iuBQWeZ5BrC6n8w2H68+Stg7gj7kK0hOJ25EEssBPIbaQ5ojvlozAbNEo3iFc
	DQO/n2xpKR5fh0LWcRgww+tjA1cntYChkvslNHZTF1SoK76ax5fXxnJxxRF6jYaulhgM
	fwqBC1G/H6Bk/4MqJhUaYvV7vfsQSZURf9gQa2t8/tmtA422H3nPrltilfj8lGoFMKgP
	l3G/4SHnDjhuKnYE14iCieHCfkO+u8etIfEmI8qZsAyFpvef7nU40yEM2RcE0ObrZG5J
	9dXw==
X-Gm-Message-State: APjAAAVx0OMpS0OhRe3JkiV0ZlJKcNo+Z1l2EKKdUj9UmNbC9ViUlU5c
	bQBiyLuauoxlRxLeu2vLuSldbTTJUGM=
X-Google-Smtp-Source: APXvYqwtYxvP9bBwChO+7T8UpNvpvAmewK0HnyaK0k2uOueSzUjdD7fA1kyn8hgJ8PW4wzSBS6668w==
X-Received: by 2002:adf:df92:: with SMTP id z18mr3831167wrl.213.1557418587601; 
	Thu, 09 May 2019 09:16:27 -0700 (PDT)
Received: from superandy.speedport.ip (p5DE68511.dip0.t-ipconnect.de.
	[93.230.133.17]) by smtp.gmail.com with ESMTPSA id
	a15sm3682744wru.88.2019.05.09.09.16.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 09:16:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 18:16:20 +0200
Message-Id: <20190509161620.10742-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] Remove me as maintainer
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
X-List-Received-Date: Thu, 09 May 2019 16:16:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index 7431e8b7c..84b019896 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -19,4 +19,3 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
-- 
2.20.1


