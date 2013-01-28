Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzpNU-0008Q6-AS
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 15:08:04 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so1690721wgb.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=7J8D9PtAD9utidSEgHmZ7iXQQri6/EA8zmmaTB83nFc=;
	b=AKRZjP+HcLzckYNtSbW13SVIzbtQvvpxBD7UQE5ViEcTUOfDN1o6B6VFseercrCgN6
	ALfFlhR24QJk4VvLmtmfNPnB8THYu014nO97k/xv5Fc944dL14klhJ203h2Y/1ZmBP4K
	x3N03Z2+GCJf/6bnE30vANnczvdIeo86YvevcpyV4ljNllOtTEHzYxfiNYa9pmkIiU85
	l5KxqG0SRPWhITUr2pnoIZrhPOj2Oo6+23JClpLYTQ1es2LO5cgwxmoDVq59I/4EPlP8
	im3xJvWR7nQx+VhcETUrzut9ern2+/B7t9UsPaFQU7DlXzTOdrd+KHknLfh46Cs7x7aq
	+Wlw==
X-Received: by 10.180.77.35 with SMTP id p3mr9917066wiw.18.1359381146144;
	Mon, 28 Jan 2013 05:52:26 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bz12sm13535324wib.5.2013.01.28.05.52.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:52:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:31 +0100
Message-Id: <1359381032-24881-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd/V2 3/4] dhcp: follow oe-core to 4.2.5
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
X-List-Received-Date: Mon, 28 Jan 2013 14:08:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{dhcp_4.2.4-P2.bbappend => dhcp_4.2.5.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bbappend => dhcp_4.2.5.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
-- 
1.7.6.5



