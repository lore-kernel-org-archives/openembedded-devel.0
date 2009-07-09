Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MOvqW-0004ds-Rz
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 17:47:41 +0200
Received: by yxe31 with SMTP id 31so336146yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5CObPqCTuhXry4HsE5P2Kckfm0BUfW20X/ksrijchGQ=;
	b=WRQPnHlGOXCAIkqC4StbzRfcHJ1DZ+G2/No0jf426jNoZSoS04Z63LMq0WEwil05xm
	OqT7MxZSk1bRQ+L6VIsW20Ix+kSq9FZsCpxKh4gWBIaJ1ubFbi1zvW3wxVAI5eYu0K8k
	Fij2vZfrgRVi7RJJEiB6sR3wzqEjrGqx/eF4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fWXQfBeJVP13r0zQUH8SiYmEHn4dz2X4Bn5BVWcpQiEe/p1RD2/XrMLjw/kIrydiIv
	3HQEjJeASwxp5WqCcZ0hXT3Hil4t4nViGuyZepAQSztfqQX1QoLesUxEqZiGW8vNsqse
	WMedeHAuiF2rAiJt5htoZj4QwFvxQZrpdOLpk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.171.13 with SMTP id t13mr1260597ane.94.1247153692222; Thu, 
	09 Jul 2009 08:34:52 -0700 (PDT)
In-Reply-To: <200907091919.56858.khimov@altell.ru>
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
	<be7a9f3d0907090708n76b215d0id9b0ab7364f5b61e@mail.gmail.com>
	<be7a9f3d0907090733l2bf493a2mfc63118844705ced@mail.gmail.com>
	<200907091919.56858.khimov@altell.ru>
Date: Thu, 9 Jul 2009 12:34:52 -0300
X-Google-Sender-Auth: 6774cdfd3f3ee375
Message-ID: <be7a9f3d0907090834q3e1a57b2s6723e15b5f3a9fa6@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 15:47:41 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

Hello Roman,

Thanks by looking at it :-D

On Thu, Jul 9, 2009 at 12:19 PM, Roman I Khimov<khimov@altell.ru> wrote:
> On =FE=C5=D4=D7=C5=D2=C7 09 =C9=C0=CC=D1 2009 18:33:24 Otavio Salvador wr=
ote:
>> qemu-native 0.10.3 doesn't compile in my host system but 0.9.1 does fine=
.
>
> What do you have on host system? And could you also send qemu build log (=
which
> fails), please.

It is available at http://pastebin.com/f4bb04943

amd64 (running in 64 bit) with Sid.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


