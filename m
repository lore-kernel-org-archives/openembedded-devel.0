Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QeUGP-00054V-9D
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 17:43:45 +0200
Received: from gnutoo-desktop.localnet (79.50.137.190) by smtp206.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4DE63E32039BD872; Wed, 6 Jul 2011 17:34:31 +0200
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jul 2011 17:34:30 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic; KDE/4.5.5; i686; ; )
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
In-Reply-To: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201107061734.31202.GNUtoo@no-log.org>
Subject: Re: [PATCH-proposal] fix vlc building (-fPIC error) by patching live555 recipe
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
X-List-Received-Date: Wed, 06 Jul 2011 15:43:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>Let me know if it is not good enough, and if the patch is accepted.
hi,
First thanks for the patch, unfortunately it's in the wrong format, you should 
rather use git (git add + git commit + git format-patch + git-send-email ) as 
described in the patch sending guide:
http://www.openembedded.org/index.php/How_to_submit_a_patch_for_dummies

Then I wonder what is fix-makefile.

I'd like vlc to get fixed. Thanks again for caring about vlc.

Denis.


