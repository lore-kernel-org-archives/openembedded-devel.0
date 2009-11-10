Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N7nLL-00050i-Oj
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 10:48:58 +0100
Received: by pzk15 with SMTP id 15so3119377pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 01:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4Wu2OLhLgFSp2XnmooCfD0YJMPQhUgNmwQg9yMIe0hI=;
	b=i3Pdj1k2Q3A9ESxf0siDtR5IUI3U30sev8V6c1WFrDFMCjucLC9f45jV7aUH6ZRy1u
	mZ7alpEgYmj3HlhrWBvpwg93sknw7HfhdevBwUO0Uc9NusOwGBsHlN2anV9UFUuzvoft
	sZGJ7ZhF0msXwR/HfsEqm0aZY86wAEK3L3B5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=D0z6rRObJdMkCciytFaaI/QeY5Ylj3tiNFYhspFrtBW1ArPmGewZfYMYwythkb9m3B
	tqiE5mf89XneF1GjRXfmuglFE0r5QS7k1WCvoJG88jaUB/JNV9d7qrriDi8Of61slKkD
	6gSAnlZD051Gg8r5M4pCUZRRC1+Bc1uzXjpw4=
MIME-Version: 1.0
Received: by 10.140.207.16 with SMTP id e16mr457594rvg.86.1257842767936; Tue, 
	10 Nov 2009 00:46:07 -0800 (PST)
In-Reply-To: <E1N7djD-0008HQ-Pz@melo.openembedded.org>
References: <bug-4162-13@http.bugs.openembedded.org/>
	<E1N7djD-0008HQ-Pz@melo.openembedded.org>
Date: Tue, 10 Nov 2009 09:46:07 +0100
Message-ID: <d1b08f940911100046h3eb96156xbbaae272e42a7ced@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] [Bug 4162] zaurus-updater do_deploy fails to run in .stable
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
X-List-Received-Date: Tue, 10 Nov 2009 09:48:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Justin,

wrt Zaurus, pleas forget the stable branch for the moment.
We are fixing the -dev branch but diverging too much to be able to cherry-p=
ick.

Regards

Andrea


On Tue, Nov 10, 2009 at 12:32 AM,  <bugzilla-daemon@git.openembedded.org> w=
rote:
> http://bugs.openembedded.org/show_bug.cgi?id=3D4162
>
>
>
>
>
> --- Comment #9 from Justin Patrin <papercrane@reversefold.com> =A02009-11=
-09 23:32:55 ---
> I'm amazed that I'm still seeing this in the current metadata. If I just =
try to
> bitbake an image the same thing happens. I have to manually bitbake
> zaurus-updater, then do my image bitbake again.
>
> --
> Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=3Demail
> ------- You are receiving this mail because: -------
> You are the assignee for the bug.
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


