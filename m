Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OU7IV-0000kI-4R
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 02:06:35 +0200
Received: by gwj18 with SMTP id 18so864195gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 17:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Lu/mo7XeZ7YkzWhKBQEgn9U6u1Nqb/iXn8qosTfFQUE=;
	b=xz+24o7LalvIpLL27PRKrl8OA48Y5wGvlqXa79mObdKzoCG412TYJaU7ahtwI6tUQH
	+azVHIkywSxN7nBSL1kNigV0bHvLOHGE+ErQzuThevboAIgMuvFp4NYtNLz82S4U/+C5
	j+3iQT6Yo3Wt8cb0DwwPqjCdXhSIVNrFzKQ2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XtynAqIUmnBcfPTx47Pv6Q8OUYH7UfsIu9ecTgm/y05Jiw+toLvj3tXRj469Eu2om8
	dWslAMXMy7jTPlm+yqcgpMmmsm5HXVLI8JQITgEJqSv+Pt9abHQfmLwlJe1ILe0oQbdF
	ZrqEPb0vap1IGF7jQahG+v4cexn5SYq85GNLI=
MIME-Version: 1.0
Received: by 10.229.215.138 with SMTP id he10mr5610930qcb.60.1277942505236; 
	Wed, 30 Jun 2010 17:01:45 -0700 (PDT)
Received: by 10.229.22.18 with HTTP; Wed, 30 Jun 2010 17:01:45 -0700 (PDT)
In-Reply-To: <i0epov$ke6$2@dough.gmane.org>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
	<1277858599-27400-2-git-send-email-joaohf@gmail.com>
	<i0epov$ke6$2@dough.gmane.org>
Date: Wed, 30 Jun 2010 21:01:45 -0300
Message-ID: <AANLkTilFFfYgxvAGUG3p3XUipVFc19mIB7Xrf1NATWmR@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] add cmake 2.8.1recipes/cmake/cmake-native_2.8.1.bb
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
X-List-Received-Date: Thu, 01 Jul 2010 00:06:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I think  'bitbake cmake' will not run if the host can't run the 'cmake' bin=
ary.

cmake is a tool wich is not to be cross compiled but cmake can be used
to cross compile programs.


--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br


