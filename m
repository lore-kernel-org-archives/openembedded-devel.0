Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKdhw-0005zX-LS
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:46:09 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1895264bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u0+oARH5TPTG3+Fg2aqqGw4nL6AhR9jkR1vp3dhWw3w=;
	b=Tdz9FB4IFIF1MoUDL201tZXCelC7kqweg5yK0Sz7W6dNRrerAFCZixIK9DNVs5vvfi
	deXfYzqU2NQjBZOv68SS7bLmxJRgkGXmOOqVcsbyy/ZiqCJMztMmZKOks8Mq10leTLgl
	91+LZgP2F608XpVPlxSJ5Ti1ztnDhhXGWlLwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Zb0D6+1whThmdqqoS8z1aYXJfniLGvoRHGVZ++3a9AsQZTsHDRNTUgKsAbg0VHOV3x
	G3RqWuSC/NkgI8T32DnloewSQZjNPLVLzEeoblbW43TSm2SkCpQ2rfwi1PK4x4UtEM1M
	QV85mrLKeRl9LZNO2jmhPbMYdlHDVOqh1cj28=
MIME-Version: 1.0
Received: by 10.204.7.209 with SMTP id e17mr716730bke.162.1305236602802; Thu,
	12 May 2011 14:43:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Thu, 12 May 2011 14:43:22 -0700 (PDT)
In-Reply-To: <1305235863-16025-3-git-send-email-eric@eukrea.com>
References: <1305235863-16025-1-git-send-email-eric@eukrea.com>
	<1305235863-16025-3-git-send-email-eric@eukrea.com>
Date: Thu, 12 May 2011 18:43:22 -0300
X-Google-Sender-Auth: b9GVaOzlwMKqDyLl3FwK2--iixw
Message-ID: <BANLkTinOd0+nc+yFmbbbSFzo0ME4=MV7=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] qt4.inc: give the right name to variable qmake will use
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
X-List-Received-Date: Thu, 12 May 2011 21:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 18:31, Eric B=E9nard <eric@eukrea.com> wrote:
> this should prevent to have to manually copy binaries for the build
> system built by qt4-native to the source tree when cross compiling qt.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


