Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PAHtF-0005aO-At
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 09:54:52 +0200
Received: (qmail 8973 invoked by uid 503); 25 Oct 2010 07:33:36 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 25 Oct 2010 07:33:36 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Oct 2010 09:54:06 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Oct 2010 09:54:06 +0200
Message-ID: <4CC5379D.3050006@eukrea.com>
Date: Mon, 25 Oct 2010 09:54:05 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.11) Gecko/20101013 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC49A20.5080001@eukrea.com> <4CC52C90.4080707@freyther.de>
In-Reply-To: <4CC52C90.4080707@freyther.de>
X-Ovh-Tracer-Id: 4007640718521707849
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4.7.0 : QA problem : Architecture did not match
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
X-List-Received-Date: Mon, 25 Oct 2010 07:54:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Holger,

Le 25/10/2010 09:06, Holger Freyther a écrit :
> On 10/24/2010 10:42 PM, Eric Bénard wrote:
>> Hi,
>>
>> building qt4.7.0 using angstrom 2010.x for and armv5te leads to :
>> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3)
>
>>
>> The patch below (not cleaned if OK, I'll clean and push it) fix this problem,
>> but why these installs were added to the 4.7.0.inc file (they are not present
>> in 4.6.* and the recipe builds fine without)?
>
> I can only speculate right now. Maybe Qt insisted to builds its own version or
> didn't find the tools. You will need to rebuild qt4-embedded to see if it
> builds properly.
>
I've rebuilt it and it builds fine this way.

> I can also take a look at this step later today.
>
that would be greate, I won't be able to spend time on this today.

Thanks,
Eric


