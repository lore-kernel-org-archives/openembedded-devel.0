Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Md4Vl-0004vW-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 17:52:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 03C5553FB87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 11:35:42 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14895-10 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 17 Aug 2009 11:35:41 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9E2D953FB63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 11:35:41 -0400 (EDT)
Message-ID: <4A8978CD.8060607@cbnco.com>
Date: Mon, 17 Aug 2009 11:35:41 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>	<1250515743-10823-2-git-send-email-msmith@cbnco.com>	<1250515743-10823-3-git-send-email-msmith@cbnco.com>
	<200908171612.13311.holger+oe@freyther.de>
In-Reply-To: <200908171612.13311.holger+oe@freyther.de>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 3/3] syslinux: upgrade to 3.82 and split into a few packages
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
X-List-Received-Date: Mon, 17 Aug 2009 15:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Monday 17 August 2009 15:29:03 Michael Smith wrote:
>> 3.63 is no longer available.

> Haha, this might sound weird... Could you write a section for our usermanual 
> on how to use syslinux?

Sure, I can take a look at that later. I'm really only using extlinux 
for USB sticks; for everything else I still like GRUB best.

Mike


