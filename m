Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqSM1-0006Ts-35
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:34:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqSKp-00016k-6T from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 07:33:31 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 07:33:30 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 08:33:29 -0700
Message-ID: <4D5E9144.8010100@mentor.com>
Date: Fri, 18 Feb 2011 08:33:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>	<20110209100249.GG28019@excalibur.local>	<4D550B17.6000607@atmel.com>
	<AANLkTinxsHq86KY7xBBd4=iJmG3Xcz_8nx3Ex0hHHM=P@mail.gmail.com>
In-Reply-To: <AANLkTinxsHq86KY7xBBd4=iJmG3Xcz_8nx3Ex0hHHM=P@mail.gmail.com>
X-OriginalArrivalTime: 18 Feb 2011 15:33:30.0068 (UTC)
	FILETIME=[31A2E140:01CBCF81]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Fri, 18 Feb 2011 15:34:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2011 05:53 AM, Frans Meulenbroeks wrote:
> 2011/2/11 Ulf Samuelsson<ulf.samuelsson@atmel.com>:
>> Stefan Schmidt skrev 2011-02-09 11:02:
>>>
>>> Hello.
>>>
>>> On Tue, 2011-02-08 at 07:42, Tom Rini wrote:
>>>>
>>>> As March is fast approaching I want to gather the list of DISTRO /
>>>> MACHINE / BBPKGS targets that the various distributions would like
>>>> to see at least compile tested (volunteers for HW testing welcome!).
>>>
>>> I will do compile and runtime testing on bug20 (omap3). Targets would be
>>> console-, minimal- and bug-image-production. The later one includes the
>>> complete
>>> oenjdk-6 stuff with zero as JIT, the osgi recipes and much of the normal X
>>> and
>>> linux stuff.
>>>
>>
>> I think that for the AT91 the three most important targets are:
>>
>> AT91SAM9M10EKES
>> AT91SAM9G20EK
>> AT91SAM9263EK

Was missing at91sam10ekes, added.

>> I noted that when I added the gpe-mini-browser2
>> to my image, the boot fails.
>>
>
> If there is room left, we have interest in:
>
> calamari/minimal/console-image
> mpc8313e-rdb/minimal/console-image

Added.

> nslu2le/slugos/slugos-image
> nslu2be/slugos/slugos-image

Already in.

-- 
Tom Rini
Mentor Graphics Corporation


