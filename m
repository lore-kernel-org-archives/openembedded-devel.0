Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nf779-00023h-Ky
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 08:36:02 +0100
Received: by ywh42 with SMTP id 42so6856205ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=yfP1Dt8BYwqtPXM93Ga+2qtjX+NP4zLhNqW67y4Jbso=;
	b=GMHbGPPeF+YTUDpgcE2w5G0fhLBCVm2xE/w+KAPpTPBjANBqNnBxpuCXmDeq9oFieA
	sKioZYVfJhX55UfaEZIEjctw2vCle0a6QvxP6Zcwqe9mKy6uNnC2XiBurBF0JGfQ8pIw
	mSbETOmMbY9NNn43OVYK9QFNlNTXWiwTCuR6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EXPcYMzz54doe57K4EAS7lVlJ4Sg4zUqH59ueIKGO/2PTMs0bbAYDDyntW/a/lOdfC
	YazO8xVYn8Cp33hV7bZe+osxGapGb5xH/mb7EqP9J/z4EMZmFc8Cl+rQ1nokdFLtWpww
	i8vr2HSeICoAew6SlfHMD1eMyDVK6RvqX6JDg=
MIME-Version: 1.0
Received: by 10.101.198.37 with SMTP id a37mr2287598anq.11.1265787205568; Tue, 
	09 Feb 2010 23:33:25 -0800 (PST)
In-Reply-To: <20100210072033.GF1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
Date: Wed, 10 Feb 2010 08:33:25 +0100
Message-ID: <ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.204
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Wed, 10 Feb 2010 07:36:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/10 Ruud Althuizen <ruud@il.fontys.nl>:
> Hello,
>
> On Wed 03 Feb 2010 12:16 PM, Ruud Althuizen wrote:
>> On Wed 03 Feb 2010 12:07 PM, Paul Menzel wrote:
>> > Am Mittwoch, den 03.02.2010, 11:48 +0100 schrieb Ruud Althuizen:
>> > > In the attached patches there is a machine config and kernel recipe for the
>> > > LPC3250 based Embedded Artists development board.
>> > >
>> > > If you have any suggestions for the attached patches, please give them so I
>> > > can fix it.
>> >
>> > Please attach them. ;-)
>> Ah, now I remember that mutt discards attachments when forwarding :/.
> So, it's been a week now. And not even an reply. Any chance of this getting
> into the dev tree?
>
> --
> Kind regards,
> Ruud Althuizen

I just skimmed over it.
First impression is ok, and as this will not break anything else, I
have no problems getting it added.

Acked-By: fransmeulenbroeks@gmail.com


