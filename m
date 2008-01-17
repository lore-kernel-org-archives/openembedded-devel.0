Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JFVpa-0002Ca-KV
	for openembedded-devel@openembedded.org; Thu, 17 Jan 2008 15:34:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JFVpT-0005fi-G2
	for openembedded-devel@openembedded.org; Thu, 17 Jan 2008 14:34:51 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 17 Jan 2008 14:34:51 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Jan 2008 14:34:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 17 Jan 2008 15:34:41 +0100
Message-ID: <fmnp24$rob$1@ger.gmane.org>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>	<413710907.20080117131841@gmail.com>	<478F4876.9030405@student.utwente.nl>
	<1012527691.20080117145250@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <1012527691.20080117145250@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Thu, 17 Jan 2008 14:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Paul,

thank you for pointing out the problem and a template solution towards
the end of your initial rant as well.  In fact I am already working on
moving the mid-term fix into a separate package to provide an even less
intrusive mid-term fix -> http://oz.leggewie.org/wip/wifi-suspend.patch

But...

Paul Sokolovsky schrieb:
> and of course they need to be supported still, and right now. The question
> is how that is done - if it comes mixed into one big mess
                                                       ^^^^
> I don't appreciate someone moving in the opposite direction just to solve on-spot problem. OE is
    ^^^^^^^^^^^^^^^^
> powerful environment allowing to solve make focused, maintainable and
> reusable changes - even if they're workarounds, and people should
> learn to use them.

And I don't appreciate after I have

* fixed a real usability issue which likely strongly influences the
  perception of OE-derived distros
* consulted with a *LOT* of people on IRC and in the bug tracker over
  several days
* have put quite some time into finding an acceptable solution for
  everyone

that someone comes around who had previously been quiet on this and then
calls my work a "mess" and generally finds very unappreciative words for
what I've done and the time I've spent.

Mickey's comment

# I agree. The issue to fix is worthwile, but I would prefer seperate
# packaging as well.

sounds quite different, don't you agree?  FOSS is an incremental process.

I am willing to get this not only right for me, but to everyone's
satisfaction.  But I kindly want to ask you to consider that it is not
only what you say but also how you say it.

PS: I don't intend to and hope I did not start another flame war, but
this is important to me.



