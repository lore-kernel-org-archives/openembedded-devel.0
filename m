Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0jRN-0000Tg-F1
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 01:55:17 +0100
Received: by eaal10 with SMTP id l10so884499eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 16:46:55 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.204.73 as permitted sender)
	client-ip=10.14.204.73; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.204.73 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.204.73])
	by 10.14.204.73 with SMTP id g49mr33607eeo.57.1330044415804 (num_hops =
	1); Thu, 23 Feb 2012 16:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=e7DWk+6DD32xPVpacQ+26IUfcbBDRTFzxp7b+63mZyg=;
	b=ehC+ZxMSXIBjew54Yl4jpC6UoGEu7vspqNmUYQM9m4jChajl62oMCdTg4itmzrqn0S
	NjuqAajZK4SOY5ybgdLVUedG+5tl4GC8LmOsw07O5BUfrwsQ02XgaDDpznQtUcIiada1
	AsCMx+Cw6hMN3dKYEYmNwcZ1tXldQtYpiTgQM=
Received: by 10.14.204.73 with SMTP id g49mr21192eeo.57.1330044415684;
	Thu, 23 Feb 2012 16:46:55 -0800 (PST)
Received: from localhost.localdomain (p5B0A23FB.dip.t-dialin.net.
	[91.10.35.251])
	by mx.google.com with ESMTPS id z47sm11578274eeh.9.2012.02.23.16.46.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 16:46:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 01:49:54 +0100
Message-Id: <1330044594-17032-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] dhcp: follow oe-core's update to 4.2.3-P2
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
X-List-Received-Date: Fri, 24 Feb 2012 00:55:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{dhcp_4.2.0.bbappend => dhcp_4.2.3-P2.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-connectivity/dhcp/{dhcp_4.2.0.bbappend => dhcp_4.2.3-P2.bbappend} (100%)

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
similarity index 100%
rename from meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
rename to meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
-- 
1.7.4.4



