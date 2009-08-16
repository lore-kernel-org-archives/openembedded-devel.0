Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1Mcc6j-00006v-Vd
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 11:32:58 +0200
Received: by bwz17 with SMTP id 17so1741346bwz.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=13oA5KJNDeVOdwG9A8sAxYYisOZ102s++6CXqqPPwJw=;
	b=qRrWNLLgZw6hw9ti7+jNoKcq77LqsbzLYGYLOxeSPNxNjibCZln4ob84iNPYunFf78
	8I/eS30YJSIOItsKE85ue+xfWZJF7hakpFtSx1QI+/GqKPfhgAmP6iIbw+hQuHumiTdc
	D/2x0Ym+C/3B0TVdq3C2me06o66S2wdg2oRPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AsXGAbDF4dw8AunJ1oKnLzUtNqLOJ0+7JTV23YwPWBjONRv2JFlwXOHJ6Orpd/UDc+
	cstgMtEBxvtXkUfyaFvJj+j7CzSvY2q9ODOOhBFU8b464jdKnAGRRb0qcWkP0m3O3dNT
	RUZ+E6kTpydfoeCKaIH58pewl9ZuJKcgNnDWs=
MIME-Version: 1.0
Received: by 10.204.72.5 with SMTP id k5mr564900bkj.38.1250414166528; Sun, 16 
	Aug 2009 02:16:06 -0700 (PDT)
In-Reply-To: <200908161058.24331.holger+oe@freyther.de>
References: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
	<200908161025.38803.holger+oe@freyther.de>
	<800a98740908160136r20a4c7ceqa5e55817d782ff53@mail.gmail.com>
	<200908161058.24331.holger+oe@freyther.de>
Date: Sun, 16 Aug 2009 12:16:06 +0300
Message-ID: <800a98740908160216h56e13ac4g6e35768cc71c121a@mail.gmail.com>
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
X-List-Received-Date: Sun, 16 Aug 2009 09:32:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2009/8/16 Holger Hans Peter Freyther <holger+oe@freyther.de>:

> How did you determine this? Is your mail to the maintainer unanswered? Just
> because applying a patch is so easy it is no excuse to turn OE into a
> collection of forks.

well... the bug below is in "NEW" state from 2008-02-18 and bugzilla
dont even know about
psplash.

http://bugzilla.openedhand.com/show_bug.cgi?id=801

should i send my too?

-- 
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


