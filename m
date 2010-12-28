Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXUgr-0007tw-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 09:13:54 +0100
Received: by iwn8 with SMTP id 8so9550826iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sIJABwNylmY7f80yJbuqz9ZXibKZLfju9FJLSrOh2i4=;
	b=Z+m5m+AbRT1XkZPfIcjYFuPtN2Wkh/PC9U4gSmzTwtaKEriDG9Lfex5P578MLfeaYr
	uap8QNtyUU2uwXOvgXkeSoPOrU/XO+w0aOrbHCWOFvjdWvPi1xjFFENzN6PR+j+v84MS
	A1OB95tV/aaQNO5vl9/njpDN5AN+J9qRUqTI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kX4iEjFpTrcDz+36Q83NuWRZuHYwJe5/2Vqqf9vHJXyHINkcTDjdFP65/FlDh1Aq92
	Cs1T7bhlN3MPSA/4LtEYqI88X3DH6uMAQJ6cEseG8VZugq7gNRzI7rrzj2YdOocO7N9z
	wakrBO7gqMzxVq+pZK+x0ti02O4vQnjn6pMcg=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr13176215ibv.32.1293523971346;
	Tue, 28 Dec 2010 00:12:51 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 00:12:51 -0800 (PST)
In-Reply-To: <1293492484-13523-1-git-send-email-bgamari.foss@gmail.com>
References: <1293492484-13523-1-git-send-email-bgamari.foss@gmail.com>
Date: Tue, 28 Dec 2010 09:12:51 +0100
Message-ID: <AANLkTin-A9NjN_heXGtk1k=9WTrKPoaAa0i=bP5B41zU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Boost 1.45
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
X-List-Received-Date: Tue, 28 Dec 2010 08:13:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/28 Ben Gamari <bgamari.foss@gmail.com>:

[...]

> After quite a few exchanges with the boost folks and many hours of frustration,
> I think I finally have a working recipe. I'd appreciate it if people could try
> this and perhaps give some feedback. I can successfully build the package, but
> given the quirky nature of the build system it seems likely someone will find
> some configuration-specific issues.

Ben,

Thanks for your email, but....

If you do not attach or inline your recipe it is highly unlikely that
you will get any feedback.

Best way is to make a patch and commit in git then use git
format-patch  and git send-email to send the patch to the list.

Frans.


