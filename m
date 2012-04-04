Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFKrx-0000eA-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 09:43:05 +0200
Received: by wibhj13 with SMTP id hj13so233130wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xpF3IuiNtpMRZY525qXq4OUMq38F09vO3Eetxk5OSGE=;
	b=IhfxrDPAWqWg0R+7XGO0ykWF5VE8yoDJ3RI4/2ZwAt0cYmoNyfuQQj9Mw7+wtVpVQg
	rZualNTPgy4npyR5HWiIkvvKGcg6boIF3a0SQgyQxI8pOJ7L7QtUzpOviTrPtxY8Bw5K
	J2nMyFfzK/zV1rQwmS+DpjmxwjGvxxQvyj4rWB7cbjca7mIPTuP8jGdcr+t388fLCyGR
	il0hKInrY+ds/CKhAkAFeu0T9xm48krsZuPtkcE9XC2J0xmSm5SmbvBXVa/bHC6UVQgs
	b6+Mz7mUL40fdIOq0lNXIXrw/Mt2iVitZVoYEimNLqOfJzXKajoXiFR54d7vjSxhBzvp
	d0ZQ==
MIME-Version: 1.0
Received: by 10.180.79.72 with SMTP id h8mr2765658wix.1.1333524835738; Wed, 04
	Apr 2012 00:33:55 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Wed, 4 Apr 2012 00:33:55 -0700 (PDT)
In-Reply-To: <20120404091720.4b743c5b@eb-e6520>
References: <20120404091720.4b743c5b@eb-e6520>
Date: Wed, 4 Apr 2012 09:33:55 +0200
Message-ID: <CAGiJk9f-i=-tg=o_8qoxn8pBVaaeYwebVZeMu8H2jLuux4ah5w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 07:43:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/4 Eric B=C3=A9nard <eric@eukrea.com>:
> Hi,
>
> would that make sense to support systemd as a DISTRO_FEATURES ?
> That would make builds using older udev (< 174) possible with meta-oe as
> this actually fails because of systemd.
>
> Eric
>

Hi,
there was that discussion before,
Martin already gave an overview.

You can read the previous discussion here:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg23=
720.html


--=20
Regards
Samuel


