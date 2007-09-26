Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1IaZOW-0007JA-43
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2007 18:05:48 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 831C3390004;
	Wed, 26 Sep 2007 18:01:16 +0200 (CEST)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 3CA50AD4001;
	Wed, 26 Sep 2007 18:01:16 +0200 (CEST)
Received: from ip6-localhost (unknown [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id 894F7D98DA0;
	Wed, 26 Sep 2007 18:01:15 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: "Hans Henry von Tresckow" <hvontres@gmail.com>
Date: Wed, 26 Sep 2007 18:01:12 +0200
User-Agent: KMail/1.9.7
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<200709260921.20447.u.luckas@road.de>
	<a7f8874a0709260729n9e4a06cy67456d4937a6dbdf@mail.gmail.com>
In-Reply-To: <a7f8874a0709260729n9e4a06cy67456d4937a6dbdf@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200709261801.13349.u.luckas@road.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Kexec Cmdline Support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2007 16:05:49 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday, 26. September 2007, you wrote:
> On 9/26/07, Uli Luckas <u.luckas@road.de> wrote:
> > By the way, who is the original author of the arm-kexec-utils patch? I'd
> > like
> > to see kexec support pushed upstream which requires a sign-off of the
> > original author.
> >
>
> IIRC, Richard Purdie wrote the original kexec patch for arm. I would love
> to try out your solution. Do you know which version of the vanilla kernel
> now has the proper patches in place?
I use kexec with 2.6.21.

> I would most likely need to do some tweaking, since the original sharp
> bootloader passes a cmdline that is incompatible with 2.6 kernels. 
For now you might have to modify the hard coded base address.

> But I would love to see some support for kexec cmdline editing in the near
> future. 
>
> Henry von Tresckow (hvontres)

Thanks,
Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit


