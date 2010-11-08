Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PFaxe-0000WV-W0
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 00:17:15 +0100
Received: by ewy2 with SMTP id 2so3143316ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=OtDrVPqGw6MtjZgA6AZhOn8gSTzUhWf2gbKewj4J8JA=;
	b=Uc4VvwdSoBXeBHpqlMXFZTpoBePCQfG42sQZStc0I98ZxnyksQ3tsbcJIZ9jL3mFwD
	1oVnG1xRtXfLFmANf9ZJ+OG18Qub5eRm3znsWp5t5KL7JikOHuqOh3sdXEXJ8l2iHvlS
	JSvksxmKt1ewdlRzTtaYwHxeO9HXK127ZOZ54=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YKU/ji68dFkpfgxe5gJM+0m1fmbViOxTm5PxddhdFgTR4TE3BPjBnw2X9tjEqH9Xge
	fFFBZ2yPq6i6yVfnVYxmGTvWx9n0XvzHzlOF5Nd6ZOCmDg9nFYRbJ/7B2Bfmwc+693Xc
	OetGahSeR40JqQVZ/RrMvu2Y9sKEs2HVOsENo=
MIME-Version: 1.0
Received: by 10.216.62.140 with SMTP id y12mr5528997wec.100.1289258179295;
	Mon, 08 Nov 2010 15:16:19 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Mon, 8 Nov 2010 15:16:19 -0800 (PST)
In-Reply-To: <AANLkTi=hBHFcAJNWr2=Z=51J=rOZ8Cf_+KGyvQiFFdKN@mail.gmail.com>
References: <AANLkTi=hBHFcAJNWr2=Z=51J=rOZ8Cf_+KGyvQiFFdKN@mail.gmail.com>
Date: Tue, 9 Nov 2010 00:16:19 +0100
Message-ID: <AANLkTikkc1uD+dKSH8ZoAujqepiWv1knzXFQjAvU23cN@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: image.bbclass adding unconditionally glibc-localedata
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
X-List-Received-Date: Mon, 08 Nov 2010 23:17:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Fixed by Commit: 0ad93ec8b5042894408078be53c39c4be768a49c

thanks Chris

Andrea


