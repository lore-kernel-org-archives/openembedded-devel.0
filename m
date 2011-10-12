Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDoBP-0001No-23
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 04:04:35 +0200
Received: by qadc1 with SMTP id c1so198962qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lnM8Jaf4YsnRxmZqq0IsaOaRLVlKCFnN+87Cf6uXPlU=;
	b=wCfFUFzxazxt7v2vkBfbO8HrnPH87bqRHC9Vc/EDXtFvuLbnrAmSJNcy1l45HRjfwv
	21ddsDNg9PYzPOh3UqthVL16GGqMOjocaSXRzMmK8nAYbqRhuQ8OpAT0/DNuNxleeAeA
	GNLPQYA8YZJwFkQS2zxdEdhGUgHZhiPZuNI1Y=
Received: by 10.68.16.166 with SMTP id h6mr49651816pbd.103.1318384731957;
	Tue, 11 Oct 2011 18:58:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id v8sm2018944pbf.8.2011.10.11.18.58.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 18:58:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 18:58:42 -0700
Message-Id: <1318384722-17530-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-openmoko][PATCH] mesa-dri: Move mesa-dri_7.11.bbappend -> mesa-dri_7.10.2.bbappend
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
X-List-Received-Date: Wed, 12 Oct 2011 02:04:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-dri_7.11.bbappend => mesa-dri_7.10.2.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-openmoko/recipes-graphics/mesa/{mesa-dri_7.11.bbappend => mesa-dri_7.10.2.bbappend} (100%)

diff --git a/meta-openmoko/recipes-graphics/mesa/mesa-dri_7.11.bbappend b/meta-openmoko/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
similarity index 100%
rename from meta-openmoko/recipes-graphics/mesa/mesa-dri_7.11.bbappend
rename to meta-openmoko/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
-- 
1.7.5.4



