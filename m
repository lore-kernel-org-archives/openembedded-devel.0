Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <u.luckas@road.de>) id 1J1fu3-0005K0-2w
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 11:30:24 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 7470D390001;
	Mon, 10 Dec 2007 11:26:14 +0100 (CET)
Received: from [192.168.116.44] (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 4FF18AD400B;
	Mon, 10 Dec 2007 11:26:14 +0100 (CET)
Message-ID: <475D1446.3060801@road.de>
Date: Mon, 10 Dec 2007 10:26:14 +0000
From: Uli Luckas <u.luckas@road.de>
User-Agent: Mozilla-Thunderbird 2.0.0.4 (X11/20070828)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200711121044.32094.u.luckas@road.de>	<200711121102.51877.u.luckas@road.de>	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
	<1197275254.4804.8.camel@localhost.localdomain>
In-Reply-To: <1197275254.4804.8.camel@localhost.localdomain>
Subject: Re: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 10:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2007-12-07 at 08:18 -0800, Hans Henry von Tresckow wrote:
>   
>> I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
>> patch to filter out the Sharp command line (for poodle at least). Let
>> me know if that approach makes more sense.
>>
>> http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace
>> kexec patch.
>>
>> Thanks for taking a look at this.
>>     
>
> I've had a look at the patches, have given them a lot of thought and I'm
> not convinced the approach is quite right. I do have an alternative
> proposal however
Richard,
I think we are talking about different approaches here. The patch Hans 
Henry but on bugs.openembedded.org is not what I posted. It still 
contains code from Mike which is not needed any more. Could you please 
reconsider export_atags_2.patch + the userspace patches only?

Regards
Uli

-- 


------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit


