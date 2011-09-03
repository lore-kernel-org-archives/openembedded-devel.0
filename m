Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1QzuDE-00036f-Si
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 19:41:00 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p83HaIUh006180; Sat, 3 Sep 2011 19:36:18 +0200
Message-ID: <4E626583.3060302@vollmann.ch>
Date: Sat, 03 Sep 2011 19:36:03 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.20) Gecko/20110805 Thunderbird/3.1.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314962732.3526.32.camel@mattotaupa>	<CAP9ODKpMU3yr==7+qyBvTyW3ikoSXtZqurKwsCn3Nn_54E0k7Q@mail.gmail.com>	<1314969543.5939.586.camel@rex>	<CAP9ODKoDFrgfTXeCw-dtGn4s_V+Uxh4U4HfbWe-0OOBAC385=g@mail.gmail.com>	<89FA71E7-9402-4458-BC9E-42655707B091@dominion.thruhere.net>	<CAP9ODKq2-xj2v1EN461+Lzon2oXCw4g+swE1T62teuxK9TzfvA@mail.gmail.com>
	<1314982026.5939.607.camel@rex>
In-Reply-To: <1314982026.5939.607.camel@rex>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Sat, 03 Sep 2011 17:41:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/11 18:47, Richard Purdie wrote:
> On Fri, 2011-09-02 at 10:53 -0300, Otavio Salvador wrote:
>> On Fri, Sep 2, 2011 at 10:33, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>> That sounds like people should just subscribe to oe-core if they want to be aware of changes instead of merging the 2 lists.
>>
>> Many times changes are related to meta-oe and oe-core and we'd need to
>> cross-post and seems wrong.
>
> I don't think this is actually true and its reasonable to assume
> discussion on OE-Core is seen by everyone.
Currently, the list descriptions read:
"openembedded-devel@lists.openembedded.org
Purpose: General discussion & patch submission

openembedded-core@lists.openembedded.org
Purpose: Discussions and patches for OE-Core"

Given this description I see hardly any post to openembedded-core
that shouldn't go to openembedded-devel as well.
But cross-posts are bad.

I'm not against two separate lists, but it should be clear what
should go to which list.  If the separation line is such that
there are more than 10% cross posts, then the lists should be joined.

BTW, some seem to think that openembedded-devel is for OE-Classic,
while openembedded-core should be for the new system (i.e. includes
oe-core and meta-oe).
That might be a better separation line to avoid cross posts, but
if that's what people want, this should be clearly said.

Another separation line would be the old -devel and -users separation.

Personally I could live with clearly separated lists, but I think
that just merging everything into openembedded-devel would be the
approach that serves all best, as everybody has his own separation
line anyway.

   Detlef


