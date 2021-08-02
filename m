Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web11.22344.1627921472518221766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 09:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: ben.brown@codethink.co.uk)
Received: from ward-15-b2-v4wan-162938-cust156.vm18.cable.virginm.net ([80.2.64.157] helo=deprave.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mAajv-0004S0-4r
	for <openembedded-devel@lists.openembedded.org> ; Mon, 02 Aug 2021 17:24:31 +0100
From: "Ben Brown" <ben.brown@codethink.co.uk>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/1] Fix install of adb client when TOOLS is overridden
Date: Mon,  2 Aug 2021 17:23:26 +0100
Message-Id: <20210802162327.21453-1-ben.brown@codethink.co.uk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5a9eef2f531cfb051661c53de34e4c6ba6915138:

  nginx: upgrade 1.19.6 -> 1.21.1 (2021-07-30 10:42:35 -0700)

are available in the Git repository at:

  https://github.com/benjamb/meta-openembedded.git 92c94b1b5688cc4ac686d3801c7a2efc29b6eb38

for you to fetch changes up to 92c94b1b5688cc4ac686d3801c7a2efc29b6eb38:

  android-tools: fix install of adb client when TOOLS is overridden (2021-08-02 17:02:18 +0100)

----------------------------------------------------------------

Ben Brown (1):
  android-tools: fix install of adb client when TOOLS is overridden

 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.32.0

