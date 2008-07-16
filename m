Received: from [64.233.178.243] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KJDr6-0007OV-Qm
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2008 22:44:08 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1682012hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2008 13:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=kKHswFTAlg8gZ+O6bx9I576/P/7B09v3LGX0O5JOqx8=;
	b=c9dtPY44PXcR6jpADWiSwzmsWdsvUHy3t1qlVlp58DF03e4QQHnL8mIwT1BMnQ++fJ
	sGwWNrCM8dpMjX61JJfmpt3XMO9CdgKLgS40kAr9zRnvrcbSDbInXcn80QHywgW0YbvV
	2K9zqSYCzJCfv4LroyF9LLxsKveAR7d9OB/IU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=mq+uxWdfMNOh+XllP9vDBmq1CTilpTIl3HOomTAZ4CIx7XRHYu8uKiw7FxHmu5AE1N
	bUDjaX+bMCgUg4rkW28RbjPNtwSjc7FueowBBZNpV8T+58ZgF4w2PUoU6s3uAfR1+le1
	i3avs7QzQtmaMQMwObLWpK1KrXiHU29Qj02GU=
Received: by 10.100.167.14 with SMTP id p14mr2774654ane.121.1216241006745;
	Wed, 16 Jul 2008 13:43:26 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 16 Jul 2008 13:43:26 -0700 (PDT)
Message-ID: <c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
Date: Wed, 16 Jul 2008 22:43:26 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <487DACFF.5010504@gmail.com>
MIME-Version: 1.0
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 20:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Khem,

On Wed, Jul 16, 2008 at 10:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> I have not tested it on older compiler/library combinations but I think
>> it will work there too as I have build various combinations in the past
>> with same sequence outside OE.
>>
>> Comments and feedback is welcome.
>>

I will try some combinations over the next few days.

anyone: This would be a perfect candidate for some good testing
outside of .dev, what would be the best approach for that currently
besides the posted patch?

Excellent work by the way!

Regards,
-- 
Leon


