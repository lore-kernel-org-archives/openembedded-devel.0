Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1Lp0RL-0001k3-Ja
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 15:25:11 +0200
Received: by bwz19 with SMTP id 19so39635bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ssnFo7WT4wHJp4IRQum+NM2ImD9QDW13/D0o3MndchM=;
	b=O/6tbiO0Z9GdG3GEa7V8ae0iFMZtqS8CQB7JiAPlj+4mi8C+ZryG3onjXG3jhEmN2E
	fZzfUqukGwij3+pJQe0WCQPb7UV5Ybv53gqnn4LdWxQyNvH+n0p0zoRKd9zF5Reue5CB
	OPSNKIZrAoFlmT+xvSot+fDmnvdQ1aBwLGBxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sTm8cXrVUGlhqobIzSC7zhgYJTCo7/tmJcZ4ft4AGOXp1RfKw2EbfCDu6JLkGnobff
	tzbkOt0MizgkGNuNRCsUcwX/uG7VdP4utampqcalwAB7+UGDzfTbjpMRhBN15JC3C+Nl
	XIM6X21sCjp2DNTyjDhLMFO4Ha5OsJD6lA9CQ=
MIME-Version: 1.0
Received: by 10.204.60.207 with SMTP id q15mr2795597bkh.72.1238592170093; Wed, 
	01 Apr 2009 06:22:50 -0700 (PDT)
In-Reply-To: <49D367D1.1050302@gmx.net>
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
	<49D28F41.1050005@gmx.net>
	<SNT105-W34EB74514DEB1FDC22CF26908B0@phx.gbl>
	<49D367D1.1050302@gmx.net>
Date: Wed, 1 Apr 2009 15:22:49 +0200
Message-ID: <b84dee3a0904010622r494b4f5bk262597848a5a43a8@mail.gmail.com>
From: Rafael Campos <methril@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Does your own system matter
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
X-List-Received-Date: Wed, 01 Apr 2009 13:25:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/4/1 Robert Schuster <theBohemian@gmx.net>:
> Hi,
>
> Mauri Sandberg schrieb:
>> Hi,
>>
>> I did not provide logs as my question was deliberately on more general l=
evel still as I wanted to know if there are some system setups what to avoi=
d etc. In the wiki page for stable/2009 (http://wiki.openembedded.net/index=
.php/Stable) it is mentioned that support for Ubuntu 8.10 is in TODO-list.
>>
>> I wanted to know what system setups people are using successfully. I tak=
e it that Ubuntu 8.10 is a bad choice at the moment. How about Ubuntu 7.10 =
or 7.04?
>>
> I am using Ubuntu 8.10 (x86) and Debian squeeze (amd64) for OE
> development. Works like a charm.
Ubuntu 8.10 (amd64) is not working properly.

I'm testnig now with 9.04 (beta)
>
> Regards
> Robert
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
___________
Rafael Campos
o0 Methril 0o
http://openblog.methril.net/


