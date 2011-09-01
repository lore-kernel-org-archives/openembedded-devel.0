Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qz4FO-000832-6m
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 12:11:46 +0200
Received: by vxj14 with SMTP id 14so1199400vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=R5lV4UBquS8EAMC+dSQv+QFcBgpWXrPksLWTQol2DEY=;
	b=Wkkj/N7kk8VTp7BcnUy95kKP+ltPQpv8nquU8CFU8nVtP0qalksUFGghG/xwsInopy
	AHRu0S/s+b/f9T0CEmw1ko+5qfpi7ZEYEg23WbLPXCqAH8hyMEPJICcKVSjkryNQpG3S
	nWjyQlbCqcK1QZ0ilZLK20bNGX3uHnfGNguP0=
MIME-Version: 1.0
Received: by 10.220.181.67 with SMTP id bx3mr5512vcb.195.1314871610261; Thu,
	01 Sep 2011 03:06:50 -0700 (PDT)
Received: by 10.220.188.65 with HTTP; Thu, 1 Sep 2011 03:06:48 -0700 (PDT)
In-Reply-To: <4E5EB734.7070802@balister.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
	<j3lad2$v75$2@dough.gmane.org>
	<CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>
	<j3ld1i$l0g$1@dough.gmane.org>
	<CAP9ODKpupMXbfao42zScW4aJB2X0FHwEzBBDyMH_mdCyqYAJaw@mail.gmail.com>
	<4E5EB734.7070802@balister.org>
Date: Thu, 1 Sep 2011 12:06:48 +0200
Message-ID: <CACW_hTZSavmJbieeL1Wth1rVAm2SdqH5C0kD5Qoq7-9KQRMKcg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Thu, 01 Sep 2011 10:11:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/9/1 Philip Balister <philip@balister.org>

> On 08/31/2011 06:43 AM, Otavio Salvador wrote:
>
>> On Wed, Aug 31, 2011 at 10:30, Koen Kooi<koen@dominion.thruhere.**net<koen@dominion.thruhere.net>>
>>  wrote:
>>
>>> Besides, this is also on the policy
>>>>
>>>
>>> The OE classic policy maybe, not on the meta-oe policy[1].
>>>
>>
>> ETOOMANYPOLICIES
>>
>>  so or you change the policy or you follow it. Otherwise makes no sense to
>>>> have a policy if the person who merge the patches do not follow it.
>>>>
>>>
>>> - From http://wiki.openembedded.org/**index.php/Category:Policy<http://wiki.openembedded.org/index.php/Category:Policy>I read:
>>>
>>> http://wiki.openembedded.org/**index.php/Commit_Patch_**
>>> Message_Guidelines<http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines>
>>> http://wiki.openembedded.org/**index.php/Commit_Policy<http://wiki.openembedded.org/index.php/Commit_Policy>
>>> http://wiki.openembedded.org/**index.php/Commit_log_example<http://wiki.openembedded.org/index.php/Commit_log_example>
>>> http://wiki.openembedded.org/**index.php/Styleguide<http://wiki.openembedded.org/index.php/Styleguide>
>>> http://wiki.openembedded.org/**index.php/Versioning_Policy<http://wiki.openembedded.org/index.php/Versioning_Policy>
>>>
>>> And none of those say PR = r0 is wanted behaviour. OTOH it doesn't say
>>> it's
>>> unwanted either.
>>>
>>
>> So until it is explicit we might keep PR = r0 as it seems most people
>> prefer this way.
>>
>
> As long as we are all chiming in, I would like to see all of us decide once
> and for all what to do.
>
> I also prefer the explicitly setting PR = "r0". Can we work out the
> troublesome cases and see if we can get them fixed? Also, what is the
> oe-core view on this?
>
> Let's work out what the technical answer is and go from there


Good plan.

BTW not sure if it is feasible but ideally a 2nd assingment to a var should
give an error (or at least a warning). This avoids that e.g. a recipe and a
.inc file set the var (or that a var is set twice within the same recipe, in
the past I have seen this). If a variable is intended to be reassigned, weak
binding should be used. ( ?= or so).

Frans

