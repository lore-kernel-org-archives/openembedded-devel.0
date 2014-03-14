Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id A3CE16F863
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:07:54 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so1096345eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LAXwSpsnUIIhGz1ZPIpZHIuMkkKIWLa97UufozI2Ayw=;
	b=YFamBwjru/OfNu0FoVbnKx30GAqEwsMCqJWino3d3GZVctYeoj7aHrdJU0jf5w01HX
	M+3+FM7V3Hpa5ciRZABwsADhzPXntERH5iuCxw3MpbXvfDyio3kjEGyy1Xb7tBmJxt7R
	qFpIj0fA37YynUyybjpfgDfI1RK3em2M6IDIJf1O1dAKORHXLqIxjCho4dF9vnWOU9bb
	0XOM1lRzp3nx9ITw6H0ehFgyQpL+wE2Yn8uWUWJjDvWAmdqxu/TTD67CfQf8ATMnPM9B
	1f5Jachh6ODaRDkTQqmE2DtLaB63hUyiYyyw/3UJ4wm6Q9eirCAFficvBRCl+C3cl1IZ
	Jx1Q==
X-Received: by 10.15.43.132 with SMTP id x4mr9749360eev.59.1394824074735;
	Fri, 14 Mar 2014 12:07:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm19061451eeh.13.2014.03.14.12.07.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 12:07:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Mar 2014 20:08:07 +0100
Message-Id: <1394824088-20009-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-systemd][PATCH 1/2] dhcp: Rename .bbappend to match any version from oe-core
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
X-List-Received-Date: Fri, 14 Mar 2014 19:07:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend => dhcp_%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend => dhcp_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
-- 
1.9.0


