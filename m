Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <ilya.yanok@gmail.com>) id 1J6lpA-0001TZ-EF
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2007 12:50:29 +0100
Received: by py-out-1112.google.com with SMTP id a25so3524974pyi.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2007 03:44:54 -0800 (PST)
Received: by 10.142.239.11 with SMTP id m11mr896260wfh.165.1198496693970;
	Mon, 24 Dec 2007 03:44:53 -0800 (PST)
Received: by 10.143.40.7 with HTTP; Mon, 24 Dec 2007 03:44:53 -0800 (PST)
Message-ID: <9ba889b00712240344w76b8b5abha78ef8376930be9c@mail.gmail.com>
Date: Mon, 24 Dec 2007 14:44:53 +0300
From: "Ilya Yanok" <ilya.yanok@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <476F6461.3070105@linuxdevelopment.de>
MIME-Version: 1.0
References: <9ba889b00712231913y6e07f05ci23cb36444c325a40@mail.gmail.com>
	<476F6461.3070105@linuxdevelopment.de>
Subject: Re: [RFC] AVR32 stuff
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2007 11:50:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello!

2007/12/24, Robert W=F6rle <robert@linuxdevelopment.de>:
> I am also "supposed" to get this avr32 flying.
> But am also stuck at getting correct gcc stuff up via oe.
> Maybe we can lign up togethere and share. I currently had the most
> success out of the atmel provided gcc toolchain.
Ok. Actually I managed not only to build toolchain with oe but today
I've created my first minimal-image with it. Unfortunately, init
crashed with segfault... Don't know... needs further investigation.
If you interested in my work, let's discuss how we can share it.

With best regards,
                             Ilya.


