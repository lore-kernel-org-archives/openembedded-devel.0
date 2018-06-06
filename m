Return-Path: <mario@parenteses.org>
X-Greylist: delayed 438 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 07:45:46 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB2F75573
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:45:46 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id EB90A41134;
	Wed,  6 Jun 2018 09:38:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id xXBtD-Qlkr1X; Wed,  6 Jun 2018 09:38:26 +0200 (CEST)
From: Mario Domenech Goulart <mario@parenteses.org>
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
Date: Wed, 06 Jun 2018 09:38:25 +0200
In-Reply-To: <10630413.xVAl2E7OaH@yow-masselst-lx1> (Mark Asselstine's message
	of "Tue, 5 Jun 2018 11:11:26 -0400")
Message-ID: <87d0x4nz4e.fsf@parenteses.org>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] maintainer status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2018 07:45:46 -0000
X-Groupsio-MsgNum: 72638
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Hi Mark and all,

On Tue, 5 Jun 2018 11:11:26 -0400 Mark Asselstine <mark.asselstine@windriver.com> wrote:

> Several of us have noticed that nothing has been merged to meta-java since 
> mid-April (roughly 8 weeks ago). With about a dozen commits sent to the list 
> and pending merges I thought I might email you, the maintainers, directly to 
> determine if this is expected to continue. Should we be looking to update the 
> maintainers list and/or recruiting new people to restore the vitality of this 
> repo? Have your roles or positions changed making it no longer viable for you 
> to contribute to this repo?
>
> Thanks in advance for your responses.

I haven't been actively maintaining meta-java.  Unfortunately I don't
have time to work on it anymore.  Sorry about that.

Attached is a patch to remove myself from the list of maintainers.

All the best.
Mario
-- 
http://parenteses.org/mario

--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment;
 filename=0001-README-Remove-Mario-Goulart-from-the-list-of-maintai.patch

From 00386a17fe0014bacec2bb98e534b7a81e698bd7 Mon Sep 17 00:00:00 2001
From: Mario Domenech Goulart <mario@parenteses.org>
Date: Wed, 6 Jun 2018 09:25:55 +0200
Subject: [meta-java][PATCH] README: Remove Mario Goulart from the list of
 maintainers

Signed-off-by: Mario Domenech Goulart <mario@parenteses.org>
---
 README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README b/README
index 33511ff..1dfea95 100644
--- a/README
+++ b/README
@@ -45,7 +45,6 @@ When sending patches, please use something like:
 Main layer maintainers:
 
   Henning Heinold <henning@itconsulting-heinold.de>
-  Mario Domenech Goulart <mario@ossystems.com.br>
   Maxin John <maxin.john@intel.com>
   Otavio Salvador <otavio@ossystems.com.br>
 
-- 
2.11.0


--=-=-=--
