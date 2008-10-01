Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Kl9R9-0003Qs-Lp
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 23:40:48 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081001213636.OVQX29505.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 1 Oct 2008 17:36:36 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id MZcb1a00B1E665w04ZcbQw; Wed, 01 Oct 2008 17:36:36 -0400
X-Authority-Analysis: v=1.0 c=1 a=nnTFpJXoFXnr55DqAAsA:9
	a=ba8-3uxP3yM7KltQpPhAUg_3l_AA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 1 Oct 2008 14:36:35 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081001213635.GF3010@smtp.west.cox.net>
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
	<gc017m$gq4$1@ger.gmane.org> <48E39BC1.6080200@dls.net>
	<gc0bc5$o9o$2@ger.gmane.org>
	<20081001184353.GD3010@smtp.west.cox.net>
	<gc0lv9$46r$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gc0lv9$46r$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 21:40:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2008 at 10:18:49PM +0200, Koen Kooi wrote:
> On 01-10-2008 20:43, Tom Rini wrote:
>> On Wed, Oct 01, 2008 at 07:17:57PM +0200, Koen Kooi wrote:
[snip]
>>> All org.openembedded.* branches are still being updated.
>>
>> So is the answer that the "master" branch in git it not planned on being
>> used?  Or it will have some other use, documented over in ... ?  It
>> sounds like the problem is that the policy on what to use in the git
>> tree isn't published yet.  Or it is, and someone didn't read it.
>
> The only supported way to use OE is via monotone, if you are using a  
> makefile that's using something else you are SOL

I'm not using a Makefile.  I'd just like to know what part of git I
should be look at checking out and attempting to work in, as the
transition is apparently imminent.  I'm assuming that once the
transition is complete, there'll be documentation saying "If you want
the dev branch, do ...", "If you want the stable branch, do ...".  Does
this type of documentation not yet exist?  Is there still some debate as
to if the git master branch will be the dev branch, or if the naming
scheme of org.openembedded.{dev,stable}, etc will continue?  Thanks.

-- 
Tom Rini


