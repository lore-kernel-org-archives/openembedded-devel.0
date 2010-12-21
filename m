Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PUxZA-00028z-QX
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 09:27:29 +0100
Received: by qyk36 with SMTP id 36so3593584qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 00:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nNvDsvnaeB9M2bk3RaXtNvcTvsm65nZkdZXmRW6EuK4=;
	b=e5wG6+5mwKYIoRzmlfcYXsQnwYUFmub0XW0Yxc8ZxQaG8Oxj9uNJsOXPnl7Rdg16dn
	v3XtJcF2t2L2bjiNfBKQAxQhJKG+HqtvKay0Gb3LhtH1rdBpY8elKXBKKGI+9VnU4E0s
	QRo5Ft6+ngOHY8hEO9L53PScNM0497ekd5XjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YUEQh8e/kXVoKpqlRCN9ha/DCnEevOxFjj+kZXPN/COXMnPL9N9ryzCXYFyatzpENC
	o+ZBjAbQk2sOD4dXLudStlT1/+E3ZxmFlpQ0gGDprE/EFEqdtqIdrQ2mPP5FFYCSnAA0
	Du7i7m42lcRE164daPon3jdensyAdRpxzp31s=
MIME-Version: 1.0
Received: by 10.224.67.211 with SMTP id s19mr4999017qai.142.1292920040566;
	Tue, 21 Dec 2010 00:27:20 -0800 (PST)
Received: by 10.229.211.198 with HTTP; Tue, 21 Dec 2010 00:27:20 -0800 (PST)
In-Reply-To: <AANLkTim+M3jX41Ryk-wJ4OOyJ6o--Vq89dCS3=aUYC9r@mail.gmail.com>
References: <4D0FB245.90008@gmail.com> <20101220213243.GD17904@gmail.com>
	<4D0FE2CC.5050003@gmail.com>
	<AANLkTim+M3jX41Ryk-wJ4OOyJ6o--Vq89dCS3=aUYC9r@mail.gmail.com>
Date: Tue, 21 Dec 2010 09:27:20 +0100
Message-ID: <AANLkTinTsbFrf+AWZDYTL0UuVkM9648Nt_STiZXf0NPa@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Tue, 21 Dec 2010 08:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

> which ubuntu version are you using

Ubuntu 10.10
As for the linker: GNU ld (GNU Binutils for Ubuntu) 2.20.51-system.20100908

Regards,

Jan


