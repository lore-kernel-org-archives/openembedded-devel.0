Received: from 10.mo4.mail-out.ovh.net ([188.165.33.109]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>) id 1TtdcQ-0003bh-20
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 13:21:54 +0100
Received: from mail413.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 5653E104FA53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 13:06:42 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2013 13:57:19 +0200
Received: from host3-118-dynamic.54-79-r.retail.telecomitalia.it (HELO
	localhost.localdomain) (denis%eukrea.com@79.54.118.3)
	by ns0.ovh.net with SMTP; 11 Jan 2013 13:57:18 +0200
Date: Fri, 11 Jan 2013 12:57:18 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20130111125718.7dea35e9@no-log.org>
In-Reply-To: <CAP9ODKow8h_AiLnnMtO8esbR=X5CPA5nLiz41PBEFOi_nkVKCw@mail.gmail.com>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
	<20130107193340.GH3285@jama> <20130110123931.2dbeb03f@no-log.org>
	<CAP9ODKow8h_AiLnnMtO8esbR=X5CPA5nLiz41PBEFOi_nkVKCw@mail.gmail.com>
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.14; i686-pc-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 18311073135329443452
X-Ovh-Remote: 79.54.118.3 (host3-118-dynamic.54-79-r.retail.telecomitalia.it)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-browser][PATCH 1/3] scripts/firefox-gen-l10n-recipes: Update copyright to 2013
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
X-List-Received-Date: Fri, 11 Jan 2013 12:21:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Jan 2013 09:42:38 -0200
Otavio Salvador <otavio@ossystems.com.br> wrote:

> On Thu, Jan 10, 2013 at 9:39 AM, Denis 'GNUtoo' Carikli
> <GNUtoo@no-log.org> wrote:
> > On Mon, 7 Jan 2013 20:33:40 +0100
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> >> On Sun, Jan 06, 2013 at 08:12:57PM -0200, Otavio Salvador wrote:
> >> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>
> >> I've build tested all 3 on jenkins and looks good to me:
> > It does the same than the previous version of firefox:
> > root@om-gta04:~# firefox
> > Illegal instruction
> >
> > om-gta04 is an armv7 machine with NEON.
> > I think it's a toolchain issue.
> 
> What arch is it? Can you check which instruction is it?
last time I tried to debug it it was an issue in the trampoline code
for javascript, and was because of thumb issues, I also remember that
the safe mode of firefox worked...

Denis.


