Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtkUY-00089p-JR
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:37:42 +0100
Received: by lahc1 with SMTP id c1so2319729lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Yfi54IpJgDdJWGwgUsrSxtUhyAoJlURJ2VVfjZtOHuM=;
	b=XbfkAATRrdK1YbULAaKNdcbTbW3WPeWYRxXGNzRwn3Sf0nSIrUR74I1BdKQYPBPGqm
	+oJfGVU/Y2Kk0pax6h7b7Nsix8gCMFfvSIrkdiQ2abLEmKzCPqXMWMbDtJt2FJF8d0Ez
	dijT6+rQnkHBbMFQar9ZIfTLweb7H7w5phbdM=
Received: by 10.152.123.68 with SMTP id ly4mr721841lab.13.1328380183331; Sat,
	04 Feb 2012 10:29:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 4 Feb 2012 10:29:13 -0800 (PST)
In-Reply-To: <4F2D77AE.7060505@promwad.com>
References: <4F2C6842.1040907@promwad.com>
	<20120204022129.GC26306@sakrah.homelinux.org>
	<4F2D77AE.7060505@promwad.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Feb 2012 10:29:13 -0800
Message-ID: <CAMKF1sqC2h+akQ63gXZLj6gv1pFot258iy-iW_Au2U6UdqevGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.a.kamble@intel.com
Subject: Re: Java: meta-java, meta-oracle-java
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
X-List-Received-Date: Sat, 04 Feb 2012 18:37:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 4, 2012 at 10:23 AM, Ivan Kuten <ivan.kuten@promwad.com> wrote:
> I meant isn't it going to be something like that in local.conf :
> PREFERRED_PROVIDER_virtual/java = "oracle-jre"
> PREFERRED_PROVIDER_virtual/java = "openjdk"
> in a single meta-java layer...

I think that would be sensible meta-java e.g. do provide
virtuals I hope oracle java layer does something same.
>
> Regards,
> Ivan
>
> On 02/04/2012 05:21 AM, Khem Raj wrote:
>> On (04/02/12 02:05), Ivan Kuten wrote:
>>> Hello,
>>>
>>> I noticed an activity around meta-java layer (OpenJDK based)
>>> https://github.com/woglinde/meta-java
>>> and recently around Oracle JRE: http://git.yoctoproject.org/cgit/cgit.cgi/meta-oracle-java/
>>>
>>> Any plans to combine or coordinate these efforts?
>> these are two different layers so they will exist. What coordination
>> would you like to see that will help you
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


