Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P0FMB-0001ty-KP
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 17:11:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P0FLz-0006Mx-PL from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:10:55 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 27 Sep 2010 08:10:55 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 27 Sep 2010 09:10:54 -0600
Message-ID: <4CA0B3FC.5020709@mentor.com>
Date: Mon, 27 Sep 2010 08:10:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9CD59D.30301@cbnco.com> <4CA05EBB.6080604@ge.com>
	<Pine.LNX.4.64.1009270757000.5082@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.1009270757000.5082@juice.ott.cti.com>
X-OriginalArrivalTime: 27 Sep 2010 15:10:54.0518 (UTC)
	FILETIME=[2E2E5D60:01CB5E56]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Minimum python version - 2.4 or 2.5?
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
X-List-Received-Date: Mon, 27 Sep 2010 15:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael Smith wrote:
> On Mon, 27 Sep 2010, Martyn Welch wrote:
> 
>> Unless something has changed in he last few months, I think we wanted to
>> support 2.4 for a little while longer:
>>
>> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06143.html
> 
> Hmm, so RHEL5 is still using Python 2.4.
> 
> SLES10 is in the same situation, but installing Python from source worked 
> seamlessly for me. Maybe we could require RHEL5 users to upgrade Python. 
> Bitbake 1.10 also requires Python 2.5 and runs about 30% faster than 1.8, 
> so there's good reason for RHEL5 users to want to switch.

Here's my once again whine for not adding deps for things that RHEL 
users can't get via the official channels.  Yes, they can install things 
from source and that's not nice.

Now, if you want to talk about making bitbake 1.10.0 the minimum for OE, 
that's another story.

-- 
Tom Rini
Mentor Graphics Corporation


