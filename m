Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQY7n-0005q2-FI
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 08:38:03 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so4774698ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 23:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pGoGMs0MMuovKMgDxAByeCFWRAbeV5YKJ0CILCKYlsU=;
	b=y+ln+JjvRfBjSsxXJurAdzWY3qveTRzFX4vmdG9KGg+5VqMPYz7iufmu3eKJRYt83l
	r3CWYGMoP3VREFzCY7XcxFxn2hLKo/mYCKkx+tgzGzkbxx0znwpuQwY9E516zCf6w3O0
	0bcndxGFgfknagqYg3mLzyE51LsDsKoHEl1HBkEp4ei1a8x32io5yd3nfMRFZ1LQFiLu
	fEIWKT8tVFJ/uX6V93u9ISIu3xBRmaBiJtCZY59dnOvtp66NP3OvN+C66uOzQb6UCahJ
	JUXsPPxAn0//H0c/x5xEPYO9RiZ/794ASk9SkJ+5mu4Kdjr90on5csGuP5oSg0P1X42T
	hAZQ==
MIME-Version: 1.0
Received: by 10.50.135.38 with SMTP id pp6mr19144707igb.36.1350973477060; Mon,
	22 Oct 2012 23:24:37 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Mon, 22 Oct 2012 23:24:36 -0700 (PDT)
In-Reply-To: <CAMQ5J2ZsmYhjG-3Ket0hft1xL7uS2qomyxywQAaZMidoC+Ps5A@mail.gmail.com>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
	<CAMQ5J2bVMpK6+uX4Rbi0spKLduy5of4JX2esXZbOE5k_muvATg@mail.gmail.com>
	<CAGiJk9cJq2uQXBw6GtXg8gc=MSdHp7Y_ZVgRP6FiE8gLsLiN+g@mail.gmail.com>
	<CAMQ5J2ZsmYhjG-3Ket0hft1xL7uS2qomyxywQAaZMidoC+Ps5A@mail.gmail.com>
Date: Tue, 23 Oct 2012 08:24:36 +0200
Message-ID: <CAGiJk9cj48mrJ7aNo9nu=SUsLws6rn9hKG8fJZmGRaMGZ548cw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Tue, 23 Oct 2012 06:38:03 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 RaNgErS <rangers.av@gmail.com>:
> Hi,
> I am already sent a mail about this before 3 weeks to admin. And it is not
> posted .
>
> I have posted the same in the following link. Pardon me for providing an
> exterrnal link .
>
> http://stackoverflow.com/questions/12909202/openembedded-do-rootfs-failed

Hi,

this error is unrelated to the patch,
but this is the right mailing list for your question.

Unfortunately I didn't work with OE-classic,
therefore I can't help you much.


This patch is related to the new OpenEmbedded (Core),
see [1] for a short explanation of the differences.

There is a good chance that others will help you out,
you might start a new "topic" to increase the visibility of your request though.
E.g. post a new mail with the complete problem description not as
reply but as new thread.


[1] http://www.openembedded.org/wiki/OpenEmbedded-Core#Differences_to_OE-classic


-- 
Regards
Samuel


