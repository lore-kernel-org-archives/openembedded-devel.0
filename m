Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PeqmS-0000vU-LZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 16:14:04 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Peqlp-0006HL-Oh from Tom_Rini@mentor.com ;
	Mon, 17 Jan 2011 07:13:25 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 17 Jan 2011 07:13:24 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 17 Jan 2011 08:13:24 -0700
Message-ID: <4D345C92.6060203@mentor.com>
Date: Mon, 17 Jan 2011 08:13:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D301DFC.4090900@nedap.com> <4D305F0D.4000107@mentor.com>
	<4D340F63.60505@nedap.com>
In-Reply-To: <4D340F63.60505@nedap.com>
X-OriginalArrivalTime: 17 Jan 2011 15:13:24.0789 (UTC)
	FILETIME=[1603E650:01CBB659]
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: chattr not found?
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
X-List-Received-Date: Mon, 17 Jan 2011 15:14:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2011 02:44 AM, Jaap de Jong wrote:
> Tim,
>
> Thanks!
> But...
> at boot I get:
>
> update-alternatives: Error: cannot register alternative chattr to
> /usr/bin/chattr since it is already registered to /bin/chattr
>
> Not a big deal, I guess...

This looks like a busybox bug since on my real system I see it in 
/usr/bin/chattr.  Eric?

-- 
Tom Rini
Mentor Graphics Corporation


