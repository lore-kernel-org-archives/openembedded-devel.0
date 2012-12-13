Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjF9w-0003gB-9E
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 21:13:32 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1240130bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 11:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=tnXaKwzNAtoLrQ/jXrYKMFcMp1RM4E/ElIr/TVwMSZs=;
	b=NaJDvDznIOMx62VQL1R6OZJ6wQ8wXwMcGlKPfxE6yr2eJ7m7A5lLiYUQEp5NFcMtNf
	yqJhts4Xyli/bi4clWTeKnHuPtipDhzk6Yfvt5yBPApQfhv2worKKY7L061qNkLDVsUA
	gKNmex5sm9ZRc8FYXfCX/G96sdQeqr2zJhkWm5fuey3P9AMdJYJNatYcZqiMCHp6tC0z
	GYliC8DbRvyUYh0FhJnW2FBrFeFO0f3/nb696qPA/9NWHa86tSFDwMaGAq3rCLwLURRs
	9TRRPr32OsDLW+KFdReRtV/RmKzgv9z9t8dmC5v4rg4CafI8v4UEVFVBdJCK/9jHMO2R
	EdQA==
Received: by 10.204.147.78 with SMTP id k14mr1599282bkv.7.1355428737135;
	Thu, 13 Dec 2012 11:58:57 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id q22sm2525291bkv.16.2012.12.13.11.58.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 11:58:55 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TjEvl-0004oz-PM
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 21:58:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 21:58:49 +0200
Message-Id: <1355428730-18495-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome] add libxi dependency to gtk3
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
X-List-Received-Date: Thu, 13 Dec 2012 20:13:32 -0000


Resending with tags in subject line.


 - ML


