Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T33C1-0001F4-V1
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Aug 2012 12:57:17 +0200
Received: by wibhq4 with SMTP id hq4so2610145wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2012 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=qi8Ft8bPVjISbiHgZ7aYtw4vqQQp/rQBOg1mXGTftBQ=;
	b=KBeeQ42fLaSFA/LohT3pLpeyLCNSi0jOV8lYRRkzpbHFbz7SBxCYtyJiStAT8zEhxB
	QuMdoJqnKUt33P4bKkZ+bdRF+BSFIGaNFnKX7spOhmqzzLvtC0d++PCKLhhIoDXO2pi4
	FXUu/6VGKbiMeX08hBlQb4Fazs2WAOEIuA8I34muJ3uMVrZT0/daVOVj6rgj9mFCn5ke
	e7GSbsk7Dhh4rthj/g7ttH8hUBzmvyhYCAqHrtKUG/a9RXWkQigA89Cji/E6FUnYl89+
	+XCMW9y29SO1F6lG6GbhdJsHa6DM1N33VNVn9jlyuPMUBsDQDexBOylTkUitYPGWTFIb
	nVHg==
Received: by 10.180.91.1 with SMTP id ca1mr19114600wib.8.1345373116773;
	Sun, 19 Aug 2012 03:45:16 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2BC0.dip.t-dialin.net.
	[91.10.43.192])
	by mx.google.com with ESMTPS id fb20sm31770475wid.1.2012.08.19.03.45.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 03:45:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2012 12:52:12 +0200
Message-Id: <1345373533-14583-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-systemd 1/2] connman: follow oe-core to 1.4 and move to oe-core subfolder
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
X-List-Received-Date: Sun, 19 Aug 2012 10:57:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../connman/connman_1.4.bbappend}                  |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe/recipes-connectivity/connman/connman_1.3.bbappend => oe-core/recipes-connectivity/connman/connman_1.4.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.4.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.4.bbappend
-- 
1.7.4.4



