Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWpA1-0005bB-54
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:25:29 +0200
Received: by bwz5 with SMTP id 5so460588bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Iuvsg3mearOXVyES/1aylfyluqeadqs21zXWggZg40k=;
	b=uwqOJncDbjGwiTXOtIdBvgloC/CxjYXYuRnpES82qQ/Z/yeQ/0lJ52mQhjPLu5ja7J
	hnTaAtZnliQNEo7XbJUgN+ggnFRxqtRzLdHODv7oAcuOgQaiAVl+wkdCGRFJXhRFvlwb
	iq256GAifZ0RZTNygSeJXaWmJbwluOXFoeZHY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=xGwCoceh/bUUUYGOPiAuOa1fFsllFy+EVw0iN2wPNWT3FsMHKg3i0NAsfLfFXwhih8
	spqujTcDFvw2WymqAV0b1p0SJ2O332ufrH2zhUCP657QTGMVNulCLJv15rLj07wi7Sfg
	nbQQ1vsygsW867g64AsjV7ctMTzVCt/gMjF/w=
MIME-Version: 1.0
Received: by 10.204.39.65 with SMTP id f1mr452173bke.157.1308140522870; Wed,
	15 Jun 2011 05:22:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Wed, 15 Jun 2011 05:22:02 -0700 (PDT)
In-Reply-To: <1308131824.4304.6.camel@mattotaupa>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
	<1308131824.4304.6.camel@mattotaupa>
Date: Wed, 15 Jun 2011 12:22:02 +0000
X-Google-Sender-Auth: bJk90ufd8EUtOK9JkRJXg_gPQrk
Message-ID: <BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 12:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 09:57, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> 2. Please add the necessary information to the commit message as
> recommended in the commit message guidelines [1].
>
> As far as I can see you imported this recipe from oe.dev.

In fact no ... it is based on an old version from OE that I changes to
look like we're using today.

But AFAIK it is on Koen queue already so too late to change.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


