Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PbL2y-0000sr-9p
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:44:36 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PbL2X-0002FG-4C from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 14:44:09 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 7 Jan 2011 14:44:08 -0800
Received: from [172.30.33.71] ([172.30.33.71]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 7 Jan 2011 15:44:07 -0700
Message-ID: <4D279734.4@mentor.com>
Date: Fri, 07 Jan 2011 15:44:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
	<4D266CA1.4060306@mentor.com>
In-Reply-To: <4D266CA1.4060306@mentor.com>
X-OriginalArrivalTime: 07 Jan 2011 22:44:07.0999 (UTC)
	FILETIME=[64E4C4F0:01CBAEBC]
Subject: Re: testing branch 2011-01-06
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
X-List-Received-Date: Fri, 07 Jan 2011 22:44:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2011 06:30 PM, Tom Rini wrote:
> On 01/06/2011 04:22 PM, Cliff Brake wrote:
>> master has been merged to testing-next and is ready for clean builds.
>>
>> There are only 7 combinations listed as passing. If anyone has data
>> that is not entered, I'll check back tomorrow morning before I create
>> the tag.
>>
>> For more information on OpenEmbedded testing, see:
>>
>> http://www.openembedded.org/index.php/Testing
>>
>> We have lost some momentum with testing, so it would be nice to pick
>> up this effort again (speaking to myself first). I just ordered a 2TB
>> drive, so hopefully that will give me the capacity to do some more
>> builds.
>
> I see that the testing branch does contain the super long path fixes I
> pushed today so I expect to finally be able to push some real results
> (and failures!) over to the wiki this week. Build has started.

So, unfortunately the help2man fix I pushed today is also needed to get 
a lot of things pushed towards building.  I'm also working on building 
(so I can test) moving the qemu boards over to xserver-xorg & co from 
kdrive since we can get build failures if xserver-kdrive is the winner 
(or provided anything at all? Not sure off the top of my head) for some 
headers as other parts of X11R7.5 say "too old!" and bail.

-- 
Tom Rini
Mentor Graphics Corporation


