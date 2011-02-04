Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.tqvist@gmail.com>) id 1PlLrc-0000FD-O0
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:38:16 +0100
Received: by iwn8 with SMTP id 8so2182084iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 05:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=11LTAg+BLhSERnWDR/0V/hzyyyWigirNyEKBL/BXnEs=;
	b=GNykRmYFZYFPaU9RpSlHXI8zHXyvDLRYRavfXavhr5N+8QMF5/RedyzMYRwwsFW8Ky
	Lr8E2wfEF2Qn3ExnLAKi4FSOXwtZGSDAZzpntRW8rKUhzIlo2poS0aWAlxC4jxqLe87Y
	zfqvMoaQ4PconsCoriirZyBJ6WNbCoUTXCqDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YLoVVBRJIkYNOvFPZFbIw5V/uUVk2c0mckvcDUVcNLQ/RzVMDCBKYBTEtFgzDSsop/
	cMmyNery77p2lY89Dhms3Nbs4rUjfNKbpKam1NL6UsydWcuDDrAfeJhMrmgYpPPgzej0
	O3YQMsuxhEAw6V2JF5NKypEn1wY52l9LlUhkk=
MIME-Version: 1.0
Received: by 10.231.199.10 with SMTP id eq10mr12990613ibb.112.1296826638345;
	Fri, 04 Feb 2011 05:37:18 -0800 (PST)
Received: by 10.231.30.135 with HTTP; Fri, 4 Feb 2011 05:37:18 -0800 (PST)
In-Reply-To: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
Date: Fri, 4 Feb 2011 14:37:18 +0100
Message-ID: <AANLkTi==esXejD-tuPpKQxk6dR2UmVGBSiHwtYV_5QtC@mail.gmail.com>
From: =?ISO-8859-1?Q?Anders_T=F6rnqvist?= <a.tqvist@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 13:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

These nice testing results, what are they?
Results from the oestats server of all the successful builds?

/Anders


2011/2/4 Cliff Brake <cliff.brake@gmail.com>

> master has been merged to testing-next and is ready for clean builds.
>
> I realize I've been tardy in getting the testing-next going, so I'm
> going to create a cron job now that does that weekly.
>
> Last week's testing results:
>
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-28
>
> For more information on OE testing, see:
>
> http://www.openembedded.org/index.php/Testing
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

