Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrm-0003bb-1t
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:14 +0200
Received: by mail-ea0-f170.google.com with SMTP id q16so80143ead.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=BG8hj8eoQ4PIuDpdRQ0ucCk6H90i2tKXdDF9nFbjtQs=;
	b=XW5lHtHGeadBcZmuHb7jISPXRd5hvIP3cXuGY8TEqYREAfpFAT9KwONc5XN1EEPlLo
	C1cWtb7lLTCHSy3GUNb9qoC5G8rbU8IWWnjzJgX0l4RTEjFzWeqSRKHgUBqcdwWvltWp
	YOqsYKmxzxanP2zkGTc9EtKdyrUO+1SBhdEEbaayKK7Dgy3aVb9bSNuCxmNXaZkkcspq
	YvoGX6ptMVWwGjf8HGr2df69BR+/mLSGgjphyGgXLjmIPM0Cu0+kF4w+nWr7gaWB5m+X
	Qd36jPhHom2XRYjrvIT9973fNMrnjeJ5GGsRr9XvIgGlBAyQD9DYHMuijXtIj5/PLasS
	iKOg==
X-Received: by 10.14.205.194 with SMTP id j42mr10024305eeo.41.1367966532858;
	Tue, 07 May 2013 15:42:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:42 +0200
Message-Id: <1367966513-12566-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 04/15] gnome-terminal: move out of nonworking
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
X-List-Received-Date: Tue, 07 May 2013 23:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |    0
 .../gnome/gnome-terminal_2.26.3.bb                 |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/{nonworking => }/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch (100%)
 rename meta-gnome/recipes-gnome/{nonworking => }/gnome/gnome-terminal_2.26.3.bb (100%)

diff --git a/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch b/meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
rename to meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
diff --git a/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb
rename to meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
-- 
1.7.4.4



