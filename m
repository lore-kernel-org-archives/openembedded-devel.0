Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqSJd-0006O3-2s
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:32:17 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqSIQ-0000rn-TT from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 07:31:02 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 07:31:02 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 08:31:01 -0700
Message-ID: <4D5E90B0.2020006@mentor.com>
Date: Fri, 18 Feb 2011 08:30:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>	<20110208145355.GF2050@xora-build.xora.org.uk>	<4D515A17.3060203@mentor.com>	<4D523623.7030509@opensimpad.org>	<4D59543B.50506@mentor.com>
	<4D5D9706.80504@opensimpad.org>
In-Reply-To: <4D5D9706.80504@opensimpad.org>
X-OriginalArrivalTime: 18 Feb 2011 15:31:01.0768 (UTC)
	FILETIME=[D93E1880:01CBCF80]
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
X-List-Received-Date: Fri, 18 Feb 2011 15:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2011 02:45 PM, Bernhard Guillon wrote:
> On 14.02.2011 17:11, Tom Rini wrote:
>> On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
>>>
>>>
>>> I have access to such a device and can test booting of console-image
>>
>> Fails to build with: http://pastebin.com/rjsmt0M9
>>
>
> Hi,
> I just build a console-image and it booted fine on my atngw100.

Hmm.  How do you force it to linux-uclibc?  I had assumed I just needed 
to say MACHINE=atngw100 DISTRO=ansgtrom-2010.x and it would work, but I 
get a linux not linux-uclibc build and binutils can't configure.

-- 
Tom Rini
Mentor Graphics Corporation


