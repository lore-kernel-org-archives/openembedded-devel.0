Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N7U14-0004ls-84
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 14:10:45 +0100
Received: by fxm1 with SMTP id 1so995712fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 05:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=VJWZQUpb10NfqWiP5fNG2MyZ5Kz4U57c1jDABjLmRgo=;
	b=ExhyJovt/rJoP99zGBV9ufptsnxOguGbczf9EKpuUyJmWwYwf25UipSa/K1bgfeD0W
	CRyeZ3mNYduc0o28FXA4bPi44qu1MBAUUZ+TlAkwmKiIHNxa0xSiKE9tT5f6TDKfw2mJ
	+02/oQg4NmtYD3z2VXEuBo2IqUSB3a9MZMy88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=t4QjXvHGPA+VxLYTxubp9vNwgEPT3IfCpyYHjxsHYY3lmPEBDs1PNip/icaGL8WjDU
	9rM6F57qHRSoi2zn8Da8XWJJpijiZhyZ8cWVlkC+HMqKADS+wvuSW6lHU7ZM+YIjKp22
	GW2M6hduT1CUcywNXSem00/UxN7dapaDy5QnA=
MIME-Version: 1.0
Received: by 10.239.145.13 with SMTP id q13mr759887hba.125.1257771681017; Mon, 
	09 Nov 2009 05:01:21 -0800 (PST)
In-Reply-To: <be7a9f3d0911080422q13f8d4dj7c70da47f03ce9ba@mail.gmail.com>
References: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
	<be7a9f3d0911080422q13f8d4dj7c70da47f03ce9ba@mail.gmail.com>
Date: Mon, 9 Nov 2009 14:01:20 +0100
Message-ID: <c384c5ea0911090501k2d897b61jc5ebadcca510fe28@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Machines/users of squashfs 4.0 with lzma?
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
X-List-Received-Date: Mon, 09 Nov 2009 13:10:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Otavio, all,

On Sun, Nov 8, 2009 at 1:22 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Sat, Nov 7, 2009 at 11:03 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>>
>> As lzma support is now (almost!) landed upstream, I would like to see
>> what the impact is of moving to the upcoming 4.x release.
>
> I guess it is compatible with current squashfs available on 2.6.31
> right? In this case it is OK I guess.
>
That's what I'm not 100% sure about...

> Do you have a backport of the lzma support in kernel to 2.6.31?
>
Yes.

>> I have a patch on standby that moves from 4.0+patches to the current
>> SVN where lzma is built-in.
>
> Please do.
>
I'll submit it for review.

Regards,
-- 
Leon


