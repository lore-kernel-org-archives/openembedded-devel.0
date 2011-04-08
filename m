Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q8AG8-0002r6-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 13:53:52 +0200
Received: by wwb17 with SMTP id 17so3630358wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=wVokUWLn84GMfP7UZrU6hDgly4M0h70Gd1y1k9jwM0w=;
	b=G7ZpjWl1tEB4SDf8wL66RttgV4B5pWFMuw8uePo0C7o7flWUbER+whX+rlOI6EumuQ
	Qvw2TSW262Pp1W/ceLDycqrv0TOOph/ZF50/SAIhBI193T3KOh87n1NrkMizUAwDYYft
	d498GXYUMUtDGypQiIPcyQBNN3S9ZvuT7pSIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=t1isO8NN/RiP4cb4lzkYqjImufX3PCP5Id44TVzQOF4HNI2ydXp7yc9BqFNJBpE0Su
	Al8rjGjUz+xY3I+H/ltHze1FVauCdhQpNuh0G1gpLuqz0osGLxbZIHZFZ3b7e8ZNtfvY
	RBxfEaOUhuWcJ3v2aPh2IT75jyHj8xDHjdcOI=
MIME-Version: 1.0
Received: by 10.216.144.86 with SMTP id m64mr1270424wej.32.1302263502582; Fri,
	08 Apr 2011 04:51:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Fri, 8 Apr 2011 04:51:42 -0700 (PDT)
In-Reply-To: <20110408043245.GC3180@jama.jama.net>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
	<20110408043245.GC3180@jama.jama.net>
Date: Fri, 8 Apr 2011 08:51:42 -0300
X-Google-Sender-Auth: QDSBJsQmfMJad21j4d6517PJ5P8
Message-ID: <BANLkTinVPQM47td-7+bz48VHpDQE+vdudA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 08 Apr 2011 11:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 8, 2011 at 01:32, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please check RP's changes in oe-core
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-March/000739.=
html
>
> IMHO would be great to integrate this before such changes.

I think I agree with you since it would for easier migration to
oe-core later. Can someone push those and I rebase mine against it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


