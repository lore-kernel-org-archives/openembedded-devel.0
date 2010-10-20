Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8dxW-0001mk-1d
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 21:04:22 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL00LZMRLRD77A@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 14:03:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B1D2614AF64; Wed,
	20 Oct 2010 15:03:26 -0400 (EDT)
Date: Wed, 20 Oct 2010 15:03:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020190326.GR11514@denix.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<i8vln6$njo$1@dough.gmane.org>
	<AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>
	<20101020181558.GN11514@denix.org>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3388@dlee06.ent.ti.com>
	<20101020183704.GP11514@denix.org> <4CBF3B7D.3010904@opendreambox.org>
MIME-version: 1.0
In-reply-to: <4CBF3B7D.3010904@opendreambox.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 19:04:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 08:57:01PM +0200, Andreas Oberritter wrote:
> On 10/20/2010 08:37 PM, Denys Dmytriyenko wrote:
> > On Wed, Oct 20, 2010 at 01:27:54PM -0500, Maupin, Chase wrote:
> >>> Chase,
> >>>
> >>> Does it say what kind of exception it is? If it has a name, it's better to
> >>> specify it. For libgcc/libstdc++ I ended up specifying "GPLv3 with GCC
> >>> RLE",
> >>> which stands for GCC Runtime Library Exception:
> >>
> >> Denys,
> >>
> >> The COPYING.EXCEPTION file has the title "AUTOCONF CONFIGURE SCRIPT 
> >> EXCEPTION".  Would you like this changed to "GPLv3 with Autoconf CSE"?
> > 
> > Chase,
> > 
> > Either "GPLv3 with Autoconf CSE" or even "GPLv3 with Autoconf Configure 
> > Script Exception"... I'm not sure CSE is as common as RLE - here's the 
> > list of current GNU exceptions:
> 
> GCC and Autoconf both being GNU projects, their license is probably not
> GPLv3, but GPLv3+ (with some exception), in the discussed notation. ;-)

Interesting point! We should try to be future-proof with GPLv3+ too :) 
Although I haven't seen anyone using it this way, as it's not relevant yet.

-- 
Denys


