Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqSmF-0007MN-69
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 17:01:51 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PqSl3-00049C-8D from Tom_Rini@mentor.com ;
	Fri, 18 Feb 2011 08:00:37 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 08:00:36 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 09:00:35 -0700
Message-ID: <4D5E979D.9060308@mentor.com>
Date: Fri, 18 Feb 2011 09:00:29 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com> <4D5D9706.80504@opensimpad.org>
	<4D5E90B0.2020006@mentor.com>
	<AANLkTinx+zH=e+XJmceXo1DiR4mCSSx7rB=mmT5yApMX@mail.gmail.com>
In-Reply-To: <AANLkTinx+zH=e+XJmceXo1DiR4mCSSx7rB=mmT5yApMX@mail.gmail.com>
X-OriginalArrivalTime: 18 Feb 2011 16:00:35.0566 (UTC)
	FILETIME=[FA8230E0:01CBCF84]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 18 Feb 2011 16:01:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2011 08:46 AM, Khem Raj wrote:
> On Fri, Feb 18, 2011 at 7:30 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 02/17/2011 02:45 PM, Bernhard Guillon wrote:
>>>
>>> On 14.02.2011 17:11, Tom Rini wrote:
>>>>
>>>> On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
>>>>>
>>>>>
>>>>> I have access to such a device and can test booting of console-image
>>>>
>>>> Fails to build with: http://pastebin.com/rjsmt0M9
>>>>
>>>
>>> Hi,
>>> I just build a console-image and it booted fine on my atngw100.
>>
>> Hmm.  How do you force it to linux-uclibc?  I had assumed I just needed to
>> say MACHINE=atngw100 DISTRO=ansgtrom-2010.x and it would work, but I get a
>> linux not linux-uclibc build and binutils can't configure.
>
> in angstrom you would need ANGSTROMLIBC="uclibc" also to be defined along
> since default is eglibc

OK, but I'll note angstrom obeys LIBC like everyone else does or can. :)

-- 
Tom Rini
Mentor Graphics Corporation


