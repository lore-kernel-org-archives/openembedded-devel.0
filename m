Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuNZr-0000O5-Rm
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:17:15 +0100
Received: by bwz10 with SMTP id 10so4450074bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ZZDjxeNqa704JD+fr1xFMrXVnGx1jBtsRQR2bWJ2IG0=;
	b=Xp8Y/mPTUxux3I0Dmw8ccD1EMVSyAz0H+CNfLo/SerH+rryjSxjKtpeV0PQnfrfO1U
	F2p6ihuV/j/DNVNTviyeUbs6TUCYxQSDCHgi+v/q0aPbgUSun2ATx+tablXscr7/787z
	KIvvgsbQlagg/LMfDFqP6bo87Wh/Om9PuTcGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xwjh0iDizlCnDopU2bFSFWQrNNOXiRVVpdb9nPHKemUVCScbKrpPrIUw/nxPdnbDyZ
	lnZG18i5HSHdbA7CkE+S8oxfvdn9bH3jvIF1bZJ1VXL5NflDReqWzAtZy7mX8NEcO1vA
	MvaOWOCEwu55kwB/v9/fZJrqKdec9O06KBp5A=
MIME-Version: 1.0
Received: by 10.204.140.208 with SMTP id j16mr5873616bku.151.1298978147077;
	Tue, 01 Mar 2011 03:15:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 03:15:47 -0800 (PST)
In-Reply-To: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2011 11:15:47 +0000
X-Google-Sender-Auth: pD6RRUYsl-IXNrfZYjhCUotbm0c
Message-ID: <AANLkTint_kzkuCC1xMfF1T16u0DkzB6s77Lax_Ogz+Vy@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 11:17:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 09:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0conf/distro/include/sane-toolchain-eglibc.inc =A0 =A0 =A0| =A0 12 ++++=
++------
> =A0conf/distro/include/sane-toolchain-glibc.inc =A0 =A0 =A0 | =A0 10 ++++=
+-----
> =A0conf/distro/include/sane-toolchain-uclibc.inc =A0 =A0 =A0| =A0 =A06 ++=
+---
> =A0.../include/sane-toolchain-uclinux-uclibc.inc =A0 =A0 =A0| =A0 =A02 +-
> =A04 files changed, 15 insertions(+), 15 deletions(-)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


