Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PtSf4-0004kE-9c
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 23:30:50 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PtScC-0003Sp-BA from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 14:27:52 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 26 Feb 2011 14:27:51 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sat, 26 Feb 2011 14:27:50 -0800
Message-ID: <4D697E58.2040202@mentor.com>
Date: Sat, 26 Feb 2011 15:27:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D6818C6.4010100@mentor.com>
	<20110226220018.GE10042@ibawizard.net>
In-Reply-To: <20110226220018.GE10042@ibawizard.net>
X-OriginalArrivalTime: 26 Feb 2011 22:27:51.0481 (UTC)
	FILETIME=[677F7290:01CBD604]
Subject: Re: Release-2011.03: Let the testing re-continue again!
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
X-List-Received-Date: Sat, 26 Feb 2011 22:30:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/26/2011 03:00 PM, Petr Štetiar wrote:
> Tom Rini<tom_rini@mentor.com>  [2011-02-25 14:01:58]:
>
>> I plan to otherwise follow what I said in the previous email about final
>> branching plans, as I'm running out of ways to modify the Subject :)
>
> FYI more build errors, build host is Ubuntu 10.04.2 64-bit. It seems, that the
> console-image on uclibc needs some more love...
>
> micro-uclibc   http://pastebin.com/mKvgZJnC
> minimal-uclibc http://pastebin.com/2cWCZx37

That's "normal" when DISTRO_TYPE=release isn't set.

-- 
Tom Rini
Mentor Graphics Corporation


