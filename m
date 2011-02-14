Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp2Kf-0002Id-Sk
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:35:30 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp2JY-000210-CP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:34:20 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 09:34:02 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 10:34:01 -0700
Message-ID: <4D59677E.2040004@mentor.com>
Date: Mon, 14 Feb 2011 10:33:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>	<AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>	<AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
	<AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
In-Reply-To: <AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
X-OriginalArrivalTime: 14 Feb 2011 17:34:01.0456 (UTC)
	FILETIME=[5E3A1F00:01CBCC6D]
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 17:35:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 10:22 AM, Filip Zyzniewski wrote:
> On 2/14/11, Otavio Salvador<otavio@ossystems.com.br>  wrote:
>
>> Right but usually we'll have drivers/modules for one, two or three
>> vendors that are used or demanded to be supported and then those
>> firmware needs to be supported as well.
>
> Can you give an example?
> If you are building a distro for a device with USB host - on what
> basis do you choose whose products to support?

Honestly, I think we need bus and vendor in the split.  I do want the 
firmware for my ralink USB WiFi dongle but not all of the other vendors 
and I'd un-install what I could un-install.

-- 
Tom Rini
Mentor Graphics Corporation


