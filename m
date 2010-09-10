Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou8go-0008MI-5h
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:51:11 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J0070VOBG7CC8@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 13:50:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 50C1414AF60; Fri,
	10 Sep 2010 14:50:04 -0400 (EDT)
Date: Fri, 10 Sep 2010 14:50:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910185004.GF28148@denix.org>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
	<4C88EC2B.2090208@balister.org>
MIME-version: 1.0
In-reply-to: <4C88EC2B.2090208@balister.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 18:51:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 09, 2010 at 10:16:11AM -0400, Philip Balister wrote:
> On 09/09/2010 10:06 AM, Chris Larson wrote:
>> On Thu, Sep 9, 2010 at 3:11 AM, Frans Meulenbroeks<
>> fransmeulenbroeks@gmail.com>  wrote:
>>
>>> Signed-off-by: Chase Maupin<chase.maupin@ti.com>
>>> Acked-by: Denys Dmytriyenko<denys@ti.com>
>>> Acked-by: Koen Kooi<k-kooi@ti.com>
>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>
>>> I would suggest modifying the commit policy disallowing these kind of
>>> things, saying the two Ack's must be from two developers not
>>> affiliated with the same company.
>>>
>>
>> I'd agree with this quite strongly.  I'm generally pretty careful to let
>> others review the changes from my coworkers, to avoid any bias.

Chris,

Not to point any fingers, but mishaps happen and numerous reverts would be a 
living proof of that in the repository... :) Nobody's perfect.

> This would be a good topic for OEDEM.
>
> For the record, I am really happy to see the .com people actively 
> participating in the the OE project. I am also glad that they are pushing 
> stuff into .dev and not keeping it in private repositories. This is a very 
> good thing.

As I just replied to Frans' post in this thread - as a company, we are trying 
to follow review procedures closely and give enough time for feedback on the 
patches. I personally would like to apologize for the misunderstanding and 
promise to do a better job in the future.

As an active OE e.V. member on the other hand, I'm all in favor of this 
modification to the commit policy, as long as there is time limit on review 
period and if there are no strong objections, it can be pushed even if only 
acked by the same company. Let's discuss it further and vote at OEDEM.

-- 
Denys


