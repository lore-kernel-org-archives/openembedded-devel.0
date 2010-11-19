Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PJRJB-0003oD-Vk
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 14:47:22 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PJRI4-0005g6-J4 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:46:12 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 19 Nov 2010 05:46:11 -0800
Received: from [172.30.6.141] ([172.30.6.141]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Nov 2010 06:46:11 -0700
Message-ID: <4CE67FA1.6020901@mentor.com>
Date: Fri, 19 Nov 2010 06:46:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
	<ic5jrc$ksc$1@dough.gmane.org>
In-Reply-To: <ic5jrc$ksc$1@dough.gmane.org>
X-OriginalArrivalTime: 19 Nov 2010 13:46:11.0251 (UTC)
	FILETIME=[20362030:01CB87F0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 13:47:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2010 03:34 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-11-10 22:27, Khem Raj wrote:
>> Hello all,
>>
>> The work branch for upcoming 2010.12 release has been created.
>
> Why was this created? We were *very* clear at OEDEM that there would be
> no branch, only a tag.
>
> Why was this changed? I only see some vague handwaving from the TSC
> (well, from Phil, saying it was the TSC) who didn't consult the OE
> developers at all.
>
> The whole point of releases was that they are based of a tag from .dev,
> not some random branch. Again, why was that changed?

At least for making a release tag exist, if we can't have a freeze on 
.dev (or otherwise an agreement that .dev should focus on making the 
testing packages build and work, over new work) making a temporary 
branch to cherry-pick into seems to be the next possible solution. 
Otherwise the release tag is just another testing tag...

-- 
Tom Rini
Mentor Graphics Corporation


