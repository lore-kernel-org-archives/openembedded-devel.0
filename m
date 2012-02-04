Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtWEj-0002NR-VX
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 04:24:26 +0100
Received: by daln34 with SMTP id n34so676058dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 19:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0XVJAI2cP0sbPv74v549+gJquja+K+ACA9ye1RlgWIw=;
	b=VI2k45V5bIze/v/hRK2/PQgXKR6DTtZO9V69Qed3dVTGlHqiB40RVsB6jBuyGTle9k
	OzQx/+f4XYCyIe0y5b1xX9WuC0JD2rbA0nAkb5w2soPVlG0PQ/iI92gv1OOWezPE+Uxw
	ICvkPqUlEduUPkuQWBzSIm0mWVgSZGk046x/U=
Received: by 10.68.199.38 with SMTP id jh6mr22976408pbc.77.1328325387184;
	Fri, 03 Feb 2012 19:16:27 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id j4sm17635678pbg.12.2012.02.03.19.16.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 19:16:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2012 19:16:16 -0800
Message-Id: <1328325376-7898-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [meta-smartphone][PATCH] drm: Rename bbappend to match oe-core updates
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
X-List-Received-Date: Sat, 04 Feb 2012 03:24:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bdrm_2.4.29.bbappend => libdrm_2.4.30.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-openmoko/recipes-graphics/drm/{libdrm_2.4.29.bbappend => libdrm_2.4.30.bbappend} (100%)

diff --git a/meta-openmoko/recipes-graphics/drm/libdrm_2.4.29.bbappend b/meta-openmoko/recipes-graphics/drm/libdrm_2.4.30.bbappend
similarity index 100%
rename from meta-openmoko/recipes-graphics/drm/libdrm_2.4.29.bbappend
rename to meta-openmoko/recipes-graphics/drm/libdrm_2.4.30.bbappend
-- 
1.7.8.3



