Received: from [209.85.216.184] (helo=mail-px0-f184.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1Mx0kl-0006p1-D1
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 17:54:38 +0200
Received: by pxi14 with SMTP id 14so9126736pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 08:53:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.196.7 with SMTP id t7mr354875wff.90.1255276421691; Sun, 11 
	Oct 2009 08:53:41 -0700 (PDT)
In-Reply-To: <200910111658.23873.holger+oe@freyther.de>
References: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
	<200910111658.23873.holger+oe@freyther.de>
Date: Sun, 11 Oct 2009 23:53:41 +0800
Message-ID: <fd72b8f50910110853u46dc80dbr5ba7410e0a6a0840@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.184
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Sun, 11 Oct 2009 15:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ni Hao too, haha.
How could you know I'm Chinese ^_^

Thanks, I'll check it.

2009/10/11 Holger Hans Peter Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
>

> On Sunday 11 October 2009 16:37:19 mail mail wrote:
> > Hi, all
> > I'm compiling x11-sato-image. I chose mini2440 as my machine and angstrom
> >  as distro.
>
> Ni Hao,
>
> sorry this is not how it is working. Ask on IRC or google/baidu first.
>
>
> You are using a fortify enabled compiler and the open call lacks a third
> argument. Just create a patch to change the open call to have the access
> mode
> in it as well, send a patch, we will be happy to apply it.
>
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

