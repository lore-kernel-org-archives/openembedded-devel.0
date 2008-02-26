Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JTxCx-0005do-Q8
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Feb 2008 11:38:55 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1377499ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2008 02:38:14 -0800 (PST)
Received: by 10.67.23.5 with SMTP id a5mr4602128ugj.8.1204022294180;
	Tue, 26 Feb 2008 02:38:14 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id l22sm2322836uga.30.2008.02.26.02.38.10
	(version=SSLv3 cipher=OTHER); Tue, 26 Feb 2008 02:38:10 -0800 (PST)
Date: Tue, 26 Feb 2008 12:41:05 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080226124105.2ae8126a@widy.localdomain>
In-Reply-To: <47C3A35D.3000605@gmail.com>
References: <47C313E7.4080202@gmail.com>
	<c384c5ea0802251236t51f5d708yad496c69e13ccb99@mail.gmail.com>
	<47C32843.8010302@gmail.com> <47C35E7F.10907@balister.org>
	<47C3A35D.3000605@gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.168
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Google Summer of Code
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
X-List-Received-Date: Tue, 26 Feb 2008 10:38:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 25 Feb 2008 23:27:57 -0600
Jacob Thebault-Spieker <summatusmentis@gmail.com> wrote:

> Erik Hovland wrote:
> 
>  > You would have a better chance of submitting this idea to the Maemo
>  > or Mplayer groups.
>  >
>  > I am not likely to administer the hh.org SoC again this year. So I
>  > can't say whether you should submit your idea there.

That's sad news ;-I.

>  >
>  > E
>  >
> 
> The difference is, I don't feel like this idea really fits with
> MPlayer, and I don't have a Maemo device to test it. I'm sure there's
> some sort of virtualization, but I'm familiar enough with
> OE/Angstrom, that I felt like this would be a good place to start.

If you're still on the idea on the player frontend, then for MPlayer
there's gnome-mplayer, which suits smallscreen devices quite well
(works OOB even on qvga), provides good functionality and is
maintained. That doesn't mean that you can't come up with the idea of
better player, just that it's not the brightest of things which could
be done for GSoC.

> 
> Philip Balister wrote:
>  > What are the deadlines for SoC? I'm not sure if we will have the
>  > infrastructure in place to do direct OE SoC projects this year.
>  > I'll ping the board though.
>  >
>  > Philip
> 
> Mentoring Organizations apply between March 3 and March 12, and then
> the students apply later in March, between March 24 and March 31.
> This needs to happen soon, otherwise OE/whatever OE based distro
> won't be able to apply. Perhaps it's partially on me, and not
> bringing this up earlier, but I was kinda waiting for the dates to be
> released.

By comments above I gather that GSoC participation wasn't discussed on
OpenEmbedded e.V. (quoting that just to hint that OE now should have
all bureaucratic infrastructure to participate directly) meeting held
just 2 days ago... Sad again.

OpenMoko participated last year, so may be a good place to hang on. And
there're plenty things to do there, even skipping application-level
stuff. Just let me point to the problem of having a standard device
control daemon, to which OpenMoko people, per their own words, can't
get by years:
http://www.vanille-media.de/site/index.php/2007/11/27/collaboration-launch-on-phoneserver-and-devicedaemon/

> 
> Jacob Thebault-Spieker

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


