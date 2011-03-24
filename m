Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hY2-0002Ql-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:13:46 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7237376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=G4jrJi3wKqH5PlCl3em7Yc2hPIVDntEMFzDazYQwgr0=;
	b=KnOQV+Z4tDrjOMlup5z+JLWRXC3FKfc+OjPZwUy6WsJxACCv/WIlWQkfCWTHWmpA0r
	iChv7fQ+miBI6sZ6WTBE5YRfLMxTC/mr0iBG50tBDiBBn/x/UjwtGTFKfJ2rFMNWz9vW
	t5u/5ZYzQfLw092rX65/Q9ynuHQuMWhUNWBmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=faNZGG1aGMWyfzznaMF091/G4ybcvnRB6RNoAR/oJqjrtDHylQJdg3VQdjEyA6nGSQ
	BdSwZ5YAu7rHBbpGQdgtzB0/U/5N5zP4bbBNMex5h9alKxm0a+YPwgPGyu5BqVKNETGt
	kXp8+Ko5ceNToDw57fTzmSP7uEfNjmU1Sos0k=
Received: by 10.204.80.29 with SMTP id r29mr7181497bkk.195.1300961514323;
	Thu, 24 Mar 2011 03:11:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm6585125bkt.5.2011.03.24.03.11.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:11:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:11:46 +0100
Message-Id: <69203f0bd1154b83fb79ed416d5959a0d737b680.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] lua5.1: add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 10:13:46 -0000

---
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
index 06c8004..5591c4c 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=90c3badc6055c699194c4a7cea583296"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS += "readline"
-- 
1.7.4.1



