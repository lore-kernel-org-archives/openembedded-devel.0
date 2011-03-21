Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q1Ufg-0001go-0Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 03:16:40 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q1Udx-0007FD-4u from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 19:14:53 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Mar 2011 19:14:09 -0700
Received: from [172.30.80.15] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 20 Mar 2011 19:14:52 -0700
Message-ID: <4D86B486.6030205@mentor.com>
Date: Sun, 20 Mar 2011 19:14:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110311081950.GG7353@excalibur.local>	<1300385432.2298.33.camel@saphir>
	<1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
In-Reply-To: <AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
X-OriginalArrivalTime: 21 Mar 2011 02:14:09.0459 (UTC)
	FILETIME=[A9B0F830:01CBE76D]
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Mon, 21 Mar 2011 02:16:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2011 12:57 AM, Frans Meulenbroeks wrote:
> 2011/3/17 Richard Purdie<richard.purdie@linuxfoundation.org>:
>> On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
>>> I'm in favor of keeping it, cleaning it up, and improve
>>> the integration with patchwork / git. Throwing it away
>>> would be a very bad sign to all those countless people
>>> who've gone through the pains of actually working with
>>> the bugtracker.
>>
>> The simple question is who is actually going to sort out the mess its
>> in?
>>
>> Who is going to look after it on a continuing basis?
>>
>> If there isn't ownership, nothing is going to change.
>
> Actually I feel the real problem is that:
> - people did not want to get bugs assigned to them (at least that was
> what someone told me in the past)
> - we're lacking a good notion of package or recipe ownership, so even
> if we had someone acting as a bug manager, (s)he would have a hard
> time to find out who to assign an issue to.
>
> and of course it takes discipline to look at regular intervals in the
> bug tracker to see if there are issues that affect the recipes you
> feel responsible for.
> A discipline that few people have and that is also easy to forget if
> there is only very rarely something for you.
>
> So it is more of a process issue.
> (btw this may be something that could be picked up by the TSC).

The feeling of the TSC thus far has been "where are the active 
volunteers to use BTS (bugzilla, whatever)".  This far in the thread I 
count one.

-- 
Tom Rini
Mentor Graphics Corporation


