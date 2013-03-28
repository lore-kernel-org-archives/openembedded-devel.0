Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1ULFda-0005IQ-FI
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 17:25:17 +0100
Received: by mail-ob0-f175.google.com with SMTP id va7so6226938obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=QDCn4YeoWXQhx2nL11NThQ+7sVZTa6M0vbalfrbfmKw=;
	b=mjTCHRJBfwIB7+3HAf1F1GoNrrVtKo3T1MMudlBzLIFjYmR325+B9ViiXG1T52WmFC
	rzSc+KXZ7iuir/xn+zxp8/IKqxY2kUeZAsxDoftrftuz5iirTLQFruAivRLW2f86GrUu
	mNgVsienkiSwXnLoCzjGR1cLcoAI+rjQLzjgSaVGAbxVaqgm1nBiVzZPna0hk/Qy9gtw
	0tSEZ2jGJJx852ZMtJejpSw9Us5BIUlkeGypp7RJJkb6n3UurCGJMcjDe2o2XyW/1WJz
	s7rIImmPG+J+CgzTNcGDyjBTrjAiLycwExarDZBE8bYhRf1rDJywO4ERMuvOZ8nhyP0T
	C2HA==
MIME-Version: 1.0
X-Received: by 10.60.28.37 with SMTP id y5mr6592013oeg.134.1364486891254; Thu,
	28 Mar 2013 09:08:11 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Thu, 28 Mar 2013 09:08:11 -0700 (PDT)
In-Reply-To: <748453ED-9798-48BC-9C60-158A22EA82BE@gmail.com>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
	<748453ED-9798-48BC-9C60-158A22EA82BE@gmail.com>
Date: Thu, 28 Mar 2013 16:08:11 +0000
X-Google-Sender-Auth: 4zZyAptTv4wS9UcAOfMDPgOWYNQ
Message-ID: <CANyK_8eU2E2VPjroU+nuQ7pkpYABE4-utjHyfTR3vBg+Uez_eQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Cc: Tom King <ka6sox@gmail.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 16:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 March 2013 16:00, Khem Raj <raj.khem@gmail.com> wrote:
>
> exactly, send the tar ball to Tom he will populate the oe mirror.
>

In which case, these two need adding to the mirror:

ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/live.2011.03.14.tar.gz
http://fossies.org/unix/www/gd-2.0.36RC1.tar.gz

I think I'm going about this the wrong way by just throwing patches at
the list when I'm not so experienced with OpenEmbedded. I'll slow down
a bit and ask questions about what the best solution is before I send
a patch. I am currently trying to build just about everything I can
for my raspberrypi to create my own package repository I can install
from so it does mean that most of the current recipes will get a good
testing.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


