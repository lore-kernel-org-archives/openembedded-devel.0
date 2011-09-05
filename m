Received: from [93.100.122.208] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gvaxon@gmail.com>) id 1R0eBV-00012U-Nw
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 20:46:18 +0200
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id p85IlUw1005004; 
	Mon, 5 Sep 2011 22:47:30 +0400
Received: (from vaxon@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id p85IlSPS005002;
	Mon, 5 Sep 2011 22:47:28 +0400
X-Authentication-Warning: localhost.localdomain: vaxon set sender to
	gvaxon@gmail.com using -f
Date: Mon, 5 Sep 2011 22:47:28 +0400
From: Valentine Barshak <gvaxon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110905184728.GA4961@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20110831230317.GA6388@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Changing SRCREV in amend.inc doesn't work
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
X-List-Received-Date: Mon, 05 Sep 2011 18:46:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

bump

Could anybody help here?
Did I miss anything or is there a problem amending uclibc SRCREV?

Even though bitbake -e uclibc shows the amended SRCREV,
SRCPV is set using the old value, and do_fetch task uses the old
SRVREV as well.

TIA,
Val.


