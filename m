Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Kl6k3-0000fU-BS
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 20:48:07 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081001184356.VUBX6175.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 1 Oct 2008 14:43:56 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id MWju1a0021E665w03WjuUb; Wed, 01 Oct 2008 14:43:56 -0400
X-Authority-Analysis: v=1.0 c=1 a=QRXn24UNWUWkOPM5b7cA:9
	a=B0NSJOHO_KmjCo7JMl-4NNBw1dYA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 1 Oct 2008 11:43:53 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081001184353.GD3010@smtp.west.cox.net>
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
	<gc017m$gq4$1@ger.gmane.org> <48E39BC1.6080200@dls.net>
	<gc0bc5$o9o$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gc0bc5$o9o$2@ger.gmane.org>
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
X-List-Received-Date: Wed, 01 Oct 2008 18:48:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2008 at 07:17:57PM +0200, Koen Kooi wrote:
> On 01-10-2008 17:48, Mike (mwester) wrote:
>> Koen Kooi wrote:
>>> On 01-10-2008 15:34, Nicola Mfb wrote:
>>>> 2008/10/1 Kalev Lember<kalev@smartlink.ee>
>>>> [...]
>>>>
>>>>> Well yes, but if you just do:
>>>>> git clone git://git.openembedded.net/org.openembedded.dev
>>>>>
>>>>> you'll end up on master branch, which is not updating.
>>>>
>>>> Yes, the same here, i opened one of those bugs.
>>>> I'm using a semiautomated makefile environment for fso/openmoko, this use
>>>> git and not monotone, so this problem affects a lot of peoples, please
>>>> fix!
>>> That's what you get for using makefiles....
>>
>> How does a makefile affect the branches not being updated?
>
> All org.openembedded.* branches are still being updated.

So is the answer that the "master" branch in git it not planned on being
used?  Or it will have some other use, documented over in ... ?  It
sounds like the problem is that the policy on what to use in the git
tree isn't published yet.  Or it is, and someone didn't read it.

-- 
Tom Rini


