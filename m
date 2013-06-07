Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6F16A88B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2013 16:11:40 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so3789514eaj.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2013 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=v5wN9SRgHbbVERxLzOS4Cd6hDMRqD4QYuHH5EoE8rgc=;
	b=wLlMqX68vGXio2L3yA89CsOTXcuJo3JNvGMTB72ik6M5vd/p7FUwbZiwWJGLaOqTA+
	Vq8tQJRz7STBhiI8kResnrDVsQqO6vRcRqi+avXV/xr48ugMe8oyzvPn/XR2x+eRy0Vs
	GDXa+167xHcPABsI1YcPc6ZgtiIU61JSACBIfNjxByDA2cNpJPyaES/TbcFq3S9BA6R+
	vT2qGGIu2SARhcPFj8NxYZN+79vN/z3bUNhjOBxjQyKfc1Z66WyvdhpHzZKI7ftr5mcU
	48JzJwGOiI1Jh5xvY0Ie2j7ptRi7mbrmvxPh5CAxq0JhITyqs69jjs1QDXpnAjkPqalR
	0XSA==
X-Received: by 10.14.53.77 with SMTP id f53mr39556039eec.106.1370621500485;
	Fri, 07 Jun 2013 09:11:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a5sm112823935ees.6.2013.06.07.09.11.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 09:11:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jun 2013 18:11:56 +0200
Message-Id: <1370621516-29047-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] connman: Rename .bbappend to match new oe-core version
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
X-List-Received-Date: Fri, 07 Jun 2013 16:11:40 -0000

---
 .../connman/{connman_1.14.bbappend => connman_1.15.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.14.bbappend => connman_1.15.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.14.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.15.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.14.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.15.bbappend
-- 
1.8.2.1


