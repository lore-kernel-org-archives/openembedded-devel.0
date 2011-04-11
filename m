Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q9HG9-00076a-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 15:34:30 +0200
Received: by bwz5 with SMTP id 5so4651195bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VXw8C0fSsaYN+CRBnAm/JMe1Yc2xS1RnMIynzUV90ww=;
	b=inGfqFaDGrSGh9a4+4fXTH0sChi9OwcV/MAJWrk2cJSwu+AkxfI7eeMxyNvXPDzSqy
	Kw50DofXf9uGDH9WDp//nYvaa1QhQtsdSAzu2O/w3IUn4FrnFYUKYpKtSzIDIK2nZqW4
	cdaR39oJtGFvy+VdtYkZYHWIOW0gxBFOlu3X8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=cqG5ipC8TK5DGn2E1QlDIRLa2gFDd1GdVrlvdl5HLQBX1LBfMsec4/uI+e9if3fvD5
	yuI0SQRTpub3Gfmo9T5GDh9PWJDp3SL4utGsiS6N99zcUe4Xf1dK9IF7Y0YFHVslgaFu
	CR6ojQgSkWPQ4rNYqX8CAKUIpXomrpM1DD/zg=
MIME-Version: 1.0
Received: by 10.204.10.81 with SMTP id o17mr4828401bko.94.1302528737419; Mon,
	11 Apr 2011 06:32:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.14.137 with HTTP; Mon, 11 Apr 2011 06:32:17 -0700 (PDT)
In-Reply-To: <BANLkTikvUTiJSFKYAcD3X9tgFTwVu+X8Bg@mail.gmail.com>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
	<BANLkTikvUTiJSFKYAcD3X9tgFTwVu+X8Bg@mail.gmail.com>
Date: Mon, 11 Apr 2011 10:32:17 -0300
X-Google-Sender-Auth: f2SrXWTj3rTa93ouD3D0mB7i2fI
Message-ID: <BANLkTimyTmSCbVkjC1Zj62g9HxONVbeBbw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/6] xserver-xorg (1.9.4): enable xephyr
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
X-List-Received-Date: Mon, 11 Apr 2011 13:34:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2011 at 10:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> are you using sane-toolchain with gcc-4.5?

Yes; using mininal distro.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


