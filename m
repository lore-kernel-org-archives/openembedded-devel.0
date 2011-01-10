Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcEUO-0003Ur-CI
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:56:36 +0100
Received: by fxm17 with SMTP id 17so17855677fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 01:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gILC+RdzcHcRJEcsqBwzXjJbK5lhA2kC+p9p1k5aJQs=;
	b=r9qJqLqLw/BVIE3W2nz+TRrD9Y/VS1LBLn8KTmAVEQqzn2Ql7QEq/nsEmG0x1j/tP1
	KG55v+gO7Edg7JGfV/DB4DjX4xh1Ju0UohOqsI5KIuxi9547faB9KO6CooIHu3tuvwG6
	6wcj4y8GSEudnfPGk8Ss0KNr5z2c1KvLK/ARA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FIGJA3WVvy63mN9H10js/cp6aYLvtHOfs/1QguVx+qDNQzGFzB3Hn9bgtniMcWMeOI
	UTprFOew1JTi4E6H72O1FiKyRTlr7wcgZMuiuaIQenqx9yFesMlL2wB0OhXG/NI41PO/
	Mx3+eLbOWtWDDU/YfvUTyFj0DLzLLkS/h50KI=
Received: by 10.223.103.3 with SMTP id i3mr3969593fao.137.1294653367371;
	Mon, 10 Jan 2011 01:56:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm6854436fam.11.2011.01.10.01.56.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 01:56:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 10:55:57 +0100
Message-Id: <1294653360-27612-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] angstrom-2010: prefer newer mesa 7.9.1
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
X-List-Received-Date: Mon, 10 Jan 2011 09:56:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index a36cb21..7fc8df1 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -1,4 +1,4 @@
-ANGSTROM_MESA_VERSION = "7.8.2"
+ANGSTROM_MESA_VERSION = "7.9.1"
 ANGSTROM_QT_VERSION ?= "4.7.1"
 ANGSTROM_LIBTOOL_VERSION = "2.4"
 # Use new sysroot feature
-- 
1.7.4.rc1



