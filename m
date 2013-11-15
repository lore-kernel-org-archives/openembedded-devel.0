Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF81D6D77B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:16:54 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so840813eaj.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/8AjnOVIdyAJZAfqoP/8479Tc0lPw3M5aYYN5AB1YPc=;
	b=VWLdY5rL5LRf1qIQLlyNCZ6ZJCX4FgDIDw8O1Rmw+800o+rr8X41aZm78fn+jEtl9J
	GKeLpHzIBa8YFjwn5E7DxGMzOtCwtyNwS5fZTAzCu492v1nFTjOuqaXt3ZLApILhH5zG
	3AMlzOuaXISppv5PtPWJN1xqUA5nJHn3KlPuVeVQJ7tIwi1BBO+lDY6Cfwz39UZJ7EJ7
	VWydmLVZt9FtW3PXySYp4mlScrxUx3qLW1zTnpyX8E9sMUEGpIfG7FxBcQYgBjwcNLNr
	kdtyKMcIRnrulctbmQtM0v/aeQf+rH6IAk9cj+MrPmaruGOJEdl90IpI1SmlT59DpIuU
	Vo6A==
X-Received: by 10.14.100.65 with SMTP id y41mr435391eef.143.1384528616364;
	Fri, 15 Nov 2013 07:16:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z2sm7277186eee.7.2013.11.15.07.16.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 07:16:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2013 16:17:18 +0100
Message-Id: <1384528638-23840-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384528638-23840-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384528638-23840-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] openssh: Rename .bbappend to match new version from oe-core
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
 .../openssh/{openssh_6.3p1.bbappend => openssh_6.4p1.bbappend}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/openssh/{openssh_6.3p1.bbappend => openssh_6.4p1.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.3p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.3p1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend
-- 
1.8.4.3


