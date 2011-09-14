Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pAe-0008PI-LD
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 15:06:32 +0200
Received: by bke11 with SMTP id 11so1446153bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=On4QoHzfxIDdQ7eZ+djO9fV0kEmbWuf410ctO0rhd0A=;
	b=uNLiJyENpmkYZKhXoEUu1hGQ2MIo/AJxMVpaN0/QWqJce9bAJBlSimaQKiS0LQ8gtN
	PlOJMFFDJyoWbkDk+EIrRIGLtssSciWCsKNfvqqophuAgdxt3rTcQG2E2IFtVKcu0D4r
	s3qgjeueXKdiuj5L8PPXsUs5kQS+q2kOr961A=
MIME-Version: 1.0
Received: by 10.204.136.25 with SMTP id p25mr782366bkt.249.1316005282416; Wed,
	14 Sep 2011 06:01:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 06:01:22 -0700 (PDT)
In-Reply-To: <1315995214.6686.46.camel@mattotaupa>
References: <CAL9MRrnBVWmZ06rYdp-PomBj=n_4OSMSRx9ejdSJnfn5V7Hokw@mail.gmail.com>
	<1315995214.6686.46.camel@mattotaupa>
Date: Wed, 14 Sep 2011 10:01:22 -0300
X-Google-Sender-Auth: nIELlRjfA_iOWPnPpc1eZQRNjIE
Message-ID: <CAP9ODKr6aknt7xpE+2HWhxYrUmztuHRQq-4H-wxcdfpAuGeC-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add support for mini-box.com picoSAM9G45 board
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
X-List-Received-Date: Wed, 14 Sep 2011 13:06:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 07:13, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
...
> 1. Unfortunately our policy [1] forbids out to commit your patch,
> because you did not add your Signed-off-by line.
>
> 2. Also please add the information from your introduction to the commit
> message.
>
> 3. The more information the better. Looking at your Wiki pages you seem
> to use the =C8=A6ngstr=C3=B6m distribution. Please add that too and proba=
bly it is
> also good to know what you have tested (ports, graphics, =E2=80=A6).

Wouldn't be better to add this in meta-angstrom and use oe-core?

IMO we ought to try to move as much as possible to oe-core otherwise
we will keep duplicating a lot of work.

--=20
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0http://projetos.ossystems.com.br


