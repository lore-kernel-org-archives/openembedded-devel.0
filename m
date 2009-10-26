Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1N2W1A-00026O-Dx
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 21:18:19 +0100
Received: by fxm22 with SMTP id 22so11607655fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to:cc
	:content-type:content-transfer-encoding;
	bh=+al2DrawtbsXgM8xyXhcT20FEOqbgM8bjXCWSLyVYOI=;
	b=dv6oIwZAqG5ppcbDBOcuhIIO4C+vT8R0bjaVaDCIj2tHFZMpjVUNGl5GV6+TyrN25p
	TaJiiVMVxElC0LKilOrXWKS0zedbM271tAJ8FHjrr9Twof05Xtf1ll2SLhGgHBKBufKt
	ZBy5yKqLRWtoGMSrnp3FD/LODjVpUuEJWJZKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=GGwJluQxfzeymsFZJawGDHDSMSWh2e3d8VAT9aaT0XnHGb9LantFYJ4947oZlU9uFv
	ZLceXZDl/WlyQcbA+h2FVJM6Op9wShZVs+4QlgrYwr/xJT4jLU+GJsaMrkDRWe2VRD9j
	twtBAEIymn/PlfkGKKa/uKX+yzTLjmcZ1f0Nw=
MIME-Version: 1.0
Sender: pixdamix@gmail.com
Received: by 10.103.86.34 with SMTP id o34mr6296348mul.118.1256588231092; Mon, 
	26 Oct 2009 13:17:11 -0700 (PDT)
In-Reply-To: <4AE5BAED.2000900@kernelconcepts.de>
References: <baaef4710910150931l7c4c7afl6f2b7d7b10c2f0b1@mail.gmail.com> 
	<baaef4710910150934x230f550q120d494b8d64f7d9@mail.gmail.com> 
	<4AE5BAED.2000900@kernelconcepts.de>
From: Camille Moncelier <moncelier@devlife.org>
Date: Mon, 26 Oct 2009 21:16:50 +0100
X-Google-Sender-Auth: cbdb29978313d477
Message-ID: <baaef4710910261316k63a8c377h72c3c717cd451042@mail.gmail.com>
To: opkg-devel@googlegroups.com
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [opkg-devel] Re: [PATCH] Opkg support for smime (pkcs7) packages list signing
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
X-List-Received-Date: Mon, 26 Oct 2009 20:18:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nope, no reactions, it seems opkg mainteners are quite busy sometimes.

On Mon, Oct 26, 2009 at 4:06 PM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
>
> Hi,
>
> Camille Moncelier schrieb:
>> As promised :) here is a patch allowing opkg to authenticate
>> a package list using smime and openssl instead of gpgme
>
> nice, this might be an interesting feature in future. Any reaction from t=
he opkg
> maintainers so far?
>
> Greetings
>
> Florian
>
> --
> The dream of yesterday =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Florian Boor
> is the hope of today =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Tel: +49 271-=
771091-15
> and the reality of tomorrow. =A0 =A0 =A0 =A0 =A0 =A0Fax: +49 271-771091-1=
9
> [Robert Hutchings Goddard, 1904] =A0 =A0 =A0 =A0florian.boor@kernelconcep=
ts.de
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0http://www.kernelconcepts.de/en
>
> --~--~---------~--~----~------------~-------~--~----~
> You received this message because you are subscribed to the Google Groups=
 "opkg-devel" group.
> To post to this group, send email to opkg-devel@googlegroups.com
> To unsubscribe from this group, send email to opkg-devel+unsubscribe@goog=
legroups.com
> For more options, visit this group at http://groups.google.com/group/opkg=
-devel?hl=3Den
> -~----------~----~----~----~------~----~------~--~---
>
>



--=20
Camille Moncelier
http://devlife.org/


