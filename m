Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKdiT-00069c-PV
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:46:41 +0200
Received: by bwz5 with SMTP id 5so1895927bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2T29XkkEDW39c+7OZoTRmMw2SXrnzwWYq15dP4DjNJQ=;
	b=VfP70bC3kLvv+i+/pqEI+GjvlyNJkEzYC33T1ciTwDgdE9M0VEB0lmYSeMWq9Kne5n
	qESVwx0HxNTqUAwskPhJimAOykWxQe5pNeNpXSFKaftUMdkUfiuhCrGoYv76Mvdz52sJ
	/CRzoAyof8FB0SmUMY5ABG61lhVsLRigeIktU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=syLbiipBNP1YAMaLzeW+2hqKi0l5kQkNmTlyFpwcguGrlw5Yr2MOPpXujeACrP9V8n
	QNCjOGJo4H3yThV0om/6x2lp3fC7LPWfjODT1FI7m8OlRvxLAEN+cXNi9arvC9GL9GV3
	Lf+IRmUq1tfhWNpE4TWsBajju0QUON5SRwL2Y=
MIME-Version: 1.0
Received: by 10.205.33.194 with SMTP id sp2mr731271bkb.27.1305236633836; Thu,
	12 May 2011 14:43:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Thu, 12 May 2011 14:43:53 -0700 (PDT)
In-Reply-To: <1305235863-16025-2-git-send-email-eric@eukrea.com>
References: <1305235863-16025-1-git-send-email-eric@eukrea.com>
	<1305235863-16025-2-git-send-email-eric@eukrea.com>
Date: Thu, 12 May 2011 18:43:53 -0300
X-Google-Sender-Auth: JJtyq5SnF01lI1f_3keQkbTmFHM
Message-ID: <BANLkTinBH96fP6zAw8FoQiHmD9HYmv8Ufg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] qt4-native: also build lrelease
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
X-List-Received-Date: Thu, 12 May 2011 21:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 18:31, Eric B=E9nard <eric@eukrea.com> wrote:
> as this is nedded to build translations files
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


