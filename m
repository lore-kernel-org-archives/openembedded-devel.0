Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDXjS-0003Kg-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 11:07:31 +0100
Received: by mail-ee0-f49.google.com with SMTP id d41so150386eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 01:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=s3L/ovQyv49zvPx8pow8HRMG5pF5134MPxAuBCQQ+zI=;
	b=oQPWnubGdVOj18D8Sq0p518Hd0CVWjHkJiUdO4u32wcMs7lWhLx/+T1AhCBZ3RY9wX
	7uRXlIpHvHv1zfU1xHotFPt/NixL/xz831AR0pho13WCEPbD9Vo9oF+f+Jb5OU4jzvvK
	aPaj6Q63Cmrcc7Pdf995nOfLhzEAiM44EFp0PxzuiVElxLCUck6HFIdei1/6TgGQcXrP
	4hEDzjZYGb0VguYC4y5SY7itYtVZWvO0c5P0d16H7k0Erbrtt223W8RqcvVpGCY0sjAs
	O8jtLBgjlQE72tGtz8BBRAFWIwO30ybXYkT0gJCSu5bxceq1r/gg45h7jMx9uCF+b58z
	MDTQ==
X-Received: by 10.14.204.195 with SMTP id h43mr82644994eeo.14.1362649854624;
	Thu, 07 Mar 2013 01:50:54 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 46sm1327877eea.3.2013.03.07.01.50.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 01:50:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 10:50:39 +0100
Message-Id: <1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmFQnQKnF5UFrBmLcOhfiBEafZQQT8hmvjjaNrDPzz/839SySwmsXxpxQRM8hzchWPllwvR
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 10:07:38 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 0635e10..cab1e21 100644
--- a/README
+++ b/README
@@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
 Contributors:
 Copyright 2012 - Kai Kang
 Copyright 2013 - Khem Raj
-Copyright 2012 - Koen Kooi
+Copyright 2012, 2013 - Koen Kooi
 Copyright 2012 - Robert Yang
 Copyright 2011, 2012 - Samuel Stirtzel
 
-- 
1.8.1.4



