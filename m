Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id F14126AC56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 11:18:39 +0000 (UTC)
Received: by widdi4 with SMTP id di4so156045398wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=NRhALUqBH/sWotWFKppX6+j13adbqcsfWw0ensseFM0=;
	b=gk5Ju5OyQUN+/+izAJ3CKw3z56suCyVm/9th+Lh4PmJM4SiJpsdbZllnHhP76XWGjg
	TVLZ6KmZM0t9gyHgYTc2YJvzwhLCYdX5jnr/MMh6gCGkgQSzd0KWlrly/uObVgBFuzV6
	KFSP4r3Fnw2rD+2mk0mwPKnmFPHRQ+lPOYNnjcSXtmZhCbArYXxzMrwwkFvgwWhhYcji
	lSOIXTfGlTIjAGYuA1uYS8B/4tiL92Aw6AFt9YePKeAOkTsyqVPlKWLriXlqTd/tb8lA
	9OZDzi1aDmjXxA918tpkb/xJRykWDyzu1ZudfRAuksTKhwrneW7BN6MWEjBHnr61Qjt1
	7I8A==
X-Received: by 10.194.89.70 with SMTP id bm6mr48062447wjb.146.1430824719600;
	Tue, 05 May 2015 04:18:39 -0700 (PDT)
Received: from X220.tupi.fr ([37.160.142.199]) by mx.google.com with ESMTPSA id
	fs9sm25064683wjc.34.2015.05.05.04.18.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 04:18:38 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 13:18:29 +0200
Message-Id: <1430824709-22286-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Cc: tprrt <tprrt@tupi.fr>
Subject: [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to bluez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available for: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
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
X-List-Received-Date: Tue, 05 May 2015 11:18:42 -0000

From: tprrt <tprrt@tupi.fr>

Signed-off-by: tprrt <tprrt@tupi.fr>
---
 .../bluez/{bluez4_4.101.bbappend => bluez5_5.29.bbappend}              |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/bluez/{bluez4_4.101.bbappend => bluez5_5.29.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
-- 
1.7.10.4


