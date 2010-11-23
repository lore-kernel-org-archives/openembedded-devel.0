Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ka6sox@gmail.com>) id 1PKxhs-0000oW-JU
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 19:35:09 +0100
Received: by fxm7 with SMTP id 7so1565289fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=aWMV3RJQFKN1UdiNKGIlwtOJKuX3s4o4sCcZKDqV1pk=;
	b=FlclkBgcoGBa0vvXiCGSMc2LlnerAYZQJdXCQKsGd6ZeZdWVqxsme6bCamTQyd1jfn
	Fd/2XiTJ6iERBAZt1254nViQgJKXDN7Z5PW6HLqOB5eJBa5mBD9okDZ8aIIQvv5SvD/q
	CAdvk7eZ3BSpV7udpqQiNvgE/qARoepctXRDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Vm6vBM6bBAg53omzKYHORaZGHEsyUU3UW+48IGEDsr6DvqvSqOGhqr2kRZkPHDA60u
	fOTALe9hAm2Ubt5a5JOA3vL/WrRegn0TyXZ4oflSwtZ45iNh9vAFkVtV6kwQx+rrsV7s
	l8OYp7ree/axdTW2s9nINtCSuU8derAkUKGow=
MIME-Version: 1.0
Received: by 10.223.86.9 with SMTP id q9mr1975620fal.25.1290537235196; Tue, 23
	Nov 2010 10:33:55 -0800 (PST)
Received: by 10.223.72.1 with HTTP; Tue, 23 Nov 2010 10:33:55 -0800 (PST)
Date: Tue, 23 Nov 2010 10:33:55 -0800
Message-ID: <AANLkTinUZ0coke1V2BNiqWkqY49F=1mYXD3YQT_6oW9Q@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: ka6sox@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: wrong file
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
X-List-Received-Date: Tue, 23 Nov 2010 18:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Fixed.

Correct file and md5sum on sourcemirror

Tom
ka6sox@gmail.com

>From: "Eric B=E9nard" <eric@eukrea.com>
>To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Nov 2010 10:41:29 +0100
>Subject: [oe] wrong file on sources.openembedded.org
>Hi,

>http://sources.openembedded.org//binutils-2.19.51.tar.bz2
>gives : ae08e3f6d3bd59a4855e99d9bfaa56fe  binutils-2.19.51.tar.bz2

>but recipe (and sourceware's archive) have :
>SRC_URI[md5sum] =3D "fd59f36022f6ea802d1c844a2576e616"

>Eric

