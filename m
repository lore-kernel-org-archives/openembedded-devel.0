Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srutr-0003gZ-O0
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:52:31 +0200
Received: by wgbdr1 with SMTP id dr1so2594594wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xcUdstMQwMRHemGUE2kn7oy8AOApqZ1zOPh6LNV55aM=;
	b=f82fM/Dfti3CfJkX1zhOdJ/8LXsZ90htYGPVU/WYr7eNJnEcXo0c8w3/hIGSpb+6S+
	uS1nGSFTLKBYmlRMK+7R36GMFcY89RtgDGo7fnf+VH5iKlL4NRLBlAftHysLCfXcPuo4
	6VLMTFqq7UWpe0rWKV9Pk0ZuTQqmtcJKdONPATCpQ6mOEa7+AT/UFYiTJNu0XQy8BkoN
	jM8V8gb0hoDNFIgyxho3nb3UB/Z2/5JeFzd/PVe765kQFOduHhvZSc5QL4sYrOWlWUXv
	TGDyjd7gOv9zmLdeBVgPIF+ycpDf1BF4beZoX1llbkwuVSgXIsT+plgHIUjrzMVFvC8j
	x+oA==
Received: by 10.180.92.129 with SMTP id cm1mr18282308wib.10.1342719669826;
	Thu, 19 Jul 2012 10:41:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y5sm39565853wiw.9.2012.07.19.10.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 10:41:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:41:10 +0200
Message-Id: <1342719671-28184-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342719671-28184-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342719671-28184-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] wpa-supplicant: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Thu, 19 Jul 2012 17:52:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ..._0.7.3.bbappend => wpa-supplicant_1.0.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-connectivity/wpa-supplicant/{wpa-supplicant_0.7.3.bbappend => wpa-supplicant_1.0.bbappend} (100%)

diff --git a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
similarity index 100%
rename from meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend
rename to meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
-- 
1.7.8.6



