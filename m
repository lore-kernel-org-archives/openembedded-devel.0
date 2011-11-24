Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RTVlH-0000Vl-AI
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 10:38:32 +0100
Received: by vbbfc21 with SMTP id fc21so929907vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 01:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=eZvOW95QK3/J7LZ59+nfVJqiiSl8EmUcSANc5nO4rok=;
	b=jkxvsta1BuQ/PZdwasonmpQRIHASvrn6LKZBubKkiPpgyJYIoM7zswxWoCknBdr9WX
	mWoWd0BTWeWS0EAdHiqJLL60FeGywgX/nS0spPo3JW2EmgRcq4H/w9u1voSLTsTGjb/T
	Ezw7YbCZrxc27GUl34KYNR0I0pwoyGL/QnOpA=
MIME-Version: 1.0
Received: by 10.52.97.35 with SMTP id dx3mr29340702vdb.2.1322127115167; Thu,
	24 Nov 2011 01:31:55 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Thu, 24 Nov 2011 01:31:55 -0800 (PST)
In-Reply-To: <jal1pc$2u7$1@dough.gmane.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
Date: Thu, 24 Nov 2011 10:31:55 +0100
Message-ID: <CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 09:38:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/24 Koen Kooi <koen@dominion.thruhere.net>

>
>
> OE .dev will go read-only soon, If you need an OE-classic setup,
> 2011.03-maintenance is there for you.
>

As stated before there are still people using .dev and committing to it
[1], and there are people interested in keeping it that way for a while.
So as it stands I suggest to keep it open for a while for those that still
are interested to use it.

People not interested in oe classic can safely ignore it, but I feel there
is no need to complicate the life of the people that for whatever reason
still need access and are interesting to commit to it.

Frans.

[1] http://cgit.openembedded.org/openembedded/log/

