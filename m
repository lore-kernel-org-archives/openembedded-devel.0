Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCbq2-0001SS-O7
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 17:32:33 +0100
Received: by fxm8 with SMTP id 8so5938319fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 08:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AQtM1f8XEheHRl7HdfeEGKAuCaNInuwJqXyRgSUn3HM=;
	b=BXoGH4fp4beI/BtrsWSgsijA0xxuk/kKCb7iBWpZ+dte2fd1ivdHZMQhEaicltEfb6
	E0QsEk+E87J9oPp8jaFw2ty6SEKuTH0FbvfSyyEfxHPqwlgY6bUeIwJxOfhkquhIrJLE
	JWHbkAI/q707BUuAiGcgbfeX++CmOZb3tLrKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BFNTRRuQvE34JsuYIvNkVLJOobx1XtfhRLVnz95ZiA59xg0WIBgcGDUWtCP+RC/mdR
	BGA1i091D9TA1PZ5frLHEhcZW+ipgCdQO/78tQUG3qL1tV5IbFEK+eoJGSwlZEqdYwiN
	Hki+3YazUrGM+evtQMCNOpMleUlHet/F+ehdo=
MIME-Version: 1.0
Received: by 10.239.179.98 with SMTP id c34mr556471hbg.17.1258993862438; Mon, 
	23 Nov 2009 08:31:02 -0800 (PST)
In-Reply-To: <1258645184.5229.46.camel@dax.rpnet.com>
References: <1258645184.5229.46.camel@dax.rpnet.com>
Date: Mon, 23 Nov 2009 17:31:02 +0100
Message-ID: <c384c5ea0911230831x44589834ga3fce8c59d29a45d@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE.dev staging changes - Progress so far
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
X-List-Received-Date: Mon, 23 Nov 2009 16:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 19, 2009 at 4:39 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> d) Start removing legacy do_stage functions and convert exclusively to
> =A0 the new model
>
> Not really started yet. Poky has now converted all of its recipes to the
> new model and has no legacy staging however so there are plenty of
> examples out there.
>
Where is this work happening (branch?) and who is expected to work on this?

I would especially see the toolchain bits up-to-date, and would like
to help, but this will certainly introduce breakage at some point.


Regards,
--=20
Leon


