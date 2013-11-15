Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 15F6E6D768
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:16:53 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so1112946eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KwRhPBdNcMwlXM6n/2BxnkZnr4h9eXe7Pt2JygSDGNw=;
	b=tRRXwL6XOTCqwRpkK2n7rUPSbS4lnMLFu5xwWyR2ziFOpC5Wp237mIffDkVVgxB2EN
	kvjk5VR30HfW4+6BYVMUBT1rcQysxahjcmVKVNTUi8HVBz2EvK6Tkev23Q4z6zjC7w7U
	gmQdyL1WB1JtViBnziFzXuE+hJ7Jpx3YVW3O3b/NTfCPTgh5/NqzIEY0iMyN9UVM6gqv
	rD901RIzX7fcHvP8zbnJwoRol8cg78HMERg3M+I8tmq04ukikS5SKV3ZruLWbDWqQiZB
	O9t4mS3M5x83ntLxuKdtjdmeSW/Fwhk82jvWTuZO9pHnDlWtqRPjINu8QtGkXUogojFU
	7+Hg==
X-Received: by 10.14.223.136 with SMTP id v8mr447136eep.121.1384528615303;
	Fri, 15 Nov 2013 07:16:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm7255978eeg.13.2013.11.15.07.16.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 07:16:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2013 16:17:17 +0100
Message-Id: <1384528638-23840-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-systemd][PATCH 1/2] systemd: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Fri, 15 Nov 2013 15:16:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/{systemd_206.bbappend => systemd_208.bbappend}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/systemd/{systemd_206.bbappend => systemd_208.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/systemd/systemd_206.bbappend b/meta-systemd/oe-core/recipes-core/systemd/systemd_208.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/systemd/systemd_206.bbappend
rename to meta-systemd/oe-core/recipes-core/systemd/systemd_208.bbappend
-- 
1.8.4.3


