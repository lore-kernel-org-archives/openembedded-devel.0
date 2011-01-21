Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pg5AC-00053L-76
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 01:47:40 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pg59V-0004NH-OA from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 16:46:57 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 20 Jan 2011 16:46:57 -0800
Received: from [172.30.80.40] ([172.30.80.40]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 20 Jan 2011 17:46:56 -0700
Message-ID: <4D38D77E.7070000@mentor.com>
Date: Thu, 20 Jan 2011 17:46:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
	<AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
In-Reply-To: <AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
X-OriginalArrivalTime: 21 Jan 2011 00:46:56.0627 (UTC)
	FILETIME=[B44EEC30:01CBB904]
Subject: Re: testing branch 2011-01-20
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
X-List-Received-Date: Fri, 21 Jan 2011 00:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2011 04:00 PM, Cliff Brake wrote:
> 60+ combinations tested last week!!!
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-13
>
> For more information on the testing effort, please see:
>
> http://www.openembedded.org/index.php/Testing
>
> Tom has enough combinations in testing now, it may be time to think
> about a little more automation for this.

All of those combinations are tested automatically of course, so I 
assume you mean data input, and, yes please!  BTW, it looks like Khem 
fixed uclibc+meta-toolchain so I'll be listing all of those I hope once 
this latest run finishes.

-- 
Tom Rini
Mentor Graphics Corporation


