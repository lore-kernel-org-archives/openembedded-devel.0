Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1Np0Kw-00051Q-Q4
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 15:23:11 +0100
Received: by iwn4 with SMTP id 4so6461177iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=7S6zKQWC0uaQg2q15szq/QIRTL3ePqh0wyypyNIMqlI=;
	b=HycIB00tXsax3ctPBTFAMlBxwMGVEC/nJJgZ47sPt2oxslxBsBTN+dGCL6yFJs+WmQ
	CeVA13YtZxJ9/0bg7Ecn1c3vJxR5Cx1jzl8Jf0I7MZsHSrTSTUUzc1cJpOvqFMUpvHLp
	NBkxjxwH+tPjE3ZCXZ/ojp2qOhfgP5Cb5Y5tM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mqdh1+k4YC1S7TahiZvqPQlWcavp+poHVAgfoIN9y7FiRQY95q2X1mIupV39DD7WvE
	x++46oQ3tXvRlt5amEptslkKSAcq3qAXm8YBDPiyjAZDMRx5xJM1F0gJXNWkiHsAp40l
	s+KNr5asjHiTkE9zKZ46VA8iXpDROEnbB7T2g=
MIME-Version: 1.0
Received: by 10.231.174.140 with SMTP id t12mr20714ibz.89.1268144404396; Tue, 
	09 Mar 2010 06:20:04 -0800 (PST)
In-Reply-To: <25809.193.195.44.178.1268139137.squirrel@webmail12.pair.com>
References: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
	<25809.193.195.44.178.1268139137.squirrel@webmail12.pair.com>
Date: Tue, 9 Mar 2010 22:20:04 +0800
Message-ID: <f275a9df1003090620i4abb58b9ye07151c9b27f5533@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'bitbake opie-image' problem
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
X-List-Received-Date: Tue, 09 Mar 2010 14:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,
thanks for your kindly response and the effort!
can't wait to get it. :D

Thank you.
jiason
20100309


2010/3/9 Paul Eggleton:
> Jiason Li wrote:
>> I was trying to make some images followed the getting_started guide,
>> 'bitbake nano', 'bitbake console-image' all succeeded,
>> but soon I encountered problem when doing 'bitbake opie-image'.
>>
>> Do you have any idea about this issue?
>
> This is due to libopkg's C headers having changed recently. Not only has
> the API changed, but the headers are now uncompilable within a C++
> program. I am in the process of fixing this, hopefully I will have some
> patches done this evening.
>
> Cheers,
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


