Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBD36AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 14:24:30 +0000 (UTC)
Received: by wgic8 with SMTP id c8so18759618wgi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=hxELwBwAr/skBt292H8Ih95OALUHMw3R2ZoVnF/g7g4=;
	b=TDzxqQDov+Z1qKoOkcAAW0AzKHBSNE/tyUEnPs60XiBKzQUy0D4hNVKR7RqldVUMAq
	dXXdFUFqPhqkv7bclLn3Rb9ocsa3h/B+YuvVaRdTjCjIsDdHY1em87BoktslU4Zo43hy
	3+7jQA8QeKge37sxCC0Ye0JxVaQUlZalpIGvQ8mIxjpxRe0v5+dCsPmd6UwgdTl4P1NG
	o4bTEYB7vMl0Brh3/4/OAyZfKjjPX4gokxJk1vjIR8i1LzqmHNteSTInODba4UseUPw1
	CrlxBp3riY7YXT3hoNcekZeiokifBjzjdk5VkWbKQ6UpG7Muf4K5Y+ifg3CmO58DkFut
	vjfQ==
X-Received: by 10.180.12.228 with SMTP id b4mr5474235wic.92.1431008671813;
	Thu, 07 May 2015 07:24:31 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id hu1sm4259609wib.6.2015.05.07.07.24.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 07:24:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2015 16:24:02 +0200
Message-Id: <1431008643-20963-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] udisks2 follow-up
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
X-List-Received-Date: Thu, 07 May 2015 14:24:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

follow up for series sent yesterday

it is pushed ontop git@github.com:schnitzeltony/meta-openembedded.git patches

Andreas Müller (1):
  udisks2: disable manpage creation

 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.3


