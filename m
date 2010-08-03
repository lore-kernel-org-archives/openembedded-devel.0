Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgRJC-0005om-Qd
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 01:54:17 +0200
Received: from gandalf.denix.org ([unknown] [71.255.225.53])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6L00L69P1CZOW0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 18:53:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3661E14AF60; Tue,
	03 Aug 2010 19:53:36 -0400 (EDT)
Date: Tue, 03 Aug 2010 19:53:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100803235336.GB17391@denix.org>
References: <alpine.DEB.2.00.1007260653230.5356@lynx>
	<i2jrl9$4j3$1@dough.gmane.org>
	<alpine.DEB.2.00.1007260744150.11202@lynx>
	<20100801223927.GE30928@gmail.com> <4C56D307.2090707@balister.org>
MIME-version: 1.0
In-reply-to: <4C56D307.2090707@balister.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: should beagleboard-demo-image (b-d-i) be theoretically	buildable?
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
X-List-Received-Date: Tue, 03 Aug 2010 23:54:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 02, 2010 at 10:15:35AM -0400, Philip Balister wrote:
> On 08/01/2010 06:39 PM, Khem Raj wrote:
>> On (26/07/10 07:46), Robert P. J. Day wrote:
>>> On Mon, 26 Jul 2010, Koen Kooi wrote:
>>>
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> It builds fine on all the buildhosts I have (ubuntu 8.04-32bit,
>>>> 9.10-64bit, debian testing-64bit among others).
>>>>
>>>> And I see no logs attached to your email, so I can't help.
>>>
>>>    come on, koen, that last part was uncalled for.  i specifically
>>> stated that i hadn't run the build yet, i just wanted to know if there
>>> were any *known* issues for my 64-bit ubuntu 10.04 platform.
>>>
>>>    given that you certainly have *legitimate* reasons to criticize some
>>> of my posts here, you don't need to make stuff up.
>>
>> You could also check tinderbox.openembedded.org for build results and
>> it will help you determine the state of stuff you are interested in.
>
> Until the server situation gets sorted out, tinderbox may not be available 
> at all times.

Plus, tinderbox has been acting up lately, even before the server failure (or 
was it actually related?) - in the past month or two there were intermittent 
messages about it being unavailable during the build (going up and down all 
the time), resulting in unfinished stats...

-- 
Denys


