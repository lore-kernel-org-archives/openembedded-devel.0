Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QHOZA-0000q7-NX
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 00:59:40 +0200
Received: by pwj9 with SMTP id 9so279835pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=0hrWJCpRENrCzyp7dQF0GVmU1/xjEXw+nR02EVv5VJY=;
	b=n7Q+LZBZ0om/bDPwWHHct0kwQ6bV/2t0v45IN7111dPu6+/9fLTziK1a8oGKjxvqM4
	eFXT0YiDancBHIzedpqwkcyQL7l2STbYrt7urq/k+k9RCftrZxDc8SGtfYPhuHJsta/S
	8Upos2sHUS5+jpBzECm4el5jOhyBhsewbuhtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Eumh2iV1kqWDktM4tSRLacHTn1ql6r2pmoFG/KRYw+zN0+bQnJ4UNk2+ygBsCP5G+q
	orz0cKXmJTiDY+TjOAh2qW844qpiSfLYx6z/iulDwRh8jW/dZfa3IoeAZJCwYi+/F6/f
	zfeNZNzy4lQ//4IzzKXD+eQhf+z8CbD27EE1g=
MIME-Version: 1.0
Received: by 10.142.150.34 with SMTP id x34mr213952wfd.165.1304463421328; Tue,
	03 May 2011 15:57:01 -0700 (PDT)
Received: by 10.142.187.8 with HTTP; Tue, 3 May 2011 15:57:01 -0700 (PDT)
In-Reply-To: <4DB41CB6.6020809@mlbassoc.com>
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
	<BANLkTik92_-9VB08Rfgx-ewWscrbCyspnQ@mail.gmail.com>
	<4DB41CB6.6020809@mlbassoc.com>
Date: Wed, 4 May 2011 00:57:01 +0200
Message-ID: <BANLkTimiht1P9B2gwC4x=A7x3MjxfYXWvw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Tue, 03 May 2011 22:59:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>>> Signed-off-by: Petr =C5=A0tetiar<ynezz@true.cz>
>>
>> Looks ok.
>>
>> Acked-by: Khem Raj<raj.khem@gmail.com>

Already in oe-core.

Acked-by: Andrea Adami <andrea.adami@gmail.com>


Pushing
Thanks


