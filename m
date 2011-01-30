Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1PjZtn-0001lW-66
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 17:13:11 +0100
Received: by fxm17 with SMTP id 17so4921844fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 08:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:in-reply-to
	:references:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=DX/ACc7xbkkI8IWi4ne3LgGMdYpor9kxc9h9fIGr024=;
	b=EueIBtkvvRqSaIBaLfGVTFg7I6tlPXE08j0uKdFoeQDsf7YT05hJ0rCW70HCSDiPad
	FM7V6aMybTrKrUGbpViG7avyI1hfQxoOVZru6fctv1jXQhVoldh4e99Wbpqc+1AyOt2/
	wVMdQsFCDuYJnSNI3HyIIhq5Y8In3KO9X5n0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=Ap4OxW5+2KcBtaPOUJ1sb7pI2Ce5hsGkWb0PV0hzaGCUF24FttSdDH3t5EvAQvsYcA
	y308Q2Zv222sllvEvyWHTForFCEwzQIa7gCdkMov4+zaKyPMiknw7l9mM8P/vcspD6Fp
	8EnHEVKtVOiNFezaf6xcXCiLGhoxa8s/gwVAI=
Received: by 10.103.241.16 with SMTP id t16mr1747876mur.23.1296403937810;
	Sun, 30 Jan 2011 08:12:17 -0800 (PST)
Received: from widy.localdomain ([213.238.8.5])
	by mx.google.com with ESMTPS id a6sm533568fak.3.2011.01.30.08.12.15
	(version=SSLv3 cipher=RC4-MD5); Sun, 30 Jan 2011 08:12:16 -0800 (PST)
Date: Sun, 30 Jan 2011 18:12:10 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
Message-ID: <20110130181210.17afe082@widy.localdomain>
In-Reply-To: <4D455C28.7010406@xora.org.uk>
References: <20110130022818.1c15662c@widy.localdomain>
	<4D44C015.9050700@xora.org.uk>
	<20110130123418.4e354145@widy.localdomain>
	<4D455C28.7010406@xora.org.uk>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Official git mirror on github/gitorious?
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
X-List-Received-Date: Sun, 30 Jan 2011 16:13:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, 30 Jan 2011 12:40:08 +0000
Graeme Gregory <dp@xora.org.uk> wrote:

[]
> >> There is an "official" =C3=85ngstrom mirror on gitorious.
> >>
> >> http://gitorious.org/+angstrom-distribution/angstrom/openembedded
> > Yes, seeing it made me think that it would be nice to fork it via
> > site means. Is there guarantee of upstream update time for it?
> > Also, even then it seems like a 2nd-level fork, not forking a pure
> > OE repo specially designed to keep track of offshots.
> >
> No we just update it sometime or other. But with git it doesn't really
> matter I think.
>=20
> I think you best option is to approach OE with a plan to run such
> projects yourself and get the admins to put a crontab in for you which
> does the update nightly or something like that.

Well, it's indeed doesn't matter much technically, and not important
for one case. But as I pointed out, there're ~30 or something forks
around. Maybe it would be good visibility, and well, PR, if there were
official mirrors on popular git hosting sites where that number
(dozen or so) could be seen directly.

Otherwise, having asked if it's already there, I better just put up
my little stuff like everybody else did so far, and hopefully proceed
to submit patches/advocate them instead ;-).

>=20
> Graeme
>=20

--=20
Best regards,
 Paul                          mailto:pmiscml@gmail.com


