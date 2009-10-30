Received: from [64.18.0.188] (helo=exprod5og109.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1N3mw7-0004SS-5i
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 09:34:22 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSuqkxsRHRwIRTEseblG20e1SKblB+roA@postini.com;
	Fri, 30 Oct 2009 01:33:13 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip07.e2k.ad.ge.com with ESMTP; 30 Oct 2009 04:33:10 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 30 Oct 2009 04:33:11 -0400
Message-ID: <4AEAA523.8020101@gefanuc.com>
Date: Fri, 30 Oct 2009 08:34:43 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE992C4.4040802@dresearch.de>	<200910291422.50013.holger+oe@freyther.de>
	<4AE9986B.6070606@dresearch.de>
In-Reply-To: <4AE9986B.6070606@dresearch.de>
X-SA-Exim-Connect-IP: 64.18.0.188
X-SA-Exim-Mail-From: martyn.welch@gefanuc.com
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
X-List-Received-Date: Fri, 30 Oct 2009 08:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Holger Hans Peter Freyther wrote:
>   
>> On Thursday 29 October 2009 14:04:04 Steffen Sledz wrote:
>>     
>>> In the last days i had to patch suggestions concerning common recipes
>>> (glibc and busybox). That's why i planned to introduce them via the
>>> patchwork queue.
>>>
>>> I prepared them with "git format-patch" and sent them using "git
>>> send-email" to openembedded-devel@lists.openembedded.org. They were
>>> sent to the list but did not reach patchwork. :(
>>>
>>> So i believe i did something wrong. But what? Unfortunately the wiki
>>> is not very helpful here.
>>>       
>> Did you have a "Signed-off-by: " line in it?
>>     
>
> Yep, see e.g.
> <http://thread.gmane.org/gmane.comp.handhelds.openembedded/26999>
>   
At a guess it's because your "Signed-off-by:" line has an obscured email 
address in it.

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 927559189



