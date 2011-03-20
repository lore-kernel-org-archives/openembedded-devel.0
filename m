Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q1L7L-0005xI-DB
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 17:04:36 +0100
Received: by iyb26 with SMTP id 26so5775238iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TzZpyEi8+UT4p09pn8exxlgyvaIQA9L2h8fjMF3pras=;
	b=gOH/pWkIOVVdEudwNuuRqCpzdCvqgR9AqvXgfTG2uMn0svghcaXsusKjp9jCNPUl1c
	Lu6gGOUS92qy4spdfxIay0K2LgbxiEooesn/aJs1JVBEi+IoUAgc4F2Z0zdZOmJFkycu
	iBINp6RfxObtelh+n3V3DLw+DZzBV9p57iTSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B6MXYzmHaH1tqchBF7ADgCuzW0fxkUiZqUdGPmmz0m2EO5URSjOzwJ9+1BcccN1iG9
	fdYaT+zxdWwmdTsilu+n6dP5PdPg/dcSbCPMzo/yINhJQiKXD3QO+oOiCWCkLwM8umwE
	sDgRvrUST6rKkMK8RFH43jYq9FvYj6USMmL84=
MIME-Version: 1.0
Received: by 10.42.159.6 with SMTP id j6mr5128948icx.260.1300636966627; Sun,
	20 Mar 2011 09:02:46 -0700 (PDT)
Received: by 10.42.145.196 with HTTP; Sun, 20 Mar 2011 09:02:46 -0700 (PDT)
In-Reply-To: <AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<1300443329.9054.53.camel@phil-desktop>
	<1300496638.30423.2249.camel@rex>
	<AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
Date: Sun, 20 Mar 2011 18:02:46 +0200
Message-ID: <AANLkTinxSPA4NKWUuNGk4B7GzHO_CPtCS7g1EZxq+CGE@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Sun, 20 Mar 2011 16:04:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,


On 19 March 2011 10:28, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> To me being the maintainer of a recipe says that one cares about a
> recipe and tries to maintain it (as the word says :-) )
> Maintainership comes with responsibilities. If people do not want to
> take these responsibilities then they should not list themselves as
> maintainer.

I agree with this. It is the same way how it works for packages in
distributions too. Of course
since the maintainers are volunteers we cannot expect them to fix it
within the shortest of delays
of course. But it would make sense for the maintainers to be the
default caretakers.

> I feel a good way would be to define the role of a maintaner.
> And eventually recipes fall apart into two groups. The ones with a
> maintainer and the ones without.

For the others we could just have one big pool where random people can
commit patches
for the bugs, or where new contributers can start picking work from.
Eventually even become
maintainers in the long run.

> I have seen too many incidents where someone does not care about a
> package or bugs submitted to it, but if someone else steps in and
> fixes things, then suddenly the original author or maintainer feels
> they are stepped onto their toes, and react hostile.

Maybe time for a NMU (non maintainer upload) procedure if it turns out
this is an issue?

> In my view if you volunteer to maintain a recipe, that carries some
> obligations and responsibilities.
> If you do not want them, fine, don't step up as maintainer.
> If you do, act according to them.

+1
As long as we can make clear we appreciate the contribution and we
don't make people feel
like their efforts are not important.

Cheers,

Philippe


