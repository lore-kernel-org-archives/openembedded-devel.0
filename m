Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C701F616E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2013 19:18:34 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1663341eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2013 11:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lYH1fJzP4vvJJkGqL6dBWWRqvqXSZB/k3p/DqZYLKyo=;
	b=iZkoXV7p39A3nntNQi7xnBRwCM4t/k9nqI6X1R+lBn1cwjkP/blKzbCxqZ4OcfQwN5
	pUUpY/aqyUeZHX7mFkaPkSdlWyTPPJez8ztcZcp00Yc9YtzXi/EtMcsqSuHM7+4+aadN
	+eAdxUVDYRIdNQW/AKNzGVggurrJQsLFlFgic3KpaDCqRgUHkKMwq4x36mlhSQRl1si2
	zPeVJgo97mRLJcNPkNwkvrS/OT58GJxoGQWRxy3x/gBM425lZg6QqSPgFQuKsrPzdm7g
	WBqwrtxAbXSLgOj3yY6fju3HfXl3CQUZ5tP2ylyQntaLbpefteAbJaMCAmSvJ3PtnpeH
	zFJQ==
X-Received: by 10.15.86.75 with SMTP id h51mr11689127eez.44.1387653515392;
	Sat, 21 Dec 2013 11:18:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm30044726eea.10.2013.12.21.11.18.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Dec 2013 11:18:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Dec 2013 20:19:08 +0100
Message-Id: <1387653548-11829-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-systemd][PATCH] dbus: Rename .bbappend to match new oe-core version
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
X-List-Received-Date: Sat, 21 Dec 2013 19:18:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../oe-core/recipes-core/dbus/{dbus_1.6.10.bbappend => dbus_%.bbappend}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/dbus/{dbus_1.6.10.bbappend => dbus_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.10.bbappend b/meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.10.bbappend
rename to meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
-- 
1.8.4.3


