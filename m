Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SPylZ-0000ww-AP
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 18:20:29 +0200
Received: by wibhm17 with SMTP id hm17so464038wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=C5aBBYiYvBvMrnFNMvqZ7LQ2c6+8OQTCZz/tSJNbPwE=;
	b=Y7WsvZ2/K1xwNm1HYFZOHU03wnWtCDXPiM7iGwd4I3tCXACO414pwuLAXgo22CmT0r
	VIdoWHRoQKeucYe0o/MUD/6JoT4yKStgwEfgUYTsvW4IFG565K/WUjSoSXRXuHW502GH
	jX2vzqeUXogjqA/Iak4I1+d3OKK42D+ttETNnmGleSOaHllK1rkeI1SlM1MScNs8UUxz
	5xqMV9P0F/tnstnupr6cadhGfnzNon/F8lQfdphU4vj9qWrxC2odFMI0ykEgjyld2R8N
	JWrb8p+MVa61rzGHdWCsE0RanJoIfd3m0hA3uaMzFynEnLIZzqcbaAb4qy7gxN7E1cWs
	81mg==
Received: by 10.180.105.69 with SMTP id gk5mr5386523wib.3.1336061443680;
	Thu, 03 May 2012 09:10:43 -0700 (PDT)
Received: from [151.37.171.129] (adsl-129-171.37-151.net24.it.
	[151.37.171.129])
	by mx.google.com with ESMTPS id j3sm4562172wiw.1.2012.05.03.09.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 09:10:41 -0700 (PDT)
References: <CAC+thW1MhdQD9ofG1tyY7voJDPQXETvj2iFAgC9uNFDNUPJ6NA@mail.gmail.com>
	<CAA5cW2w1pE6tZoZG6EL2AVRxQnKK14Cre4CMcXTQvvNjcJ4OCg@mail.gmail.com>
In-Reply-To: <CAA5cW2w1pE6tZoZG6EL2AVRxQnKK14Cre4CMcXTQvvNjcJ4OCg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <CD33EA34-A7BC-4E8E-8780-5695958D0260@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPhone Mail (9B176)
From: Andrea Galbusera <gizero@gmail.com>
Date: Thu, 3 May 2012 18:10:24 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: right directory for a recipe
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
X-List-Received-Date: Thu, 03 May 2012 16:20:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Rado,

Il giorno 02/mag/2012, alle ore 22:06, Radoslav Kolev <radoslav@kolev.info> h=
a scritto:

> On Tue, May 1, 2012 at 10:10 PM, Andrea Galbusera <gizero@gmail.com> wrote=
:
>> What would be the right directory to put libmodbus in? I understand
>> recipes-* names are somewhat self explanatory, but I'm still confused
>> if "recipes-extended", "recipes-support" or anything else is the best
>> choice.
>=20
> Hi Andrea,
>=20
> the others seem busy, and I don't have the answer to your question,
> but here's my advice - go ahead and port the recipe. Pick the best
> directory you think suits it and submit the patches. Even if then
> another directory is recommended the move shouldn't be much work.

I'll certainly do as you suggest, as soon as I cleanup the new recipe. Just w=
anted to ask before, to check if I was missing some policy here. I see you a=
re the submitter of the original recipe in "classic": good to have you in th=
e audience ;-)

>=20
> Regards,
> Rado
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


