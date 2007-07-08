Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1I7VJp-00017c-GB
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2007 13:52:51 +0200
Received: from pd9539a0c.dip0.t-ipconnect.de ([217.83.154.12]
	helo=olympus.klever.net)
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1I7V4t-0006Vr-IY for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2007 13:37:24 +0200
Message-ID: <4690CC28.4000907@klever.net>
Date: Sun, 08 Jul 2007 13:36:08 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <513012886.20070708041151@gmail.com>
In-Reply-To: <513012886.20070708041151@gmail.com>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Sun, 08 Jul 2007 11:52:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>    Now with formfactor around, I guess it would be nice to use
> consistent variable names for the same info. Marcin still suggested to
> use MACHINE_ prefix for build-time (i.e. machine config) variables.
> So, the exact topic of this RFC is adding
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=
> MACHINE_DISPLAY_HEIGHT_PIXELS=
> 
> to machine configs.
> 
>    It's a bit verbose, hence this RFC to discuss exact naming
> conventions. Otherwise, I'd like to keep in on pragmatic side -

I type fast, so I'm all for these names. Also, what comes into my head 
is xtscal (or what was the name?) and psplash scripts which may also 
benefit from some information regarding orientation.

Love,
H


