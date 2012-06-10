Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3L-0001fg-Lc
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:07 +0200
Received: by werg55 with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ckDe1LTLZ+S3N/Dr1EVftdjCio9Tu3bqGqoZNzxhmQo=;
	b=EeEMyGja8nswXT01+/sYQup5ZyaCiQupfpiB47tmDsZDgEQc4aGYvYq3DBIA8VD9u+
	e5xgpT4SkYOpVxK/HgZEk/GogabAYRzQEDVg9nSb3uxqq+AExmVYzPqX/PwPrFacA2WY
	uycR4CagA4uSOVwBOPLzi/VbpgjDZKoKVbUReDJm738MtvOoGuIRXS8gavfJKzVV6+xv
	1maaj2JgvF3G3zxdYs7Lj4OGMuUVycCLVLwcPttuRsguAQEGZ3k4QxvZCEBp/g0BJGWc
	FQtlG98E42qdxpi8aympg9FrbFBCJz/tObqz84Q78ChLJavci0NWj/vQVCNymMOGFilm
	f8dw==
Received: by 10.180.88.194 with SMTP id bi2mr15686160wib.20.1339364495181;
	Sun, 10 Jun 2012 14:41:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:34 +0200
Message-Id: <1339364820-2880-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 01/27] systemd.bbclass: move to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 {meta-oe => meta-systemd}/classes/systemd.bbclass |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-systemd}/classes/systemd.bbclass (100%)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
similarity index 100%
rename from meta-oe/classes/systemd.bbclass
rename to meta-systemd/classes/systemd.bbclass
-- 
1.7.4.4



