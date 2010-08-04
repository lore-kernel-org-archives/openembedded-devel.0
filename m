Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgSOT-0007ZR-FO
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 03:03:52 +0200
Received: from gandalf.denix.org ([unknown] [71.255.225.53])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6L00IB7PH5Y5M6@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 19:03:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6B8AF14AF60; Tue,
	03 Aug 2010 20:03:05 -0400 (EDT)
Date: Tue, 03 Aug 2010 20:03:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100804000305.GD17391@denix.org>
References: <AANLkTim8npBMFS-5-u+iT6XPUJDkZ+ueqjwc0==WVubd@mail.gmail.com>
	<A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
	<1280839602.16235.69.camel@rex>
	<6B7F6365-5791-499C-938A-0249A0189569@vanille-media.de>
MIME-version: 1.0
In-reply-to: <6B7F6365-5791-499C-938A-0249A0189569@vanille-media.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: CALL FOR ACTION: get rid of native recipes
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
X-List-Received-Date: Wed, 04 Aug 2010 01:03:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 03, 2010 at 03:58:15PM +0200, Dr. Michael Lauer wrote:
> Am 03.08.2010 um 14:46 schrieb Richard Purdie:
> 
> > On Tue, 2010-08-03 at 10:21 +0200, Dr. Michael Lauer wrote:
> >> that's pretty cool, however I think we should restrict this list
> >> to those recipes which also have a non-native variant.
> >> 
> >> E.g. the 2nd entry in this list is android-image-utils-native for
> >> which a non-native variant makes little sense.
> > 
> > Just to add, there are some cases where the -native recipe still makes
> > sense as the alternative is rather ugly for example, python-native,
> > perl-native and a handful of others. The number of these cases is
> > extremely small however. BBCLASSEXTEND makes sense in most cases.
> 
> Oh right, the recipes for those pesky scripting languages are quite finnicky,
> so I would prefer to not change them unless absolutely necessary :)

Yeah, that was also mentioned in Frans' original email... :) Here:

> - in some cases: leave as is (e.g. if it is only a native recipe, or if it 
> is very difficult to convert)

-- 
Denys


