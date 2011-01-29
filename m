Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PjCBN-0007sN-Tq
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:53:46 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PjCAY-0003lE-Lh from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 06:52:54 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 29 Jan 2011 06:52:54 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 29 Jan 2011 07:52:53 -0700
Message-ID: <4D4429BE.3080709@mentor.com>
Date: Sat, 29 Jan 2011 07:52:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<201101291116.07262.roman@khimov.ru>
In-Reply-To: <201101291116.07262.roman@khimov.ru>
X-OriginalArrivalTime: 29 Jan 2011 14:52:53.0684 (UTC)
	FILETIME=[352D2F40:01CBBFC4]
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 14:53:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/29/2011 01:16 AM, Roman I Khimov wrote:
> В сообщении от Пятница 28 января 2011 21:52:28 автор Tom Rini написал:
>> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
>> switches to relocatable perl-native, and then the big switch to using it
>> early.
>
> I think there is one more tiny patch needed (and probably even squashed to the
> first one) to remove "D_P = -1" from perl 5.10.1.

Good point, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


