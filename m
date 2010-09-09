Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Othlp-0006Om-E7
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:06:39 +0200
Received: (qmail 2919 invoked by uid 503); 9 Sep 2010 14:17:20 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 9 Sep 2010 14:17:20 -0000
Received: (qmail 22560 invoked by uid 503); 9 Sep 2010 13:49:52 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2010 13:49:51 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 16:05:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Sep 2010 16:05:48 +0200
Message-ID: <4C88E9BC.9040603@eukrea.com>
Date: Thu, 09 Sep 2010 16:05:48 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100825 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C85058D.8070506@gmail.com>	<1283996027.3036.1.camel@gnutoo-laptop>	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
	<4C88E7C2.1030500@gmail.com>
In-Reply-To: <4C88E7C2.1030500@gmail.com>
X-Ovh-Tracer-Id: 16842336708164037961
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Thu, 09 Sep 2010 14:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/09/2010 15:57, Arigead a écrit :
> Frans Meulenbroeks wrote:
>> 2010/9/9 Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>:
>>> On Mon, 2010-09-06 at 16:15 +0100, Arigead wrote:
>>>> was trying to build Asterisk for the OpenMoko Free runner and it failed
>>>> on a dependency on termcap so I tried to bitbake termcap first and that
>>>> failed. The termcap compile stage is working but it's when it tries to
>>>> install that the recipe seems to fail but I'm new to this.
>>>>
>>>> I'm off to read the openembedded documentation again but in the mean
>>>> time if anybody can give me a hit that would be great.
>>> We can't help you if you don't post some logs or console output.
>>> Copy-pasting the part where it fails, if it's small, could be enough for
>>> a start.
>>> Denis.
>>>
>>>
>> Denis, the message from Arigead is 3 days old and has already been dealt with.
>> There is a patch for asterisk from Eric that makes it build fine for me.
>>
>> Frans.
>>
>
> Yes sorry if my original post was too vague, but it was a known issue at
> the time anyhow. As Frans says the patch was added and is in the feeds
> and Asterisk is now building for my target device. Thanks for you help
> and pointing out where the problem was.
>
OK so it means the patch solves your problem. Does asterisk runs fine on 
the target ?

Eric


