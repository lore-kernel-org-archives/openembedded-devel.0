Received: from bosmailout10.eigbox.net ([66.96.188.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from
	<SRS0=tIDDhH=DZ=mindchasers.com=openembedded@eigbox.net>)
	id 1SWHMY-0007Y9-PE for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 03:24:42 +0200
Received: from bosmailscan11.eigbox.net ([10.20.15.11])
	by bosmailout10.eigbox.net with esmtp (Exim) id 1SWGjA-0000kb-82
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 20:44:00 -0400
Received: from bosimpout01.eigbox.net ([10.20.55.1])
	by bosmailscan11.eigbox.net with esmtp (Exim)
	id 1SWGj9-0001Yo-Af; Sun, 20 May 2012 20:43:59 -0400
Received: from bosauthsmtp02.eigbox.net ([10.20.18.2])
	by bosimpout01.eigbox.net with NO UCE
	id CQjz1j00402gpmq01Qjzqc; Sun, 20 May 2012 20:43:59 -0400
X-Authority-Analysis: v=2.0 cv=HfGjuF48 c=1 sm=1
	a=pE7rXYWSHihduKiUhs7UFw==:17 a=mn2ndCrYJZwA:10 a=eFosVe0FMc8A:10
	a=uTH-7-Q0MNEA:10 a=Lk7aQFya1KUA:10 a=8nJEP1OIZ-IA:10 a=jV2zTg0wAAAA:8
	a=Q4-j1AaZAAAA:8 a=N54-gffFAAAA:8 a=GNEw3xDRAAAA:8
	a=Xl1ip9RXVbry3oUYVxIA:9
	a=wPNLvfGTeEIA:10 a=nAPXUAfsBmEA:10 a=9MP9vxlQrmnoeofDS6o88g==:117
X-EN-OrigOutIP: 10.20.18.2
X-EN-IMPSID: CQjz1j00402gpmq01Qjzqc
Received: from pool-108-25-187-176.atclnj.east.verizon.net ([108.25.187.176]
	helo=[192.168.1.3]) by bosauthsmtp02.eigbox.net with esmtpa (Exim)
	id 1SWGj9-0004e0-K2; Sun, 20 May 2012 20:43:59 -0400
Message-ID: <4FB98FCC.9050306@mindchasers.com>
Date: Sun, 20 May 2012 20:43:56 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
In-Reply-To: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
X-EN-UserInfo: cb6d325fe03740ac93d537d78041f599:2186c883651a1065ea1e15c5a112545a
X-EN-AuthUser: bcochran@mindchasers.com
Sender: Bob Cochran <openembedded@mindchasers.com>
X-EN-OrigIP: 108.25.187.176
X-EN-OrigHost: pool-108-25-187-176.atclnj.east.verizon.net
Cc: Peter Bigot <bigotp@acm.org>
Subject: Re: oe-core license description practices
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
X-List-Received-Date: Mon, 21 May 2012 01:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2012 10:15 AM, Peter Bigot wrote:
> I need a resolution to this question so I can complete the port of an
> oe-classic recipe to oe-core.
>
> http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
> LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
> just 'GPL')".  If the upstream package self-describes as "GPL", is it
> necessary that this be refined to a more specific version?  I again
> note there are numerous existing recipes that do not provide more than
> "GPL".
>
> Depending on the answer, I will resubmit with a license of GPL | HPND
> or will attempt to contact the upstream maintainer for clarification.
>
> Thanks.
>
> Peter
>
> On Sat, Dec 31, 2011 at 3:28 PM, Peter Bigot<bigotp@acm.org>  wrote:
>> On Sat, Dec 31, 2011 at 1:40 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>

snip


Hi Peter,

Did this get resolved?  I'm not finding python-mysqldb on the git server 
outside of classic.

However, I did make use of the 1.2.3 patches you offered on 12/31/11, so 
thanks for that.  I have done some minimal testing with django tonight, 
and it seems to be working OK.

Bob





