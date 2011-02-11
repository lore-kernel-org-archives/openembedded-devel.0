Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnuB0-0000vh-OW
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:40:52 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pnu9w-0007Jd-Ki from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 06:39:44 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 06:39:44 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 07:39:43 -0700
Message-ID: <4D554A28.5040201@mentor.com>
Date: Fri, 11 Feb 2011 07:39:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTinrY3g2RLOnHWZ-sborNsFjET8-uE_OoU-LQ2Hf@mail.gmail.com>
In-Reply-To: <AANLkTinrY3g2RLOnHWZ-sborNsFjET8-uE_OoU-LQ2Hf@mail.gmail.com>
X-OriginalArrivalTime: 11 Feb 2011 14:39:43.0590 (UTC)
	FILETIME=[859D2860:01CBC9F9]
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Fri, 11 Feb 2011 14:40:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2011 06:44 AM, Filip Zyzniewski wrote:
> On 2/9/11, Filip Zyzniewski<filip.zyzniewski@gmail.com>  wrote:
>> We use the scsi subsystem for PCMCIA ATA access, so device files are
>> /dev/sda*, not /dev/hda*.
>> See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.
>>
>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
>
> Is there a reason for this patch to be absent from
> http://patches.openembedded.org ?
>
> Should I add it there by hand?

They're absent since I applied this and archived it back on the 9th :)

-- 
Tom Rini
Mentor Graphics Corporation


