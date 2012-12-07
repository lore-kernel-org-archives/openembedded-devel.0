Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Th5f5-00026n-7d; Fri, 07 Dec 2012 22:40:50 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1742009wib.6
	for <multiple recipients>; Fri, 07 Dec 2012 13:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HRebOi88SM1zS9eVBUOFDI8k7/AbFCvWL/rewCoGgLk=;
	b=LFgyrEpTyl2Nydd8hmtDEpMH1Jfgu1mLSmpIHGUlrcvk7OZnPjrhfbUYmeMEJPCgtM
	yJEZJ2CxFbdkDbl6loSswPX4tjcX9oQ3AZgnHNPu8S4CXDmhP8lN2v4+aTPy+nrfnckQ
	WLR1M6CD2kGDpRMEZRQyVUhZMkKuG3RfbFs5DZnOEkyi3zYDZD/cig33vzorgilNzcGK
	5iZpHy7QAL0tDjGsOJpe7zjjVOSu5ASDM50kNaCm0+IkrQ76T8PcydR25ph7fvVQZ/pK
	39Sc+jtkkQ/Inr6ESKsnrPegizKfhtgR8IR9WXClgQeDgTEaaFnp1/wdps7OWMQx0Pyz
	i84A==
MIME-Version: 1.0
Received: by 10.180.93.40 with SMTP id cr8mr610938wib.15.1354915580032; Fri,
	07 Dec 2012 13:26:20 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Fri, 7 Dec 2012 13:26:19 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Fri, 7 Dec 2012 13:26:19 -0800 (PST)
In-Reply-To: <CALbNGRSXXfTCopBJvf8g0j==zfkrOZGUbKzWt+7cftrkg4uFGg@mail.gmail.com>
References: <20121207100718.03FD5103F9@opal>
	<CALbNGRSXXfTCopBJvf8g0j==zfkrOZGUbKzWt+7cftrkg4uFGg@mail.gmail.com>
Date: Fri, 7 Dec 2012 22:26:19 +0100
Message-ID: <CA+chaQe=nnLUXm+6daq4ykBwo28k1n5ZDQLLusqJMX9TxOfu1g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : qt4: rename bbappends to match new 4.8. 4 version from oe-core
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
X-List-Received-Date: Fri, 07 Dec 2012 21:40:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There is patch to upgrade qt to 4.8.4 on oe-core ML.
On Dec 7, 2012 11:24 AM, "Andreas M=C3=BCller" <schnitzeltony@googlemail.co=
m>
wrote:

> On Fri, Dec 7, 2012 at 11:07 AM,  <git@git.openembedded.org> wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 421a73c9c3bea13e029cd0505711ef02753949bb
> > URL:
> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D421=
a73c9c3bea13e029cd0505711ef02753949bb
> >
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Wed Dec  5 22:00:13 2012 +0000
> >
> > qt4: rename bbappends to match new 4.8.4 version from oe-core
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Sorry but I don't see the oe-core commit neither on
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-qt/qt4
> nor
> https://github.com/openembedded/oe-core/tree/master/meta/recipes-qt/qt4
> nor
> did I find commit notification in my emails.
>
> What happened?
>
> Andreas
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>

