Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 13A33615AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:18:08 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so2926129eaj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lEZGFRugNBbnFTbOC5TMDrSlx20h2hmoGqazecChkqQ=;
	b=xRyOKxWBchM83tAlouBJndANzoSSqdNlcJl0hGQeKxYrP0LMZWmeR4VmOcO/VR/bpN
	Z7vIuDX3E9qfBaE3LyjGgmsP1E4wxkNycK/JsaDf5886d1NQDc2SmqHyJW+nM7vwzMMb
	xKt9GTQEk+G3E4nFZrpbstRHmLk2WEF/RRD8QqU7eGQ5JbgXBFR1vn7pmU9Ir3C/FbIm
	Q5SXUiIOdeOzy1RcK/D7DXwCkkECCVLxP7mhFi0flgfNTQetZXEZcdH71ob0iwj4ffa1
	Ix6qtxt/7WDGzfOzRsvJGEQ2GpcfTfKWaqC2ljqDidUF6JHcvtusfCi/J2Sg3iHnYDUX
	zSdA==
X-Received: by 10.14.7.71 with SMTP id 47mr1443199eeo.122.1383049090124;
	Tue, 29 Oct 2013 05:18:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d7sm69671281eem.8.2013.10.29.05.18.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 05:18:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 12:18:19 +0100
Message-Id: <1383045499-3774-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-systemd][PATCH] openssh: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Tue, 29 Oct 2013 12:18:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssh/{openssh_6.2p2.bbappend => openssh_6.3p1.bbappend}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/openssh/{openssh_6.2p2.bbappend => openssh_6.3p1.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.3p1.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.3p1.bbappend
-- 
1.8.4.2


