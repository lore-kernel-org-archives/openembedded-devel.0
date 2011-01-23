Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ph20U-0007kN-PX
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 16:37:35 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ph1zl-0006yF-Cg from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 07:36:49 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 23 Jan 2011 07:36:48 -0800
Received: from [172.30.80.40] ([172.30.80.40]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 23 Jan 2011 08:36:48 -0700
Message-ID: <4D3C4B0B.3080108@mentor.com>
Date: Sun, 23 Jan 2011 08:36:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>	<AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>	<AANLkTin27ikNKV4v3D+e+cu_=SHv7Vv+0ef-z61irn60@mail.gmail.com>
	<AANLkTimOGhiwA+szLoWVzAUP2AUX1YVBcOnMLg3YSWdM@mail.gmail.com>
In-Reply-To: <AANLkTimOGhiwA+szLoWVzAUP2AUX1YVBcOnMLg3YSWdM@mail.gmail.com>
X-OriginalArrivalTime: 23 Jan 2011 15:36:48.0210 (UTC)
	FILETIME=[58FF7320:01CBBB13]
Subject: Re: Recipes with fetch failures:
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
X-List-Received-Date: Sun, 23 Jan 2011 15:37:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2011 01:17 PM, Khem Raj wrote:
> On Sat, Jan 22, 2011 at 12:07 PM, Otavio Salvador
> <otavio@ossystems.com.br>  wrote:
>> On Sat, Jan 22, 2011 at 17:46, Khem Raj<raj.khem@gmail.com>  wrote:
>>> On Sat, Jan 22, 2011 at 10:06 AM, Otavio Salvador
>>>>    cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=ipkg-utils
>>>>
>>>
>>> yeah hh.org is gone. So you need to rely on mirrors to get the tarballs
>>> add
>>>
>>> SOURCE_MIRROR_URL ?= "http://sources.openembedded.org/"
>>>
>>> to your local.conf and probably you also need to inherit own_mirrors
>>
>> I think the recipe should be change to use this in this case. I know I
>> can use mirrors but the recipe ought to use a fetchable reference IMO.
>>
>
> we are still hopeful of getting the cvs repos. But yes it wont hurt if
> the SRC_URIs pointed
> to source mirrors for now

If a rather critical part of how we do things was apparently dead 
software and just went away, perhaps we really really need to 
investigate using something else or taking up the project and hosting it 
$wherever ?

-- 
Tom Rini
Mentor Graphics Corporation


