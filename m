Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MfbZE-0001b2-Nu
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 17:34:44 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 095BA16E23B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 17:17:01 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id BD5542A424C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 17:17:00 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 24 Aug 2009 17:16:51 +0200
Message-ID: <4A92AECA.6070309@dresearch.de>
Date: Mon, 24 Aug 2009 17:16:26 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 24 Aug 2009 15:16:51.0671 (UTC)
	FILETIME=[E83D5670:01CA24CD]
Subject: IMAGE_FSTYPES for u-boot initrd images?
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
X-List-Received-Date: Mon, 24 Aug 2009 15:34:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It seems that it is currently not possible to build root fs images ready for use as u-boot initrd.  Did i overlook something or is this right? 

Similar to the do_uboot_mkimage() there should be a funktion which wraps a cpio.gz image. Can someone help?

Steffen




