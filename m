Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 75B596D126
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 00:03:28 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3753999ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9aQ+ZmEeXSnfRQ9+amLYKqhWrELgQ+VHoEO9Cxm4Q2I=;
	b=jKpUcWwWSyxFzfWO8WB26QdLv/UR4Wu5nK8lfg5dQvIksaqMEprGIq+JIbrt67mqa3
	Ex8zfw7TpRwF7JnrHovqksPOKw4NlAUU1O2EuKkx0Ya1ecyiGhVMymh2ywux6khJxyy0
	SQdBn9Cro56A9iwmQJacDoXe0nMglJ2Eblca6dHGcxWFgOILGqWetquXWmsHG4L4hOSf
	rn6jJ8LPADnydO6TDCkbI2xf8CkapkDm6YJ6uwY/nLnDdRMhB+D/a7hYp14tsBUu2X75
	eIwV+CZiLzs993aAeOxPAsSL8c1CoNfPdQoeyZQ5+riYdPybKv+gO8euYMUI+ls7TR9n
	WouA==
X-Received: by 10.15.45.8 with SMTP id a8mr60459568eew.1.1381795409982;
	Mon, 14 Oct 2013 17:03:29 -0700 (PDT)
Received: from localhost.localdomain (p5B0A21A3.dip0.t-ipconnect.de.
	[91.10.33.163]) by mx.google.com with ESMTPSA id
	f49sm159345944eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 17:03:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 02:03:14 +0200
Message-Id: <1381795394-21464-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-systemd 2/2] connman: follow oe-core to 1.18
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
X-List-Received-Date: Tue, 15 Oct 2013 00:03:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../connman/{connman_1.17.bbappend => connman_1.18.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.17.bbappend => connman_1.18.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend
-- 
1.8.3.1


