Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8nvR-0005OD-MR
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 07:42:54 +0200
Received: by ywl5 with SMTP id 5so2654598ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 22:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=X7oyD8S3u6JnGkWS/uiU067cgmVn0yp+DW02DN6bGx4=;
	b=ViIVr8N6lJ5NAwOp0LRK+jJzJw6FS1D5+05I6GsRxpc/Uww0FlGX7GPKzw2L+Nveun
	lZOCGqA92D9pzZTFpkZA7x8Te1P8knca9Hg5mFiXCRcCFn0X8ddyIXcCTPlxncgUYI9j
	q5rkgjEQoZcyIWc7lumUlTDP/TqxdAj5/4VX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=jFY5cVoU5KAE5h4QzojoGRfn+9oZWxXZYw0VQQFlF2Ym7GfjME7bWCI4z18YWEhNWl
	3J+G6mKqYQcc1GlxSczCqm4IDAAS1PNRqEEAEUHU3qxBRxwr6qLjmOApeqJX7gCyY9FQ
	aRc92pz5ZSfwgOpaNLBVyNqzqbMB6ORqFjfes=
Received: by 10.90.113.13 with SMTP id l13mr1055366agc.54.1287639733760; Wed,
	20 Oct 2010 22:42:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 20 Oct 2010 22:41:53 -0700 (PDT)
In-Reply-To: <AANLkTinjTE+9Ppy--CKhgZtfTrvZR65WuExevm1KhNQf@mail.gmail.com>
References: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
	<AANLkTinjTE+9Ppy--CKhgZtfTrvZR65WuExevm1KhNQf@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2010 22:41:53 -0700
Message-ID: <AANLkTinJJ52aEz4JNj21rJ6S6XyB7JQPkd2BQ1XU2A-F@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes
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
X-List-Received-Date: Thu, 21 Oct 2010 05:42:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 20, 2010 at 8:08 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> On Tue, Oct 19, 2010 at 12:11 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Could not easily reply to the message because it was so long (gmail
>> took ages) but:
>>
>> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Acked-by: Steve Sakoman <steve@sakoman.com>
>

Acked-by: Khem Raj <raj.khem@gmail.com>

> Steve
>
>
>> Ash, do you have commit access, or does someone needs to push this for you?
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


