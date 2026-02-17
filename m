Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638E6E909BE
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:01:47 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14053.1771340505336356466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Bt9sK2K8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260217150143c0cd7a7662000207cf-yv2_ym@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260217150143c0cd7a7662000207cf
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Feb 2026 16:01:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2vCNxIXUXyM2BAaUywWxsEoQMeOOrjT2ZVW/dUNHiPg=;
 b=Bt9sK2K82RDDbAAMLebsx76fJuuFNmbW6h6gCCEgymz9qgDMK/Tb/+lE0Pcow7porc5Gnz
 6qxo4xDSbdjR/yJKj/259dNgbvbszlDjoUCdxi37vmc02swz0vOl4KQLsWWWOQs+AjJRcwEY
 v2FGs1G5DMA5cKuv6q+qfYdYQRf/c0xgnLhu75Jm0KeKI5601um4y9gjUy3pE2dtFSPIPDuc
 UTGKqY6gjEN3aQdWgJQUEv24KYUcytVkuAwiNeCzZK3RRpwZ45XKZnjRn17Rmqf8XxR0zrbj
 UnsqgXBn9VaiodjV6FvT0ebIk4f4TbAw60knpBrIJvK6M9qbqZ0HVIag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/3] cups-filters: update link to homepage
Date: Tue, 17 Feb 2026 16:01:35 +0100
Message-Id: <20260217150137.30232-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124456

From: Peter Marko <peter.marko@siemens.com>

The old link redirects here now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
index a6eedda5d7..24b916a921 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "CUPS backends, filters, and other software"
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters"
+HOMEPAGE = "https://wiki.linuxfoundation.org/openprinting/cups-filters"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d5b952b53dbe7752199903d082e5f07"
 

