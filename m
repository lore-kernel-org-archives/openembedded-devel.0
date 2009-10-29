Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N3V4c-0002Vk-5U
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 14:29:57 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id ABB58491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 14:28:48 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 29 Oct 2009 14:31:01 +0100
Message-ID: <4AE9986B.6070606@dresearch.de>
Date: Thu, 29 Oct 2009 14:28:11 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE992C4.4040802@dresearch.de>
	<200910291422.50013.holger+oe@freyther.de>
In-Reply-To: <200910291422.50013.holger+oe@freyther.de>
X-OriginalArrivalTime: 29 Oct 2009 13:31:01.0484 (UTC)
	FILETIME=[0E7F32C0:01CA589C]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to use patchwork?
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
X-List-Received-Date: Thu, 29 Oct 2009 13:29:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 29 October 2009 14:04:04 Steffen Sledz wrote:
>> In the last days i had to patch suggestions concerning common recipes
>> (glibc and busybox). That's why i planned to introduce them via the
>> patchwork queue.
>>
>> I prepared them with "git format-patch" and sent them using "git
>> send-email" to openembedded-devel@lists.openembedded.org. They were
>> sent to the list but did not reach patchwork. :(
>>
>> So i believe i did something wrong. But what? Unfortunately the wiki
>> is not very helpful here.
> 
> Did you have a "Signed-off-by: " line in it?

Yep, see e.g.
<http://thread.gmane.org/gmane.comp.handhelds.openembedded/26999>




