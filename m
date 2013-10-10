Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id D02C06CEDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 22:06:16 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so1468969eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VH18gj/t90ePEFp/i0Xx+yK1BuZUSuzHfHxA664mqlQ=;
	b=FNmI/q3hCSpL69MDhcRn4OWGi/hDkgoqBivP9x7eaf4tRFqMI+csQXcIJV74ercvxL
	t8cOEneV8l88AEOMCdoUcsakbBvjlL165qd8sLxPwbsqzwsOCWPQuYCSgyA6nbiQTj2f
	qAvipvLZPt7SpxbeIe+GxSIthnHrKtviPlmXDPCWw1TRu0FEDUOsIuiJrVBGK3HF/Rj4
	XaZh2u8d48XWaYlsHH22pMfvgXJ1iUwigu2b6vgiVZ/aOttXtmMIKIqLtmwXEGGYKQfh
	hQESziPw8zeKBPpGSjCeCNc/1JPSFsz7QWy3FsmLWsWu0icIEjpO4tomF4Kvb1aEfj80
	apIw==
X-Received: by 10.14.184.132 with SMTP id s4mr24068395eem.13.1381442778294;
	Thu, 10 Oct 2013 15:06:18 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id
	bn13sm106497938eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 15:06:17 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 00:06:10 +0200
Message-Id: <1381442770-26925-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] kexecboot: update the .bbappend following meta-initramfs
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
X-List-Received-Date: Thu, 10 Oct 2013 22:06:17 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/{kexecboot_git.bbappend => kexecboot_0.6.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/kexecboot/{kexecboot_git.bbappend => kexecboot_0.6.bbappend} (100%)

diff --git a/recipes-bsp/kexecboot/kexecboot_git.bbappend b/recipes-bsp/kexecboot/kexecboot_0.6.bbappend
similarity index 100%
rename from recipes-bsp/kexecboot/kexecboot_git.bbappend
rename to recipes-bsp/kexecboot/kexecboot_0.6.bbappend
-- 
1.8.1.5


