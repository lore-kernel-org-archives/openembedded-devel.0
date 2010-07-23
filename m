Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcETb-0001Sj-Ue
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:23:35 +0200
Received: by bwz10 with SMTP id 10so1531596bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZZXkKBtLRB+xfHJ4kDGCKvw7Etqo8MrNf2GlwM+0qjA=;
	b=SGpsycagSglD4a4KiNEwR+5SjGDYnuNIX/24lZfQ39fcRmP3zsr5V1p3LR68n1T8ne
	q//r2r83ycb1/bTIA/c9G9EcHs4EG9hd6GLS7dfP4891YLHJ5IsxH8oZITZvuZSiNpqr
	x0zAHkjJcGdVTxXwMLQxkDTYa2dnB9fd1CnCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WgZPHZsz5Uh/I2SSW4Q6z/IzrsDhrke4E7JFaHbHfOlriujGhY/iPCARyJz2TGMTSL
	FqOyUoNe59DN5sDQqcwQEL8eg9zFXLqYmY23978Dnk91tC0qrt5HiHFmfLPRF1bNRA7a
	3HP5vZNcarEvjn0CiXvTEPOUQDRN3HCSTu/3Q=
MIME-Version: 1.0
Received: by 10.204.162.207 with SMTP id w15mr2287278bkx.63.1279877001369; 
	Fri, 23 Jul 2010 02:23:21 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 23 Jul 2010 02:23:21 -0700 (PDT)
In-Reply-To: <59B9E304-2B14-4D9F-80F7-8AB7A234D404@vanille-media.de>
References: <201007230134.59343.david.lanzendoerfer@o2s.ch>
	<59B9E304-2B14-4D9F-80F7-8AB7A234D404@vanille-media.de>
Date: Fri, 23 Jul 2010 11:23:21 +0200
Message-ID: <AANLkTinjBZ6TOcDYvoeeAbqKjA19Roh6XQwvg9=u006s@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Adding maxima recipe (tool for algebraic calculation)
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
X-List-Received-Date: Fri, 23 Jul 2010 09:23:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/23 Dr. Michael Lauer <mickey@vanille-media.de>

> > +DESCRIPTION="Free computer algebra environment based on Macsyma"
> > +HOMEPAGE="http://maxima.sourceforge.net/"
> > +SRC_URI="http://www.sfr-fresh.com/unix/misc/${P}.tar.gz<http://www.sfr-fresh.com/unix/misc/$%7BP%7D.tar.gz>
> "
> > +LICENSE="GPLv2"
>
> Whitespace, please.
>
> Thanks.
>
> Mssed that one, but yes, you are right. For the author, Mickey means having
spaces around the =

Linebreaks also crossed my mind, but frankly speaking I'm not too sure about
the policy there.
Also typically LICENSE is before SRC_URI (that should be fixed too)

Frans

