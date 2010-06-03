Received: from mail-yw0-f180.google.com ([209.85.211.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKDF5-0005IK-IG
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:26:05 +0200
Received: by ywh10 with SMTP id 10so260859ywh.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=C53hRwz8QhBoj0KA2RNpcXhnv9ClkJTYNwrtYCC1gFk=;
	b=vTNNj7ZiZMfhODkEeRi5ujQFVBH8rlJdT6n+uj/iTVvzO4ax8oWr8I7QwTNiXQM2Cj
	ktJt0x+BSmlnU1r/sX7H4peK2ZcB3kF3zAjeM/vFoiAWDzfbYMM6wkb17+I/HJrLNYxk
	Xb8Y/uvmiwProsobXcai+vssmNCx6K37+rz5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Oj0z0bMM8xZZh+W5jUgZrTobP31qLINAAfAOlQbUA+Lm14tcNlrJlaArEe0YxG0OFR
	5kYAaueWb/iw+Uzg2IAg9+IA89DRJ0IWbnKhu7WmCx60y6YBxto1N3RtMrTRELXsJIiW
	0Odoac+rh5SMkE79ZaJOAWjLb2pMGmmb/fwts=
Received: by 10.101.133.7 with SMTP id k7mr11281949ann.24.1275582105941;
	Thu, 03 Jun 2010 09:21:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id m39sm896610ann.11.2010.06.03.09.21.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 09:21:45 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 11:15:47 -0500
Message-Id: <1275581747-22223-5-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1275581747-22223-4-git-send-email-chase.maupin@ti.com>
References: <1275581747-22223-1-git-send-email-chase.maupin@ti.com>
	<1275581747-22223-2-git-send-email-chase.maupin@ti.com>
	<1275581747-22223-3-git-send-email-chase.maupin@ti.com>
	<1275581747-22223-4-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.211.180
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 5/5] alsa-state: bump alsa-state PR
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
X-List-Received-Date: Thu, 03 Jun 2010 16:26:06 -0000

* Bump the PR number of the alsa-state to pickup
  new asound.state files added for TI platforms.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/alsa/alsa-state.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
index 6c8192e..d507cd5 100644
--- a/recipes/alsa/alsa-state.bb
+++ b/recipes/alsa/alsa-state.bb
@@ -7,7 +7,7 @@
 DESCRIPTION = "Alsa Scenario Files"
 LICENSE = "MIT"
 PV = "0.2.0"
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "\
   file://asound.conf \
-- 
1.6.0.4



