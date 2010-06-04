Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OKaoL-0005Vf-Jw
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 19:36:03 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OKakB-0001MP-Dr from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:31:43 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 4 Jun 2010 10:31:42 -0700
Received: from [172.30.80.93] ([172.30.80.93]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Jun 2010 11:31:41 -0600
Message-ID: <4C093879.7020109@mentor.com>
Date: Fri, 04 Jun 2010 10:31:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikyR0VhEu_Ex4JcaJ1bDHLK2Rh6NyVF801VtlVy@mail.gmail.com>
	<AANLkTimKfsHgJIGlyzsX9tneLob9uyQo5riVZ5mbxqQj@mail.gmail.com>
In-Reply-To: <AANLkTimKfsHgJIGlyzsX9tneLob9uyQo5riVZ5mbxqQj@mail.gmail.com>
X-OriginalArrivalTime: 04 Jun 2010 17:31:42.0102 (UTC)
	FILETIME=[CBD42360:01CB040B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Fri, 04 Jun 2010 17:36:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> On Fri, Jun 4, 2010 at 5:52 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
> 
>> Apologies for not replying to the original message, but that one is
>> already deleted.
>>
>> Just bumped into this after doing a pull.
>>
>> A few comments:
>>
>> I would suggest if doing something like this that it is announced
>> somewhat more explictly so people are well aware of it. Since it was
>> brought as a patch it escaped my attention, and in fact it is not only
>> a patch but also a change of policy.
>>
> 
> Personally, I'd think people should always read any patches to the main
> classes, including patch.bbclass.  Any change to a core class or config file
> has the potential for large impact, and it would benefit everyone to be
> aware of those things.
> 
> That said, I'll be sure to send out an RFC to try to draw more attention to
> it next time around.
> 
> 
>> Also I'd like to suggest to complete the change by also updating the
>> manual, otherwise this could become confusing.
>>
> 
> Yes, I know, I intended (and still do intend) to update the manual, but
> haven't gotten to it yet.  I apologize for the delay.

Maybe we should start saying "no changing how stuff is documented 
WITHOUT changing the documentation".  It's not like we keep the docs in 
some hard to edit format and I think other projects work the same way.

-- 
Tom Rini
Mentor Graphics Corporation


