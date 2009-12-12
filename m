Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NJaao-0000D6-4C
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 23:37:42 +0100
Received: by yxe5 with SMTP id 5so1813867yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 14:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=QUsMd82g9HkSxpwShwaQrYd3pU52szf77qT+T8Ddvm8=;
	b=MoyQDMKVp0zqNIUxhrXFbGmgtZ0Q+KL7MIls/rSEoDknLXkbopva03AyE6YNK5bNS8
	JXkNVDDtu12QPLWyBp5QezW/HNUNszEwTompqaeqr3Dw7YKJFWGoQ7KF1fIZHnlnXs3o
	08jDSqzxdtMPi0M6cO8fimp/FNal+Tns721vQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vr92KtQIqOdQ/qSl0RiUOeYE61ffjkpVY8Rzg6bE9tAwF+ChAzszt+jh/ppcKf/0LE
	MJ3Tqrcmsw6G8YBQ1liff4HBlts3xh8DDwuclxqL7pxO/D+BSYEySxT0RkIaGwfSCV45
	lQ0oKC8xn8SrdCZjnhomQ8UdeoYm7C5F5/a5Q=
MIME-Version: 1.0
Received: by 10.101.3.26 with SMTP id f26mr4759679ani.5.1260657352654; Sat, 12 
	Dec 2009 14:35:52 -0800 (PST)
In-Reply-To: <hg126h$djg$2@ger.gmane.org>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
	<hg126h$djg$2@ger.gmane.org>
Date: Sat, 12 Dec 2009 23:35:52 +0100
Message-ID: <ac9c93b10912121435i13dd9c3ds6b37e46fd51dc4c9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Sat, 12 Dec 2009 22:37:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/12/12 Koen Kooi <k.kooi@student.utwente.nl>:
> On 11-12-09 09:39, Frans Meulenbroeks wrote:
>>
>> I bumped upon the following issue.
>>
>> Normally I use angstrom as distro, but this time I needed a small
>> image to be used in an initramfs.
>
> My initramfs built with angstrom is 80KiB and it has an fbdev GUI, how much
> smaller do you want to get with changing DISTRO?

80 kb is small enough for me.
What do you build to get that?

Frans


