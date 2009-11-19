Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NB77f-0004xJ-3C
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:32:34 +0100
Received: (qmail 6460 invoked by uid 1003); 19 Nov 2009 13:31:05 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 19 Nov 2009 13:31:05 -0000
Message-ID: <4B054898.4040409@balister.org>
Date: Thu, 19 Nov 2009 08:31:04 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911190116480.18080@localhost>
In-Reply-To: <alpine.LFD.2.00.0911190116480.18080@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: the latest scoop on guile (native) build failure on fedora
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
X-List-Received-Date: Thu, 19 Nov 2009 13:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2009 01:22 AM, Robert P. J. Day wrote:
>
>    just FYI, as a benchmark for a native build, i downloaded the
> guile-1.8.7 tarball and tried to build it on my system with your basic
> "make; configure".  that failed exactly as the OE build has been
> failing.
>
>    as a last resort, i downloaded the fedora source rpm and tried to
> use "rpmbuild" to rebuild the binary package.  same failure.  so this
> is clearly a guile/fedora issue, nothing to do with OE.
>
>    i'm about to bugzilla this, but i'm wary only because i'm running on
> a sort of f12 system that is f11 but rawhide updated, so it might be
> that there's a subtle version mismatch.
>
>    if someone out there has either a pure f11 or pure f12 system, feel
> free to download the guile-1.8.7 tarball:
>
>    ftp://ftp.gnu.org/pub/gnu/guile/guile-1.8.7.tar.gz
>
> and try nothing more than untar/configure/make and see what happens.

Built OK on F11. I'm afraid to upgrade to F12 atm :)

Philip


>
> rday
>
> p.s.  install libtool-ltdl-devel first.  philip?  want to give that a
> shot?  should take only a couple minutes and will go a long way to
> isolating what the mutt is going on here.
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


