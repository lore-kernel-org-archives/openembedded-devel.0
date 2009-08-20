Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Me7OD-000882-1Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 15:09:13 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 705D116DE84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 14:51:56 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 2F5FC2A419E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 14:51:56 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 20 Aug 2009 14:51:38 +0200
Message-ID: <4A8D46C4.2000600@dresearch.de>
Date: Thu, 20 Aug 2009 14:51:16 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 20 Aug 2009 12:51:38.0468 (UTC)
	FILETIME=[F51D1240:01CA2194]
Subject: initrd example wanted
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
X-List-Received-Date: Thu, 20 Aug 2009 13:09:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I've one kernel and want to use it in two different root fs images.

In one image some modules needed for SATA HD access need to be loaded in the other they must not. So i think the best solutions is a tiny initrd which just loads the three needed modules when starting the kernel with the first root fs image.

Is there an example receipt realizing such a scenario?

Steffen




