Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1Nu3eX-0007kD-G2
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 13:56:14 +0100
Received: from homiemail-a19.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 0300417D5EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 05:53:04 -0700 (PDT)
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPA id C02C560406C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 05:53:00 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Tue, 23 Mar 2010 13:52:58 +0100
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Mar 2010 13:52:58 +0100
Message-ID: <87fx3r9p3p.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Accidental merge
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
X-List-Received-Date: Tue, 23 Mar 2010 12:56:15 -0000
Content-Type: text/plain; charset=us-ascii

Uhh, I just accidentally pushed a merge
a501f95529d16fad725b58c241047bde63825cbf, I did not know I have in my
tree. Not even know what the ancestors of that merge were, would it be
possible for someone with git knowledge to revert that merge?

That would be great, thanks
Sebastian

P.S. I'll look into how to revert that myself, but that might take a while.


