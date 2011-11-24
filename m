Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RTdvr-0007Kq-T5
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 19:21:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id BF8133156105
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 19:15:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Qq7pS0Y2mvbT
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 19:15:21 +0100 (CET)
Received: from [172.22.22.61] (drms-4d0150b5.pool.mediaWays.net [77.1.80.181])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7C3D931560CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 19:15:21 +0100 (CET)
Message-ID: <4ECE89B8.8060002@opendreambox.org>
Date: Thu, 24 Nov 2011 19:15:20 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20111031 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<1341768.l3QXe5jHAh@helios> <jam005$3bl$2@dough.gmane.org>
In-Reply-To: <jam005$3bl$2@dough.gmane.org>
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 18:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.11.2011 18:47, Koen Kooi wrote:
> Op 24-11-11 12:43, Paul Eggleton schreef:
>> On Thursday 24 November 2011 12:33:29 Paul Menzel wrote:
>>> You seem to use OE-core and meta-oe already so I understand your point 
>>> of view. Martin, Koen, Andreas and you are doing the major work for 
>>> meta-oe and not a lot of other people contribute.
>>>
>>> In my opinion it is a bad sign to force people to switch. OE-core and 
>>> meta-oe should be so appealing that they switch by themselves. My 
>>> impression from reading the list and from IRC is that a lot of people 
>>> still have objections and are not totally comfortable. Good community 
>>> management would be to listen to these people then try to find
>>> solutions and implement them. People then should come by themselves.
> 
>> Let's not get carried away. In the current discussion it seems the main 
>> objection to switching from several people is that they are in the middle
>> or close to the end of their development cycle on products that depend on
>> OE- classic; it's totally understandable that those people can't switch
>> at this time. I'm not entirely convinced those people can't use the
>> 2011.3 maintenance branch for those purposes however.
> 
> Most, if not all people objecting to OE-classic closing seem to be on
> 2011.03-maintenance already. The confusion seems to be rooted into not
> paying attention when Tom said fixes for the maintenance branch can go
> through oe-core/meta-oe/whatever as well. That is even mentioned in the damn
> wiki for the maintenance branch!

Ah, of course. Just tell everybody to switch to oe-core, so they can
backport fixes from there to 2011.03. Sure. That's what everybody who
isn't able to switch to oe-core for some reason will do.

Mentioning your "damn" wiki again and again doesn't help anybody.

Regards,
Andreas


