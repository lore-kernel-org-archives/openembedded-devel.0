Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKChn-0002Kv-Bg
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:51:41 +0200
Received: by yxe42 with SMTP id 42so112293yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Yxclc4vkpI9UurMuaY1bDTKdw6oV/FoBRXLAczHeB5c=;
	b=w3G4dorAtk9NUNq8rr7aU2NgsjkJb298fBIqmaXYyKT1NjfluOMbCU1aD3+5A8mz2f
	X78kSukwKXhVcJohNripRp5oNkQUAsxlEujDyj3K+TU/ZaqKipNBEdzIUXt/yaQFlpGV
	ytlP8zb0R5Pt/9M97UVO+6cP7WK1NZmJow7Ww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DPU+FWQdw+S39GHAGT/bQYJWBeK83R0dXTC5G8FZj40IJbMYsbCiOdaPd8H0JbHymu
	kF/BAnmwCduvhUcN+RvEcNRS00mXBBnVc3bjhTZy+IvjqflK0pUFZGCdfOv7em5CZJM/
	aHnOY6FG5+CFGisLfcsJL1A+CWYSer9FvmgVM=
Received: by 10.150.131.9 with SMTP id e9mr9069365ybd.15.1275580042162;
	Thu, 03 Jun 2010 08:47:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w3sm8802100ybi.21.2010.06.03.08.47.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 08:47:21 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 10:41:28 -0500
Message-Id: <1275579688-19909-4-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1275579688-19909-3-git-send-email-chase.maupin@ti.com>
References: <1275579688-19909-1-git-send-email-chase.maupin@ti.com>
	<1275579688-19909-2-git-send-email-chase.maupin@ti.com>
	<1275579688-19909-3-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 4/4] alsa-state/dm6467t-evm: add asound file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:51:42 -0000

* Add the asound.state file for the Texas Instruments
  dm6467t-evm platform.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../{dm6467-evm => dm6467t-evm}/asound.state       |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 copy recipes/alsa/alsa-state/{dm6467-evm => dm6467t-evm}/asound.state (100%)

diff --git a/recipes/alsa/alsa-state/dm6467-evm/asound.state b/recipes/alsa/alsa-state/dm6467t-evm/asound.state
similarity index 100%
copy from recipes/alsa/alsa-state/dm6467-evm/asound.state
copy to recipes/alsa/alsa-state/dm6467t-evm/asound.state
-- 
1.6.0.4



