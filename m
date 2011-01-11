Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgat-0000ZU-N9
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:11 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so19263450fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=5UQ2fnqrjnTyeBi7yxuvSJD76tf5RNgCtbzTS1K01ds=;
	b=tvZeAVFcOaweWtqXrIyNTJ8KTbALhFqjpYsSKou2WpbDjsDulp8mjwPlcsyRIUUD++
	ihwqIi/3nJFUBnbtacK2dOzG0tvW4KkDG++eHggOBIcHRcfWiqzD6Uh2uxsyETJJe+yY
	Lrj4ldjGGiSpVjfhaXAwfeiNSI7dJui2p6b4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bn9y+PUPG75z8yEMd783HdpqDj2yMruwR1CDMMlmWh4kxtjdFFI/RFccX7+EpCMCEc
	pjUGNW3LqiDD6useYyEFVm8tv5qPLpMQ5y3jqUUy9h4GOA9X1HONKXOe92TYfJaSkRgI
	xf+oItu/XINvFGDIHKSBniaJ3yhoBri+tPh4Y=
Received: by 10.223.81.76 with SMTP id w12mr5161219fak.26.1294761403119;
	Tue, 11 Jan 2011 07:56:43 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm7447034fak.10.2011.01.11.07.56.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:27 +0100
Message-Id: <1294761389-13634-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 10/12] removal: announce old xorg recipes removal
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 removal.txt |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/removal.txt b/removal.txt
index c526b45..8db663c 100644
--- a/removal.txt
+++ b/removal.txt
@@ -34,3 +34,10 @@ Proposed by:    Martin 'JaMa' Jansa
 Note:		Openmoko distribution removed 2010-08-10
 Note:		Moved to obsolete on 2010-10-19
 Note:           Removed 2010-12-22
+
+Package Name:   obsolete/xorg-*
+Removal Date:   2011-02-01
+Maintainer:     Martin 'JaMa' Jansa
+Reason:         Old not pinned versions, we have X11R7.6 now by default
+Proposed by:    Martin 'JaMa' Jansa
+Note:		Moved to obsolete on 2010-01-11
-- 
1.7.4.rc1



