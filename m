Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrbyO-0006Pf-RZ
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 19:54:17 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090408175059.DYZY16134.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Apr 2009 13:50:59 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id d5qv1b00E4dMFYL035qwYT; Wed, 08 Apr 2009 13:50:58 -0400
X-Authority-Analysis: v=1.0 c=1 a=3yNiNCsWiaUA:10 a=w5m77Bwnh3kA:10
	a=4o1OIT2LM5owfyoeykkA:9 a=P-43RA1TrqUqycDMWqLra7TYdhEA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 8 Apr 2009 10:50:55 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090408175055.GM2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
	<gric5v$qc4$1@ger.gmane.org>
	<d2b9ea600904080952g656823dby8c15a46b425f76c6@mail.gmail.com>
	<49DCE11F.90903@balister.org>
MIME-Version: 1.0
In-Reply-To: <49DCE11F.90903@balister.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 17:54:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2009 at 01:38:39PM -0400, Philip Balister wrote:
> Esben Haabendal wrote:
>> On Wed, Apr 8, 2009 at 4:26 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> On 08-04-09 16:16, Esben Haabendal wrote:
>>>
>>>> Then, please someone apply this to .dev.  But then how are we supposed
>>>> to remember which patches should also be moved to stable, and when?
>>> If you want something in stable, you send the patch to this mailinglist with
>>> [STABLE] in the subject.
>>
>> Which is exactly what I did.  Now 3 times even.
>
> I suspect the problem is most of the people interested in stable do not  
> know what this patch does. I admit to skimming over things that look  
> like patches to pieces of OE that I know little about.
>
> Still, we need a way to get this sort of thing into stable, even when it  
> is outside the scope of most of the reviewers.

Hang on.  I (the guy signed up to own this part of stable) have reviewed
it each time.  The problem is there's been both general little problems
and Esben has wanted the patch to go in both trees at once, which isn't
how I understand Stable to work.

My plan right now is to fixup the still minor problems in v3 and post
for stable momentarily.

-- 
Tom Rini


