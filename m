Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Let7G-0004l7-HH
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:34:38 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304153023.YAGJ10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Mar 2009 10:30:23 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id P3WM1b0084dMFYL043WMzd; Wed, 04 Mar 2009 10:30:23 -0500
X-Authority-Analysis: v=1.0 c=1 a=GwHlaoLqetoA:10 a=yXSnPE-BrL4A:10
	a=UQJ1FK12DMEHe_hzdXUA:9 a=QQFmC916zVDk4cmUDI0A:7
	a=WNAxvKsIrlOpN3lMnrsGg8OQuqoA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 08:30:21 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304153021.GP26343@smtp.west.cox.net>
References: <go498c$bqq$1@ger.gmane.org> <golnv0$h4r$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <golnv0$h4r$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 04 Mar 2009 15:34:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 12:16:48PM +0100, Koen Kooi wrote:
> On 25-02-09 21:21, Koen Kooi wrote:
>> Hi,
>>
>> I keep trying to teach people the difference between recipes (what's in
>> OE) and packages (what you install on the target) and keep getting
>> reactions like "ok, but why is the dir called packages?", which are
>> completely valid.
>>
>> Proposal:
>>
>> mv packages recipes ; git commit .
>
> Only positive replies sofar, so when do we want to schedule this commit?  
> My proposal is somewhere in april, since I'm too busy this month with  
> bossaconference and university work to deal with the fallout properly.

Fine with me.  Do I have a vote? :)

> Also, shall we restructure TMPDIR at the same time?

Yes, lets get that RFC out :)  FWIW, I think 'sdk' should be in the same
place as the other target oriented stuff.  Perhaps target/${host}/sdk/

-- 
Tom Rini


