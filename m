Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYGHO-0008O5-SI
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:58:17 +0100
Received: by gxk27 with SMTP id 27so923203gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=VklGZVFgmnsLjxvXOHFGS7jUq2K+/Jpb7njNyfsxbeU=;
	b=Fa3HvUyV13M369qTdpPneKtXNPZ2MNEFoASxoTeT0DiKbTizK124QZGpxpikt5X0bY
	RQe4r04QiDgmtUH9aX4Tz3xo/55+7qjwgEOc1s+tPFVg2BLokp55nemM1UeoGhbwUpSc
	FOlCEXY5a74bjax6hhucXDVnADdv0ArfJxeNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=XeiUPA++FDCgAi3MnhjdPUvODZR3fgAn0FW7rFHvRYkbeOkDx/RLVKG/XFVHuiU1NL
	F6AK/1Drq/aZ/awWzCu8gIVZW6xf+34kE1bkutKJIW/+qq085SADUziF72KPTJv8csh+
	YM9Z3LXHXPrLjR3SsJ8OkSNaCbDKPU406oyao=
Received: by 10.151.21.13 with SMTP id y13mr2218653ybi.133.1264154156784;
	Fri, 22 Jan 2010 01:55:56 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 5sm741845ywd.12.2010.01.22.01.55.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 01:55:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
	<201001221018.14750.holger+oe@freyther.de>
	<op.u6xf90fjmn1qzu@guohr-laptop-ubuntu>
	<201001221053.23630.holger+oe@freyther.de>
Date: Fri, 22 Jan 2010 17:55:46 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6xhu82gmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001221053.23630.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to generate files in site directory
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
X-List-Received-Date: Fri, 22 Jan 2010 09:58:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I will try my best and share my work as soon as I do

=E5=9C=A8 Fri, 22 Jan 2010 17:53:23 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Friday 22 January 2010 10:21:26 Guo Hongruan wrote:
>> It is what I want
>
> It is missing a lot of macros. I had hoped people would start copying =
the
> macro when they started to fill in new site-info entries... and I  =

> couldn't keep
> up with work and doing this... It would be nice if you could add one o=
r  =

> two
> macros to the mix.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


