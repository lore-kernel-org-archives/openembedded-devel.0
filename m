Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M4Gj5-0007Yy-Ko
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 17:50:35 +0200
Received: by an-out-0708.google.com with SMTP id b6so218798ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ynBG28zPiVJKqoJvwbUIA8gpF2C0+1/JRH63O8SV0+E=;
	b=u+d2DGpdYSiLhiowjlCi+IFEBabLYKeJg/nY3B0D0PNOM25rz0elWkGcbxQyYvABCy
	iOukuYLtWZ6NH0Pq5fife8CMM9/3+nCWee2X1jWgwEl5oqrkHY8wtwY8+pLUkgrQo5JE
	CqcB1y75EgKgIh5AE1F1SRRuO4te6puoLukjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=nnPM5ZMz0HT9mE0KOtzRQDvpoNU2f2BT9sIKVfL6Lw501A0hmFQ5BATNoO1yhECmK0
	Ve8WiWbpRsD9FNnC/VXdZW2sxkcbIYQ3OJPIuhCcZFCRGh1pNRIWDZKLqN/MKVrv2Qpz
	4sqgkU2DAReXbEPMZa0Q/GmajCiKDuLrtTDms=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.13.2 with SMTP id 2mr1528156anm.132.1242229430690; Wed, 13 
	May 2009 08:43:50 -0700 (PDT)
In-Reply-To: <87octxewd7.wl%peter@chubb.wattle.id.au>
References: <87octxewd7.wl%peter@chubb.wattle.id.au>
Date: Wed, 13 May 2009 12:43:50 -0300
X-Google-Sender-Auth: 3a2d89d8502e5ff7
Message-ID: <be7a9f3d0905130843h6d117abdyd752054150a4784c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] mtools now an FSF project
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
X-List-Received-Date: Wed, 13 May 2009 15:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 12, 2009 at 8:26 PM, Peter Chubb <peter.chubb@nicta.com.au> wro=
te:
>
> mtools version 3.9.11 is no longer available upstream, and the old
> website merely redirects to the FSF homepage. =A0This means that mtools
> is currently not buildable (unless youalready have cached copy o the
> source somewhere).

This same patch is already queued in the O.S. Systems tree and will be
pushed once I finish the last fixes that people has asked for.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


