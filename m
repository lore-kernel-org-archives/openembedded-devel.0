Received: from [68.142.199.245] (helo=web33613.mail.mud.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.61)
	(envelope-from <fransmeulenbroeks@yahoo.com>) id 1GKUlF-0000vQ-9N
	for openembedded-devel@openembedded.org; Tue, 05 Sep 2006 08:50:17 +0200
Received: (qmail 72161 invoked by uid 60001); 5 Sep 2006 06:47:33 -0000
Message-ID: <20060905064733.72159.qmail@web33613.mail.mud.yahoo.com>
Received: from [161.85.127.139] by web33613.mail.mud.yahoo.com via HTTP;
	Mon, 04 Sep 2006 23:47:33 PDT
Date: Mon, 4 Sep 2006 23:47:33 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.580.1157393016.22819.openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Re: Improving consistency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2006 06:50:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


> Hi developers,
> 
> when you are adding new versions of a bitbake
> recipe, please
> take a chance to reorder the metadata according to
> the
> "standard" layout found in
> http://openembedded.org/wiki/StyleGuide

Mickey,

Thanks for this nice template. I've actually always
wondered what the preferred order was.

Perhaps it is a good idea to write a small section for
each variable (just as is done for MAINTAINER)
describing what the purpose and expected content it.

I, for me, am most of the time puzzled what to put
into the SECTION field, which often ends that I leave
it out.

Maybe the guideline should also state a little bit
about newlines. I would like to see newlines after
every do_... function (and perhaps also before and
after SRC_URI).

One minor gripe: I'm not too happy about the rule that
the maintainer address should be unobfuscated. I'm
getting more than enough spam already, so I'd rather
keep it at fransmeulenbroeks at yahoo dot com.

Can we relax this rule somewhat?

(btw there are also some packages that point to
nslu2-linux at yahoogroups dot com or something like
that. I'm more than happy to fix the header if I
stumble upon one, but I'd rather not take
maintainership of those packages). Not sure who the
real maintainers is in all cases though.

Anyway: thanks for bringing this up. I'll make sure
that my packages become compliant.

Frans

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


