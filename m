Received: from [209.85.220.218] (helo=mail-fx0-f218.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1McbzK-0008N2-WB
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 11:25:20 +0200
Received: by fxm18 with SMTP id 18so1859879fxm.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bMy/DUVG0t3XjVNtzqsKCW7QEOxspF8f3GwqJZa8JAw=;
	b=k/n47OsTm02+b0DwSbxkVfT2+mO75efIGfZXoWqT4OPCgBrBKN7e5XiOWA4wo8Tww3
	0UNKJ4myUnKarYfYVLAWwzlCH7GSL434qlipBnJAE26h+QlAEMGGql6vI3KI9dsfwvd2
	DwJZ8rpNtW32WxnsemSoTj+wgi5q9qlT04T4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OrQCufJLL4558axC4tBT/XwyL4U+qg1EQD4/yrBErQhNHKmrie58vIzjhWE7nQJaGY
	arvDPMEDww0MCMdyakHaOyOZ6oYMKw4KWUEGe5gZqUwdf1It3mJBJnLUDyNNjTwjcywQ
	Q9p53+ziyKu0Bsr1Pk7UPoJN93ipvj5fdLl4k=
MIME-Version: 1.0
Received: by 10.204.162.143 with SMTP id v15mr2011176bkx.50.1250413707317; 
	Sun, 16 Aug 2009 02:08:27 -0700 (PDT)
In-Reply-To: <200908161058.24331.holger+oe@freyther.de>
References: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
	<200908161025.38803.holger+oe@freyther.de>
	<800a98740908160136r20a4c7ceqa5e55817d782ff53@mail.gmail.com>
	<200908161058.24331.holger+oe@freyther.de>
Date: Sun, 16 Aug 2009 12:08:27 +0300
Message-ID: <800a98740908160208n3b8db293i7d8f94309f8d7010@mail.gmail.com>
From: Ilya Petrov <ilya.muromec@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	OpenEzx <openezx-devel@lists.openezx.org>
Subject: Re: [patch] add 18 bpp support to psplash
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
X-List-Received-Date: Sun, 16 Aug 2009 09:25:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2009/8/16 Holger Hans Peter Freyther <holger+oe@freyther.de>:

> How did you determine this? Is your mail to the maintainer unanswered? Just
> because applying a patch is so easy it is no excuse to turn OE into a
> collection of forks.

ok. i`l first send this unpstream


-- 
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


