Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N5qR0-0002RW-KT
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 01:42:45 +0100
Received: by iwn28 with SMTP id 28so5602920iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 16:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=KJgl6Ks0bvXjj9WyB9PQM6lQfW3Hx1/Yi2zAq1Nyq0A=;
	b=nfQALp/eI2amWoOXEsgcGm+xfk3L4a/m2YVrGZvOv/uFSUCpoy1Ie5cwR1gTdt13Pe
	h4TyoohVPOph75DQi2ZqnnOH5yPrMfORZyqO+UYeiThRqfKpszG30WDJLCf9B3znHzUU
	BBfqO+9QP8cLspjg5emVcLOpMphiUun5p4gfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=qAGT+V4mednO1RW1BiNiuQYTVc2eZDQKXDZN032gYqTIWJIZQc8rVWbO2fqE/IhGx7
	KuzZaQGrtTWzlIaAYT3ALdt17lZUnAjNumUd/jxvuHOdvOYjctsGVCHidIm6JHvYTNYR
	t619eVe6zdMXSt/TQuj3lkSHI8EKAcKBewIBs=
MIME-Version: 1.0
Received: by 10.231.157.131 with SMTP id b3mr2056849ibx.19.1257381689247; Wed, 
	04 Nov 2009 16:41:29 -0800 (PST)
In-Reply-To: <1257202693.10804.54.camel@dax.rpnet.com>
References: <4AEDB624.3030607@balister.org>
	<1257202693.10804.54.camel@dax.rpnet.com>
Date: Wed, 4 Nov 2009 16:41:29 -0800
Message-ID: <19c1b8a90911041641w4b7397d3o8a96853600d0cb4e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
Subject: Re: OEDEM next weekend
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
X-List-Received-Date: Thu, 05 Nov 2009 00:42:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2009 at 2:58 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2009-11-01 at 11:24 -0500, Philip Balister wrote:
>> This has been mentioned here before, but I want to remind people that
>> OEDEM (Openembedded Developers European Meeting) is next weekend in
>> Cambridge, UK. There is a information and an agenda at:
>>
>> http://wiki.openembedded.net/index.php/Oedem/2009
>>
>> Note that registration is closed, but you can talk to Phil in case there
>> are last minute dropouts.
>>
>> If you can't make it, but have any ideas or comments, please talk to one
>> of the attendees or send us in email so we can collect everyones ideas.
>
> I'd like to second this. If you can't be there but want a viewpoint
> represented, please do talk to the attendees.
>
> I just added "BitBake Future Roadmap" and "OE Core Changes" to the
> agenda and will happily takes ideas on those topics if anyone has any
> proposals.
>
> Are there any topics anyone feels are missing from the agenda?

Support for plugging external toolchains
Using SDK for building OE instead of internal toolchains.

come to mind

Thanks

-Khem

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


