Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAfjM-00027r-GI
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 09:45:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAfb1-0006Q4-V9
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 07:36:43 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 07:36:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 07:36:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 31 May 2009 09:36:30 +0200
Message-ID: <gvtc1u$5r8$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>	<d1b08f940905221527v147487e3n128cf91e6a7a6e1d@mail.gmail.com>	<gv817h$vbi$1@ger.gmane.org>	<20090523053143.GH23842@smtp.west.cox.net>	<20090530191353.GK23842@smtp.west.cox.net>	<gvs7hv$3ha$3@ger.gmane.org>
	<20090530222745.GU23842@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <20090530222745.GU23842@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 31 May 2009 07:45:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-05-09 00:27, Tom Rini wrote:
> On Sat, May 30, 2009 at 11:13:34PM +0200, Koen Kooi wrote:
>> On 30-05-09 21:13, Tom Rini wrote:
>>> On Fri, May 22, 2009 at 10:31:43PM -0700, Tom Rini wrote:
>>>> On Sat, May 23, 2009 at 07:22:56AM +0200, Koen Kooi wrote:
>>>>> On 23-05-09 00:27, Andrea Adami wrote:
>>>>>> I think the side-effects of the patch are blessing too much...
>>>>>
>>>>> That's called 'incentive' :) You are always complaining about
>>>>> unmaintained kernel recipes, now you have a way to identify them :)
>>>>>
>>>>>> I'd propose a rethink of the patch as opt-in.
>>>>>
>>>>> Due to the way OE is structured, that's sadly impossible.
>>>>
>>>> Can we please get a little write-up on the new variable on the wiki, to
>>>> point people at when they hit a broken recipe.
>>>
>>> Ping.
>>
>> You lack write permissions in the wiki? Or do you lack write permissions
>> to the usermanual?
>
> I lack complete understanding of the When To

Always

> and a short summary of What This Does.

This makes external modules and kernel dependant userspace actually work 
if you use a package manager and/or incremental OE builds. Without it 
you rely on sheer luck to keep those working.

regards,

Koen



