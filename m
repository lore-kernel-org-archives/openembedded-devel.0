Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ld8sn-0004IM-9r
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 21:00:29 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090227195657.FRHR16134.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Feb 2009 14:56:57 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id M7ww1b00B4dMFYL037wwNT; Fri, 27 Feb 2009 14:56:56 -0500
X-Authority-Analysis: v=1.0 c=1 a=-YUmSzi2JToA:10 a=X-6fHHiI_zAA:10
	a=1XWaLZrsAAAA:8 a=xwjP7ZkPSL3JkErGzuAA:9
	a=6Oj59o2chdjO-q424q18Yyo5820A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 27 Feb 2009 12:56:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090227195656.GF5420@smtp.west.cox.net>
References: <go4amc$h30$1@ger.gmane.org> <go6ah4$cud$1@ger.gmane.org>
	<20090226154007.GZ2172@smtp.west.cox.net>
	<go848j$1a4$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <go848j$1a4$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] update opkg* SRCREV to 201
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
X-List-Received-Date: Fri, 27 Feb 2009 20:00:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2009 at 08:20:51AM +0100, Koen Kooi wrote:
> On 26-02-09 16:40, Tom Rini wrote:
>> On Thu, Feb 26, 2009 at 03:55:32PM +0100, Koen Kooi wrote:
>>> On 25-02-09 21:46, Koen Kooi wrote:
>>>> Hi,
>>>>
>>>> I was getting seriously annoyed with the useless error codes opkg was
>>>> giving me and Tick pointed me to:
>>>>
>>>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>>>
>>>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>>>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>>>> as well, which means instead of adding a few patches I can just bump up
>>>> SRCREV to 201.
>>>>
>>>> What do you think?
>>> Noone is thinking anything?
>>
>> <sarcasm>  not since I switched to debs</sarcasm>
>
> You still going to get bitten by opkg bugs when using packaged-staging

Something I wanna find the time to fix.

-- 
Tom Rini


