Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MPBkH-00007E-Kf
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 10:46:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id C0F9C2CA01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:32:51 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7zBi0M84RcW
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:32:47 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id D38E12C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 08:32:46 +0000 (UTC)
Message-ID: <4A56FCFC.5090602@gmail.com>
Date: Fri, 10 Jul 2009 10:34:04 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <loom.20090710T022617-446@post.gmane.org>
In-Reply-To: <loom.20090710T022617-446@post.gmane.org>
Subject: Re: Setting screen size
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
X-List-Received-Date: Fri, 10 Jul 2009 08:46:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Kwan ha scritto:
> Hi all,
>=20
> My device has a screen size of 800x480, but when I try to run the OE gp=
e-image=20
> I compiled, the screen size stays at 640x480 no matter how I set it. I =
changed=20
> the /etc/X11/XServer file to supply an argument of "-screen 800x480" to=
 Xfbdev=20
> but seems like it does not take effect. Is there other configuration fi=
le=20
> somewhere that I could set?


/etc/X11/XServer file is the right place,
which machine are you using?
please pastebin your XServer file


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


