Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ob8lb-0005nk-Qp
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 11:05:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2632450fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=07xsZFA0K1qpgtB6fm8HgbSS6EnXI1SvMKrfPFUj04Q=;
	b=dwA1+rgRhhu1LYxAoLZZ6PPLkWs8UKWTdHQ1o6DiHMuMqcymbZzOV31PRMxiPVjUkd
	hSiiFeGxZpIrcRbP3WcJ0AJkV4RhKT4rNfcA7XQ288d9LEhn8qg6432JNQK0XrX96a7f
	izwFh7uoUzJd+J+aU+4g3gksu4w0gBz5Q6B+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hYcYL4etUQGirQ2ezm1igieRfrVVUlKsZ+irRbBoJN6+9xiy9LcMqC7MuoDMQHFIxe
	BMjwsH4iIwiiXEoMW1K/ZOGcqChVwpkEr5XOSVLMvX0JrmVOXfKrSCzYiEp1hJxB6jaU
	Q9K4/Rj+MFWqmmtpkPIeFV9RIWoaw7yvaoIis=
MIME-Version: 1.0
Received: by 10.223.117.20 with SMTP id o20mr4960175faq.55.1279616728510; Tue, 
	20 Jul 2010 02:05:28 -0700 (PDT)
Received: by 10.223.117.75 with HTTP; Tue, 20 Jul 2010 02:05:28 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1007182316140.8873@linux.fjfi.cvut.cz>
References: <alpine.LRH.2.00.1007182316140.8873@linux.fjfi.cvut.cz>
Date: Tue, 20 Jul 2010 11:05:28 +0200
Message-ID: <AANLkTimAvVCVUTPFDkAJrw0IlNveLRT7fOAyMAX2S1cY@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: base_do_compile() and GNUmakefile
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
X-List-Received-Date: Tue, 20 Jul 2010 09:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 18, 2010 at 11:24 PM, David Kozub <zub@linux.fjfi.cvut.cz> wrote:
> Hello,
>
> there was a patch for base.bbclass that made it accept GNUmakefile as a
> makefile. That patch was supposedly applied:
>
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06820.html
>
> Yet I don't seem to see it committed:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/base.bbclass#n351
>
> What branch was it committed to? Code somebody commit/merge it into
> org.openembedded.dev branch please?

Applied to org.openembedded.dev now. No idea where it was lost..


