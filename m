Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUUY4-0002lu-W0
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 03:32:57 +0100
Received: by qyk30 with SMTP id 30so982758qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 18:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6HvrVobsL+BiEfsEPyQMj2mUu6jIWzE0+wH/Ovv3jkI=;
	b=A2MAkZf7IG1uMqzFLgkjXfbmVlvB3sP4z5bV12E0y6iyOeIP3wjXFwBvFLJrkzXnEK
	c2xF1cIvmrOmat4cW401RnHSgFNi24ZYp4kcEDHVSHk5xIvm15uc80vczj2QGCQ3P2gA
	SJ5k5ptERU1elbur8GSasM/Oz9LhICDIN1m9w=
MIME-Version: 1.0
Received: by 10.229.61.167 with SMTP id t39mr4367801qch.226.1322360780429;
	Sat, 26 Nov 2011 18:26:20 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 18:26:20 -0800 (PST)
In-Reply-To: <CAP9ODKpfGKy-EuY=s=yFsgvfHb=6sc11Fit4jBqE8Ps7fiYn8g@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
	<4ED0C603.9020900@telia.com>
	<CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
	<CACW_hTZ6tkRGj938SAg4xmENwe-qRZMGpE=8-KvexQydgD-m_w@mail.gmail.com>
	<CA+M6bXnGhgrzZSuOe99ViWU=eZ5+Q+exWqWkstFJM-MCYzc6zQ@mail.gmail.com>
	<1322344896.16303.49.camel@mattotaupa>
	<CAFU7RzP-78tD6dYt+qj2=9EODOCyXAYLVyvn31yLtx+CG8TcoA@mail.gmail.com>
	<CAP9ODKpfGKy-EuY=s=yFsgvfHb=6sc11Fit4jBqE8Ps7fiYn8g@mail.gmail.com>
Date: Sat, 26 Nov 2011 19:26:20 -0700
Message-ID: <CA+M6bXmVAKZ2nRGTicCX5c3GhUF+V=yRre3JVnYgjhLkuzUHeQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sun, 27 Nov 2011 02:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 26, 2011 at 3:44 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Nov 26, 2011 at 20:37, Raffaele Recalcati <lamiaposta71@gmail.com>wrote:
>
>> ...
>
> Choosing now the baseline for dm3730 with my colleagues it seems that it
>> will be arago, that is still oe-classic, because Ti is releasing dvsdk
>> based on it. If Ti moves with arago to oe-core we move as well to it.
>> Very clean and simple decision, isn't it?
>
>
> Yes and you deal with the fork of it by your own. Simple consequence, isn't
> it?

Putting on my TI hat, Arago isn't a fork.  And, TI is moving forward
to oe-core/etc, but like everyone else with a timing problem, yeah,
timing problem.

-- 
Tom


