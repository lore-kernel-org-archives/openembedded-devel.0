Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvOgc-0005Sr-HT
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 08:08:13 +0200
Received: by iwn2 with SMTP id 2so5863111iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 23:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=H0/PEF379Cv/mRO/10PyNsztcmUDyOv3pDLZ37kIFQc=;
	b=BqcEVg1bhlubPumAZL4r6Ckn7xwYdqopCiXnyO86aaQrTpz/Pqtp4FiE1qwwTvi3d+
	cpEsXmso7ujGUeAteR0NwrmIMrit02B3g3V+n30X8+YkR4GI4PkbhG0pn5liLblaRJBl
	KeRThefoh1bDQLf4fQ56dWab60KVpadN11rlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CA3z5RawdbFdzy+iGXUk0cdqyJxLSk//0VkLh8PN3VqomVxVNoKe1geTh/F+1h4BN6
	w6MD5MVpeDoXZnzik9noLGBPUwpiT5oGS5qM4VrJHO7aPQtJaNjTb2YEKKsZUcXABYjj
	toQUuQnZE+TmFU1v86v7OC606xHs3NZeKwaco=
MIME-Version: 1.0
Received: by 10.231.148.85 with SMTP id o21mr7491208ibv.26.1284444443948; Mon,
	13 Sep 2010 23:07:23 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Mon, 13 Sep 2010 23:07:23 -0700 (PDT)
In-Reply-To: <AANLkTimgeqXcCwNkTsEV8rqYwiZGpKCANODxDtkN8q=p@mail.gmail.com>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8E8FC5.4020507@balister.org>
	<AANLkTi=fJWrPssjGvPENzuHsXaPmCZTJRRGmzoJxyx9u@mail.gmail.com>
	<4C8EBBC8.1060605@gmail.com>
	<AANLkTimgeqXcCwNkTsEV8rqYwiZGpKCANODxDtkN8q=p@mail.gmail.com>
Date: Tue, 14 Sep 2010 08:07:23 +0200
Message-ID: <AANLkTi=6TfmGXPmeAF035U2BJNThfscBFyErAzyd5LYT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 06:08:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/14 Chris Larson <clarson@kergoth.com>:

>
> As Graham points out, this was an error in bitbake master, not in OE. =A0=
Just
> pushed the fix, sorry for the delay -- had some network issues that
> prevented getting to the git server yesterday.

Maybe in the testing page we should also indicate what version of
bitbake is used to build (e.g. 1.8.18, 1.10, bitbake head, ...).
I'll try to kick off my tests later today.

Frans


