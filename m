Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Paxrg-0001sW-CM
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 22:59:25 +0100
Received: by iwn8 with SMTP id 8so17105408iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=gyyk+FngU+YfniKzqfJOzzA06D0t+84KfhdTYj440JE=;
	b=bnVCAIU4sOXfFvJpYM6pIkpYhBFEm+Oq2CwVJJtzlNZpB6dXw3aN9V7CCvooJw6+CA
	9R8NGzk3DbGWoexRLiFssXXKf+yAev8w+Pf5Uge7dfute6nAbfP9OATlriNv3QfNgIF0
	Cd3vcF2whl0XjTXKoXIvl3Cd3hdiVlOvq4nGs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SuzHB86qKdZeYczb3lgG2ogFlv5eEYAfmcfv2/0xsODqQkZttKJ9rIO6dItiTQQqi7
	2E8BaYAPyDtGSzliiNzxyNH8jlrvrBmf/Ea9VCjlRQ8ARo6RRjdrWIH0uFJwtYXGk3RE
	A8pyPgYeg0TPqLsc5oOjFzwyqGuuoQxP9WTVw=
MIME-Version: 1.0
Received: by 10.231.37.70 with SMTP id w6mr14945595ibd.169.1294351139130; Thu,
	06 Jan 2011 13:58:59 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Thu, 6 Jan 2011 13:58:59 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Thu, 6 Jan 2011 13:58:59 -0800 (PST)
In-Reply-To: <AANLkTinX_54E9tkeE+5TKyMCQf-yGQRiD2ajUpQwBbQx@mail.gmail.com>
References: <1294347114-8645-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201101062204.33604.marcin@juszkiewicz.com.pl>
	<AANLkTinX_54E9tkeE+5TKyMCQf-yGQRiD2ajUpQwBbQx@mail.gmail.com>
Date: Thu, 6 Jan 2011 22:58:59 +0100
Message-ID: <AANLkTikGChm3UD_MRvnLVbnLf51UZwciCwgRuGuSnhXp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] kirkwood: move preferred kernel provider to linux
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
X-List-Received-Date: Thu, 06 Jan 2011 21:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2.6.37
I have committed the DP for that earlier today
Btw dockstar is already on the linux recipe

Frans

Op 2011 1 6 22:11 schreef "Marcin Juszkiewicz" <marcin@juszkiewicz.com.pl>:

Dnia czwartek, 6 stycznia 2011 o 21:51:54 Frans Meulenbroeks napisa=B3(a):


> I am not too sure if there are much other kirkwood users.
> If you are one, please verify if the ...
Please also mention which kernel version it will offer.

Regards,
--
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

