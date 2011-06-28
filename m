Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QbWu3-0003B0-5F
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 13:56:27 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 28 Jun 2011 13:52:46 +0200
X-TM-IMSS-Message-ID: <070bf03a000045e8@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 070bf03a000045e8 ;
	Tue, 28 Jun 2011 13:52:45 +0200
Message-ID: <4E09C08E.1030702@nedap.com>
Date: Tue, 28 Jun 2011 13:52:46 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4E09926B.2000406@nedap.com>	<BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>	<4E09A393.2050000@nedap.com>
	<BANLkTikXtSracNZvm2KMH87UKjBYv4xcsA@mail.gmail.com>
In-Reply-To: <BANLkTikXtSracNZvm2KMH87UKjBYv4xcsA@mail.gmail.com>
X-OriginalArrivalTime: 28 Jun 2011 11:52:46.0080 (UTC)
	FILETIME=[E54E3000:01CC3589]
Subject: Re: how to change system files
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
X-List-Received-Date: Tue, 28 Jun 2011 11:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 01:46 PM, Anders Darander wrote:
> On Tue, Jun 28, 2011 at 11:49, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> On 06/28/2011 11:23 AM, Anders Darander wrote:
>> Yeah, but what if I decide at a certain point in time to change the
>> /etc/network/interfaces file?
>> Normally I would increment PR in the bb file and then build it.
>> And finally at the target I would do opkg upgrade.
> Just as Phil said, you increment PR in your .bbappend-file.
>
> I'm oftend appending to the PR in my .bbappend-files.
Thanks! I will try it.



