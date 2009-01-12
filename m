Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LMTgf-0005NO-UG
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 21:47:06 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090112204034.SBCO11567.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>;
	Mon, 12 Jan 2009 15:40:34 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 2kgZ1b0071E665w03kgZq6; Mon, 12 Jan 2009 15:40:35 -0500
X-Authority-Analysis: v=1.0 c=1 a=rINLuMDxMIoA:10 a=7OzDuaD8CwYA:10
	a=Kha7vK6gmQsA9L0z54UA:9 a=ffZGackDNdPvxWA5RCOMzdPy-4QA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 12 Jan 2009 13:41:07 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: Koen Kooi <k.kooi@student.utwente.nl>
Message-ID: <20090112204107.GD3342@smtp.west.cox.net>
References: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>
	<20090112200403.GB3342@smtp.west.cox.net>
	<9AB0D1BC-C8E5-49AF-9841-8563DC76CC9B@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <9AB0D1BC-C8E5-49AF-9841-8563DC76CC9B@student.utwente.nl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: OE weekly changelog 2009-01-05 to 2009-01-12
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
X-List-Received-Date: Mon, 12 Jan 2009 20:47:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2009 at 09:08:01PM +0100, Koen Kooi wrote:
>
> Op 12 jan 2009, om 21:04 heeft Tom Rini het volgende geschreven:
>
>> On Mon, Jan 12, 2009 at 11:02:34AM -0500, Cliff Brake wrote:
>> [snip]
>>> Koen Kooi (57):
>> [snip]
>>>      mtd-utils: add 1.2.0+git for ubifs-support
>>>      mtd-utils: package *all* ubifs utils
>>
>> Anything in particular holding back on a -native version too?
>
> Nothing apart from a bit of testing :)

OK.  I just checked my stuff and there wasn't anything special for the
-native one.  I haven't pushed yet as I did my building vs
e2fsprogs-1.38 (and made it stage uuid) and I can't quite get a build
ready to test using -1.35 as quick as you could :)

I also did a -cross-sdk set of packages, but that can wait until Richard
does the BBCLASSEXTENDS (or whatever it gets called) stuff.

-- 
Tom Rini


