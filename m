Received: from mail-ew0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3qY8-0002HQ-QC
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 16:34:52 +0200
Received: by ewy6 with SMTP id 6so1291682ewy.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aPBF4RQpXpx2tOuBkU/7WL6Q4G0zt9Dw2Fq25otubc0=;
	b=idUQpnH1M4CpRwdA1apZRJcQb5cfzI5ZshVZDAJF2EnhbADv5ZrH232rgt2oEqgANR
	N3koS9fh4wkelKLmClOaGleq8VUJx/dlPr7dxiqv4b7JmZi55TyCXvrWlYsmhvGgTSck
	0ZKKT9BltQCsQ6IdUNRsFvZbxRskC0dBtOV7w=
MIME-Version: 1.0
Received: by 10.204.136.25 with SMTP id p25mr860055bkt.249.1316010581674; Wed,
	14 Sep 2011 07:29:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 07:29:41 -0700 (PDT)
In-Reply-To: <1316010273.6686.105.camel@mattotaupa>
References: <cover.1316006259.git.otavio@ossystems.com.br>
	<1eb2612347e83d9906021429768912fcd036951a.1316006259.git.otavio@ossystems.com.br>
	<1316010273.6686.105.camel@mattotaupa>
Date: Wed, 14 Sep 2011 11:29:41 -0300
X-Google-Sender-Auth: IpwjfiU8-OpZ0gstJuWns07ajaU
Message-ID: <CAP9ODKo3GK6uDaSOdZ=CgU73LVdspZnvJ+xFNizsMdubzKGW8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] xorg-xserver-common.inc: usr ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 14:34:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 11:24, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Mittwoch, den 14.09.2011, 13:18 +0000 schrieb Otavio Salvador:
>
> There is a typo in the commit summary: s/usr/use/.
>
> What distributions do not use `/usr/`?

We need it to build a local and reduced chroot of a product.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


