Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OTM06-0008Ov-Qs
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 23:36:23 +0200
Received: by gwaa12 with SMTP id a12so1662452gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 14:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=O/pK0m1TsviaxkDUo2rkR5fItNx9k2mr7OqBmOAdCvw=;
	b=PMQJEmKQTgdE00F1b/7luhIXb8sxY0U/XOcHB3eTMCk167p3b5Yc5o5gr4MghANGAn
	F8o6SANouJHf3faIz1zzo0q9S0kQTQ0bODg99ON++C1vOJLEaln3OnmFNtE+KYRA5Fi3
	r41V+ExnPyLXEPk07DAcv9wWGdNot4pnFnndI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p0l1tWpHfReQKcwIqIx4VuJ+rbEbhKL1GqR9yl5ca8iKZAeKC1s90eQYxJuf3eoYUo
	Z7jYdGnoym8aFYH0pXEfkcJEt7P/IsFkb64LOdYUzHM/FPQlnEEdCEY4y+AZztKIQwQd
	27yArzpRPsrXFRBZuBxUVWglR/BPeMpPthxv4=
MIME-Version: 1.0
Received: by 10.100.132.1 with SMTP id f1mr6496639and.207.1277760700236; Mon, 
	28 Jun 2010 14:31:40 -0700 (PDT)
Received: by 10.100.243.32 with HTTP; Mon, 28 Jun 2010 14:31:40 -0700 (PDT)
In-Reply-To: <E1OTFzF-0007SF-NU@melo.openembedded.org>
References: <E1OTFzF-0007SF-NU@melo.openembedded.org>
Date: Mon, 28 Jun 2010 23:31:40 +0200
Message-ID: <AANLkTimUustsEbYVCiCZguDbAHQw6iKXJ5BWQUX9mbWM@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Dmitry Eremin-Solenikov : opie-taskbar-images: unbreak for non-default extensions
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
X-List-Received-Date: Mon, 28 Jun 2010 21:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2010 at 5:11 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: b409fdad280a5e90bab76c27e43cf92a9b8e78bd
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Db409fdad280a5e90bab76c27e43cf92a9b8e78bd
>
> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
[cut]

Dmitry, thanks for your patch.
I think we have now understood the real issue and a revised patch has
been produced.
I've tested it and it works.

Please give a look to it and kindly ack.

Thanks

Andrea


