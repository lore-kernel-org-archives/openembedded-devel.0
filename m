Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1MEeEj-0006V6-QU
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 08:58:09 +0200
Received: by qyk34 with SMTP id 34so1829390qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LPVqpfUd0OJpuiHeaJmRZT49/UEOqqVsHF+ALUl08Z8=;
	b=kYw0Q/i2BfUB9bdFjTx83VwHpRB9oe2XdKlFGtt7EpQqn2i5EMAj9hbymCaphR5roT
	yD6Q5bm3s3zHxBjzMwJNyY2wHnrI/hOZ1/2hEt+q3FVChjvQpqKy69qw+nR13TFgKdbh
	Wo8roOK3qoi7LSgG2gt22afpomh1y0XUz87Fs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nu6Enw2cw1XhR1NGn8Io8br64lo8FxOrJoChJ9Ofq/tGrxlBLDc3BYVTvNJ/kEwaIQ
	lOiPH635nIhHdFLV/Vt8jdtf8JUiW2a1h4SIOSLiKUr92LnXgAdpslfJTOJ7PuZI9Jhz
	UVz5KhQ12TMzJ6p/tARJ9pPRR1Zo7ssiBHBeE=
MIME-Version: 1.0
Received: by 10.224.80.193 with SMTP id u1mr2784882qak.358.1244702901363; Wed, 
	10 Jun 2009 23:48:21 -0700 (PDT)
In-Reply-To: <200906101511.57613.mickey@vanille-media.de>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<200906091121.59329.mickey@vanille-media.de>
	<d2b9ea600906092353o4fe9ea02vbc7df3b103b401c4@mail.gmail.com>
	<200906101511.57613.mickey@vanille-media.de>
Date: Thu, 11 Jun 2009 08:48:21 +0200
Message-ID: <d2b9ea600906102348n6a220b46r1e5e5750863b72e@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: progress on OE organization issues
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
X-List-Received-Date: Thu, 11 Jun 2009 06:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2009 at 3:11 PM, Michael 'Mickey'
Lauer<mickey@vanille-media.de> wrote:
> One of the major purposes of the e.V. is being able to raise funds to giv=
e
> people a chance to improve the spots in OE where we are weak. The idea of=
 a
> self-chosen membership fee was to invite companies who have a certain ben=
efit
> from OE giving back in the form of tax-excemptible membership fees and
> donations.
>
> Most e.V. associations have the notion of 'active' and 'passive' members =
--
> both which are equal stakeholders interested in supporting the associatio=
n
> through their contributions. I consider active members being the committe=
rs
> contributing through code, docs, etc. and passive members being the ones =
who
> rather want to contribute in monetary form.
>
> By being a member, you have the rights to vote when it comes to decisions=
 that
> influence the future of the OE.

According to the babelfish translation of the statues, only active
members are given votes.

I believe it is worth noting that thit ties in the current SCM architecture=
 into
the statues.  If someone decided to use a more distributed approach (fx. us=
ing
pull-requests instead of commit access), these rules would not give them
voting rights.  Any reason to involve SCM architecture into the statues?

I know this is not intentional, but it is worth correcting IMHO.

/Esben

--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


