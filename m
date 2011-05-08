Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIto8-0007Qm-W0
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:33:21 +0200
Received: by bwz5 with SMTP id 5so3724069bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+MfTJhY7pq8Us6eRMbni/5DOIkHLXeM2ZMOX/v4TMQQ=;
	b=uM1j4qgCCPTDN4gZcJMv1QvyrWD4h93uMb2tuPOqFVzVod98LgJgOBWzUoqXBpghLj
	y97fNivxeYngXvUPc46WZzz7F1xQw2uHt5wSRdlWT5xYODQUan3YjoXwZoNEjqy+8AN2
	2akVQnVJI5dwtAsTiNxe39qc9LSH7mQbSdH/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=JyBT6fIiBr4xt4BXShZY4dfK/W8yGDC/q90WSanaoc8LBbGgG6dcVfcZky7mphnNYZ
	lJgCO+n7wZC1wFMhFdNVEiJnTodPiCoN4MhK/7HmmupZhClF6Pe7axaRTdzbiaR9tsS7
	tpWYjK3rmLbKSh+JwA1RX+EgoSM1+UgxwkSY8=
MIME-Version: 1.0
Received: by 10.204.178.65 with SMTP id bl1mr3973441bkb.189.1304821837188;
	Sat, 07 May 2011 19:30:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sat, 7 May 2011 19:30:37 -0700 (PDT)
In-Reply-To: <iq4q5m$e40$4@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-7-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-8-git-send-email-otavio@ossystems.com.br>
	<iq4q5m$e40$4@dough.gmane.org>
Date: Sat, 7 May 2011 23:30:37 -0300
X-Google-Sender-Auth: sFTaHKm0CZTglWpxQ9jYZ7Z5jAY
Message-ID: <BANLkTinrEA6rpndU-OKmkOkTAqFWnBqrhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 8/8] libinih: add git recipe
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
X-List-Received-Date: Sun, 08 May 2011 02:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 22:03, Koen Kooi <koen@dominion.thruhere.net> wrote:
...
> Again, RDEPENDS in the wrong please, but more importantly, why do you
> empty them?

We only have static libraries so no PN package. I added a comment
about it on the recipe.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


