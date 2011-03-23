Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q2Mcw-0005lr-3Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:53:26 +0100
Received: by bwz10 with SMTP id 10so6426903bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=16CCXBYzYdIukhWippCvPZeG1SZoG0yXWCzxOhQ73R8=;
	b=lgXrAZoGuIQJheIsLYsYaHbk0Mah2N+2P+SizBMdB98nIJO2IeN9DLwR3EP5tSTWbS
	h4zIc+YwxGHA1ueR8EwGBfcdRCCUKBBmYRiTdgfgyNHn1vhOkdyjJ9YuAIanolsl8aGS
	WYVDGW9NElf7rKcfsci4RLXnoCOCSEK0Vca+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xk1cFEzyJx78tdql9pGvN3TZ4eH/NF5s30NlWwvvT74n6N71c+AgGC9JJ4UKeyLJ9Z
	uY0LvgITjdf46eu8J6FW8SviJbFb+4q5G2T4p6Z3W2BEb75ogRVKmOTLZ8xXCA2cNqAo
	BqUbtL4bqanFR3xbbe2zbNSJ2CpWZ3rm2laAE=
MIME-Version: 1.0
Received: by 10.204.17.1 with SMTP id q1mr6132781bka.131.1300881076253; Wed,
	23 Mar 2011 04:51:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Wed, 23 Mar 2011 04:51:16 -0700 (PDT)
In-Reply-To: <1300834528.3825.3.camel@mattotaupa>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
Date: Wed, 23 Mar 2011 08:51:16 -0300
X-Google-Sender-Auth: ATwo_kP6muNg4n4vUG7DZ2eum8c
Message-ID: <AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Wed, 23 Mar 2011 11:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 19:55, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> What kind of error do you get? The recipe build fine for me using
> `angstrom-2010.x` for `MACHINE =3D "beagleboard"`.

It fails to find lua.h so probably you had it built due other dependency.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


