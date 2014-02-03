Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D6F276E94E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 13:38:53 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so3606868eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2014 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tZg1Ut3ZCp4TtrdDzxMG8s9QAuYIros/KwgkWK1lYQY=;
	b=N8f1f/GZponsxkdNhLYvR8StWUjYwiSTYkHGilBaKPtAFTDytECOeuAUlFdJ7m4Vls
	GxNdRvUm4KxmFNqKB9EQCXCUMvjmAuGIY9ajJk9LERbdG+m12S1Y4WIaY84zIMZ480lw
	D9Vt4MtmYWjbUt+0tGH88gFKQxugEK0OGSgv6T3U8ywnyA7ByC3N1+gyEAs4xG5M8nBP
	uzW0EEpEH2saZbEAbx5BsgAhDSce2kdoZHzVj7UMDT5iM6JYXXVp6xMk6PjKaK774lBw
	YqiXuVVWZ6O2wdydnliN/5fEAuIJGCAtZjvAhi7AuBXVM2iGOjHv25o5q0QStpNloM3c
	w9RQ==
X-Received: by 10.14.113.199 with SMTP id a47mr8777269eeh.41.1391434734483;
	Mon, 03 Feb 2014 05:38:54 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm75270853eeq.15.2014.02.03.05.38.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 05:38:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Feb 2014 14:39:03 +0100
Message-Id: <1391434743-7672-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-systemd][PATCH] busybox: rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2014 13:38:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/busybox/busybox_1.21.1.bbappend
rename to meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
-- 
1.8.5.3


