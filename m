Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuBXV-0008Qz-Jf
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:26:01 +0100
Received: by fxm8 with SMTP id 8so4036521fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=nbOMJ64hGBazzZwG2vvMgriQeecE0MMspbz/Ky5vNpQ=;
	b=MU37ZH5x14+B+yTVGJwSZ9ju0oN/JMpPk76IZcG4YRqS7ZeZiCkYpxQDMqWAjhQgKC
	iuVhfG+IyJInmQ2d1t7q76hqBg5G7wxMSwKOxOCKAUvv8vbBH9ZT/DJMgOIwpiUsO09T
	iDouox6FUtWNwCz4GUyM54S7Noeg1ppBpZ1Cg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=NLW4L5Iqi2b+VV06PhlEO5/ZTn3gukJZXcLb7uRwVZNCT6hoaXq5XmHNiIOAvn83Mb
	cjibtvnDY+vSK0aL4wn3gCTmG4WRtjpfszqxq1q+VMmbkcESF8yvsfIGaSSsMUdeIa3H
	9PYw+oab0e3UzK8YMITtqYnO7ciiBheFLkWDg=
Received: by 10.223.100.2 with SMTP id w2mr7106256fan.115.1298931876060; Mon,
	28 Feb 2011 14:24:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 28 Feb 2011 14:24:16 -0800 (PST)
In-Reply-To: <4D6C0A15.1040406@eoimaging.com>
References: <4D6BAE92.1080409@eoimaging.com> <4D6BEEDA.3000203@mentor.com>
	<4D6C0A15.1040406@eoimaging.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2011 14:24:16 -0800
Message-ID: <AANLkTi=m78MJ2OLV-pQLyr7LiVTLSdHNrA4aKLXAVg6M@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: QA issues with libvmime
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
X-List-Received-Date: Mon, 28 Feb 2011 22:26:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 12:48 PM, Nathan Harris <nharris@eoimaging.com> wro=
te:
>
> Unfortunately, when I added pkgconfg to my inherit list, cleaned the pack=
age
> and then re-bitbaked, I still get the same error message. =C2=A0I verifie=
d that
> vmime.pc is removed during the clean process (along with the other temp
> files).

Is it also removed from sysroot ?


