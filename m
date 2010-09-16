Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1Ow2sK-00045b-Ls
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 03:03:17 +0200
Received: by pvg6 with SMTP id 6so232785pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 18:02:03 -0700 (PDT)
Received: by 10.142.253.8 with SMTP id a8mr2166111wfi.137.1284598923172; Wed,
	15 Sep 2010 18:02:03 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Wed, 15 Sep 2010 18:01:43 -0700 (PDT)
In-Reply-To: <AANLkTikaNwhtOdmJr1UdD-XwiWPK6BiONnbF2kr_hfRJ@mail.gmail.com>
References: <AANLkTikv=KA8R9FLpwyig+W9K-dAaSSN0Fw36dRQz7Rs@mail.gmail.com>
	<AANLkTikaNwhtOdmJr1UdD-XwiWPK6BiONnbF2kr_hfRJ@mail.gmail.com>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 16 Sep 2010 10:01:43 +0900
X-Google-Sender-Auth: IGvDQ3jscQCIpxl41FSq0JZ9fm8
Message-ID: <AANLkTi=ji5LULHX4e=E5WOOJEpPwZu5wikKUW2j70U4K@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sh: provide patch of __set_fpscr in libc
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
X-List-Received-Date: Thu, 16 Sep 2010 01:03:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi, Khem.


Thanks for your comment.

2010/9/16 Khem Raj <raj.khem@gmail.com>:
> Nobuhiro-san
>
> Same as you previous patch.
> =A0revise the patch and add increment PR for the recipes you modified
> and also rebase it
> on latest master.

OK, I wll do this.

Thanks,
  Nobuhiro


