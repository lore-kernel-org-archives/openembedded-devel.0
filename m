Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1QMGa7-0006rv-8D
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 11:28:47 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 207A01D36131; Tue, 17 May 2011 11:25:50 +0200 (CEST)
Date: Tue, 17 May 2011 11:25:50 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110517092550.GG1544@ibawizard.net>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
	<1305564582.2429.90.camel@phil-desktop>
	<BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
	<iqt55i$59d$1@dough.gmane.org>
	<BANLkTikg=j9+Y-o8CfXEpBbY51u+tBLa8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikg=j9+Y-o8CfXEpBbY51u+tBLa8A@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Tue, 17 May 2011 09:28:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Anders Darander <anders.darander@gmail.com> [2011-05-17 09:04:35]:

> Yes, from that point, Dbus was not the optimal example, I agree...
> 
> Though, that was only one example of a package that has either runtime
> or only build-time dependencies on X in some form or another. Earlier,
> in the 2011.03-releases, we had systemd depending on gtk+, which has
> been removed in the lates updates. Thats just another example.

Don't worry, you're not alone in that feeling, actually I think, that we're
quite a large group fighting with this :-) One day the image has 1700 tasks,
after one rebase within a week timespan it grows almost to 3000, don't mention
bluetooth and similar stuff etc. Well, I'm also looking forward to see, how it
will change with oe-core.

-- ynezz


