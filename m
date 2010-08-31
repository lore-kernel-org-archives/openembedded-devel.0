Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OqZ1X-0003Od-Ob
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 00:09:54 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 9517716606B2; Tue, 31 Aug 2010 16:09:10 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id C65D01660390;
	Tue, 31 Aug 2010 16:09:09 -0600 (MDT)
Message-ID: <4C7D7D85.9020903@mlbassoc.com>
Date: Tue, 31 Aug 2010 16:09:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
In-Reply-To: <AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Tue, 31 Aug 2010 22:09:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2010 05:05 AM, Cliff Brake wrote:
> sending again as it appears the last email did not make it ...
>
>
> ---------- Forwarded message ----------
> From: Cliff Brake<cliff.brake@gmail.com>
> Date: Mon, Aug 30, 2010 at 11:51 AM
> Subject: testing branch 2010-08-30
> To: openembedded-devel@lists.openembedded.org
>
>
> Hello,
>
> Last weeks testing cycle was a good success I think -- thanks to all
> who participated.
>
> http://wiki.openembedded.net/index.php/Testing
>
> I have tagged the branch with an annotated tag that includes what built:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-08-23
>
> It seems like we are getting good coverage of target machines,
> distros, and host machines.  I would like to add a target to get some
> coverage of Qt x11 and Qt embedded.

Did you have some machine/distro/image combos in mind?  I can put some
of my machines on this if I know what to build.

Right now, I'm attempting
   MACHINE=qemuarm
   DISTRO=angstrom-2010.x
   IMAGE=opie-kdepim-image
I'm not sure if this combination makes sense, but I thought I'd see
what happens.

>
> Ideas on how to make this better are appreciated.
>
> One change from last week -- I renamed the testing-testing branch to
> testing-next as I think that is a little more descriptive.
>
> The testing-next branch has been updated for the next testing cycle,
> and is ready for builds.  Please see
> http://wiki.openembedded.net/index.php/Testing if you would like to
> contribute tested combinations.
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


