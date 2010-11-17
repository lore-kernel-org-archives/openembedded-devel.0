Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PIlBv-0007Rp-N5
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 17:49:05 +0100
Received: by vws12 with SMTP id 12so1090566vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=IQAtOcLgoEUtXy2p8EFolWZlY4UxDOogwv/1TTlGeII=;
	b=pX3v+GPE76IE9jN2kYZDNkSAilt59cFCgrrwprHsdD+674v6y9TzDkDagBR5vrms2R
	m77aL2ycSL9USIcUGErB73eFDZ5gWvADY3zLOttD9dufqgiKrB0h2YzCfxYwz2LeJy81
	FRRq7u8w5tS9idDlO66wwfnmRpR6si8d4IJ0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e3mDIuYKNTFM70RuUDCT/Q5rsV7wofeOX92P1TLaLFjMYwOQ09YH9BPc7QGO3ngyMs
	Ln/YBkUHvd5usPUCXAYvA6Ln7M881cPJ+I1xklptv/TKXyXgH6GEEKXCkqy3BFi0BkKl
	ifEYF+nQA6QIWFyJUOvelADEwghNLHVSXE4ps=
MIME-Version: 1.0
Received: by 10.229.238.16 with SMTP id kq16mr7579540qcb.134.1290012475443;
	Wed, 17 Nov 2010 08:47:55 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Wed, 17 Nov 2010 08:47:54 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Wed, 17 Nov 2010 08:47:54 -0800 (PST)
In-Reply-To: <AANLkTi==WrNwoG_2u7zzb4V5hGc9Ctv2LYg8DLPv489p@mail.gmail.com>
References: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
	<1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTi==WrNwoG_2u7zzb4V5hGc9Ctv2LYg8DLPv489p@mail.gmail.com>
Date: Wed, 17 Nov 2010 17:47:54 +0100
Message-ID: <AANLkTikAtfH4woMaUn84Et_mPEb7VVWT0xaT3AG2PgV3@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 16:49:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Sorry for that!
Apparently I've accidentally sent a commit and not a patch. I will
follow-up.

On 17 Nov 2010 16:13, "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
wrote:

2010/11/17 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:

>    bitbake.conf: add ext4 image support
>
>    Signed-off-by: Bernhard Reutner-Fischer <rep.dot.no...
did you use git send-email?
The subject line is not ok.


>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f1dc0ff..b7ec8ad 100644
> --- a/conf...
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

