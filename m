Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1MiTQS-0000Qc-Ko
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 15:29:32 +0200
Received: by fxm24 with SMTP id 24so2446867fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=HgorfTqhNjsoBZu2C8R/yOlMIobOxz0PKZlUB4Mi4jM=;
	b=r+QtO1BKZ1u0rMr9Q1idW59xGOrQ1MQBt5v4z07rX6Ei9lsuqp1M38Qe5y9SJd+ttF
	Rl0wHlojtbX988Xkl1GshpxKJe1oECfcoG86XC3A6P0beS9eGLSsti5Fj4Tqh/hbp2WB
	NoFQs8ds3NjwxhSOQkAZAMSeg3Pa3wAw8JGuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wWKWO1tQbVXNf9TRBt0x2kWZmkOl6tNEjUq+rG9duviOSSMy9lH7YWjITIg0P9zxK4
	0sFz9009TZ1hyjWoEHe6K1mTCrK08aTe4oOhdhEVzd6nMKTpmibvUEbH0evNHfdx/gfp
	wqWYevFwQ6yHr9ey00MzHHXKr3hokZY8OsgkU=
MIME-Version: 1.0
Received: by 10.204.153.22 with SMTP id i22mr5425616bkw.165.1251810653288; 
	Tue, 01 Sep 2009 06:10:53 -0700 (PDT)
In-Reply-To: <200908311553.26539.marcin@juszkiewicz.com.pl>
References: <a63ecaf0908310519p3bc80147q6ad2d89e4c587d@mail.gmail.com>
	<200908311553.26539.marcin@juszkiewicz.com.pl>
Date: Tue, 1 Sep 2009 10:10:53 -0300
Message-ID: <a63ecaf0909010610hb7a1a50h2c4588a421fdb534@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Xorg int10 module missing?
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
X-List-Received-Date: Tue, 01 Sep 2009 13:29:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

No, I can't find any reference to int10 in any recipe!!  Nor in xserver-xor=
g
neither in ALL recipes of OE

2009/8/31 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

> Dnia poniedzia=B3ek, 31 sierpnia 2009 o 14:19:40 Sushi Sensei napisa=B3(a=
):
> > I'm trying to use cirrus driver but I can't load int10 and xaa
> > driver vesa also depends of xserver-xorg-module-libint10 but I can' fin=
d
> > this!!
>
> They are build as part of xserver-xorg recipe.
>
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

