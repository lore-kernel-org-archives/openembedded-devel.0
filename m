Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1Nu5ui-0000NU-By
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:21:08 +0100
Received: from homiemail-a11.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id EB37C17C432
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:17:56 -0700 (PDT)
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPA id 10C95194080
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:17:52 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Tue, 23 Mar 2010 16:17:50 +0100
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Mar 2010 16:17:50 +0100
Message-ID: <87d3yv9ie9.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: FYI: SHR's opkg repository finder
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
X-List-Received-Date: Tue, 23 Mar 2010 15:21:08 -0000
Content-Type: text/plain; charset=us-ascii

Dear all,

you might be interested in having a look at it:

http://opkg-repo.org

which might become SHR's one stop place for finding and
rating packages. It's auto-updated daily from the Packages files,
showing you package information, versions, and a download link.

E.g. http://opkg-repo.org/opkg/abiword shows details on abiword. listing
all versions that are in our various SHR "distributions" (unstable,
testing, and --one day-- stable).

http://opkg-repo.org/sections/ shows the mess that the OE sections are
:-).

I have planned to let users rate packages, add screenshots, describe
them, etc, giving us a mix of an automatic package searching facility
and a user-rated application recommender.

Don't comment on the colors unless you are willing to fix them, I am in
the progress of moving away from the original brownish theme.

It's a django app, and the source code is here:
http://bitbucket.org/spaetz/opkgrepo/

Sebastian


