Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCcwB-00080Q-Un
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 20:15:22 +0200
Received: (qmail 25513 invoked by uid 503); 13 May 2010 18:18:14 -0000
Received: from b6.ovh.net (HELO mail406.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 13 May 2010 18:18:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 May 2010 18:11:13 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.7?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 13 May 2010 18:11:12 -0000
Message-ID: <4BEC40BF.7070207@eukrea.com>
Date: Thu, 13 May 2010 20:11:11 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.DEB.2.00.1005131147350.2007@lynx>	<4BEC241A.2090802@eukrea.com>	<alpine.DEB.2.00.1005131212200.11789@lynx>
	<AANLkTikmU6fbniORwgp86_hFk9khRLDsG5BllWGVtYm8@mail.gmail.com>
In-Reply-To: <AANLkTikmU6fbniORwgp86_hFk9khRLDsG5BllWGVtYm8@mail.gmail.com>
X-Ovh-Tracer-Id: 4665729215287504201
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: chance to document entire OE setup on ubuntu 10.04
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
X-List-Received-Date: Thu, 13 May 2010 18:15:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/05/2010 19:57, Khem Raj a écrit :
> On Thu, May 13, 2010 at 9:13 AM, Robert P. J. Day<rpjday@crashcourse.ca>  wrote:
>> On Thu, 13 May 2010, Eric Bénard wrote:
>>
>>> Le 13/05/2010 17:53, Robert P. J. Day a écrit :
>>>>
>>>>     while this sounds decidedly unsexy, given that i'm just getting
>>>> into ubuntu 10.04, i have the chance to document every step it
>>>> takes to setup OE on a fresh, default 10.04 install, including
>>>> what packages are *actually* required since i suspect some of the
>>>> ones currently listed aren't technically necessary.
>>>>
>>> I tested yesterday on a 10.04 and vs the actual wiki, I think chrpath is
>>> missing from the list of what is required.
>
> this is a newly created dependency probably hasn't made into documents yet
> but sanity should complain about it if its missing.
>
yes that's the case, it's only missing from the wiki.

Eric


