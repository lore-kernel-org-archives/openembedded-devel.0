Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7DA6AD39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:44 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so3365442eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=M0OfO29drKvIMSsUEAx0JFxay7S6ORRdgaF5NFdhQ08=;
	b=pQr4nYqKzJaO5w5DSKpyCLHlt9F1pW9BSsgMWLbwnasi5B0iySQHprAGEjN280lPZh
	rSJtzHXiSVY6qOEMwQ+09yNFsLu4ta/AHybzSP+T1QU5toDYK25S07UxvohmmESsCjzP
	Tl3O9go7nk+pywQjN4tUT9wvvQK1SirQNwe1NUj0pLS+72Vn6hU2jZypfGg0mPTRgWf8
	q+kCKzEpeXjtjNhX0yoUDVxBTCIiqO5Kl5k3+YxJuOdv0t9K4AVr1wcDYz3nmuq5/j4V
	YFq0yb8gbo2b3py+LECgWVRDJwH2AZ8O4g7/MwGyDe8bz83T4f/xFkyLq5mabbVwzaby
	lAoA==
X-Received: by 10.15.94.11 with SMTP id ba11mr3612718eeb.101.1371662984913;
	Wed, 19 Jun 2013 10:29:44 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:10 +0200
Message-Id: <1371662967-31734-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 03/20] tumbler: update to 0.1.29
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.27.bb => tumbler_0.1.29.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.27.bb => tumbler_0.1.29.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
index 402762c..fd28e84 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl"
 
 inherit xfce
 
-SRC_URI[md5sum] = "3fa90528c3e7e77d8ace4bffcf0a2748"
-SRC_URI[sha256sum] = "4c60b3b92877257fcc54d18acbbe4ad73c84a7ff7608a430ad5a05b452923869"
+SRC_URI[md5sum] = "f844215c5e3918eae58abdd85f146780"
+SRC_URI[sha256sum] = "c3bac4ee609e22be6c7f01a4fdf6086bc6b57940d82f99570a2d9d547a32fc93"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.4.4


