Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q78QK-0001Dj-Fx
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:44:08 +0200
Received: by gxk3 with SMTP id 3so188806gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=b5HibZLlPELvvBRSjwklEVGU1NoNlGPz4RQu9w3zg+g=;
	b=prteBmt7ukR/jnwX6HAPvGVBVs0j4R9BO44oVJyMgmM9HqDfNDaZ6tpLrWCODfNhrN
	XpZ5f1+gN+bG/R9EdInXUQXZjchuUmOkZdV3AaMFLM8rDu9xe1q5gByU4s04oYpDE2Xz
	lighQwjT905fgKR2hYi/SGwSdJdok+k0hDbfQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pBo4Q+mPnaYYdDQNSP98lp5wAuJ6ZNDDfGA3feYuS6XGNTIR9IvkEwiHhPFnXnOrCJ
	wTQDb48UvMBZpJOPYDpzLor/hzskQtVC+KbdI6dbqoIZRy431DvDba81kxWJmK+H8GBe
	rv3XglIEmSthyNmc0bh3PO7Or5m/DD206Mqeg=
Received: by 10.150.149.4 with SMTP id w4mr768881ybd.87.1302018122317;
	Tue, 05 Apr 2011 08:42:02 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm2737519yba.11.2011.04.05.08.42.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:42:01 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 10:41:50 -0500
Message-Id: <1302018111-20799-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/5] alsa-state: Add support for am45x-evm machine type
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
X-List-Received-Date: Tue, 05 Apr 2011 15:44:08 -0000

* Added asound.conf file for am45x-evm machine type based on
  the omap4430-panda asound.conf file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../{omap4430-panda => am45x-evm}/asound.conf      |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 copy recipes/alsa/alsa-state/{omap4430-panda => am45x-evm}/asound.conf (100%)

diff --git a/recipes/alsa/alsa-state/omap4430-panda/asound.conf b/recipes/alsa/alsa-state/am45x-evm/asound.conf
similarity index 100%
copy from recipes/alsa/alsa-state/omap4430-panda/asound.conf
copy to recipes/alsa/alsa-state/am45x-evm/asound.conf
-- 
1.7.0.4



