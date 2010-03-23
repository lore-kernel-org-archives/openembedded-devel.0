Received: from caiajhbdcaid.dreamhost.com ([208.97.132.83]
	helo=homiemail-a24.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1Nu5wc-0001pb-G2
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:23:03 +0100
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a24.g.dreamhost.com (Postfix) with ESMTPA id 60F082C806B; 
	Tue, 23 Mar 2010 08:19:53 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Tue, 23 Mar 2010 16:19:51 +0100
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <201003231434.17203.marcin@juszkiewicz.com.pl>
References: <87fx3r9p3p.fsf@SSpaeth.de>
	<201003231434.17203.marcin@juszkiewicz.com.pl>
Date: Tue, 23 Mar 2010 16:19:51 +0100
Message-ID: <87bpef9iaw.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 208.97.132.83
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Accidental merge
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
X-List-Received-Date: Tue, 23 Mar 2010 15:23:03 -0000
Content-Type: text/plain; charset=us-ascii

> For future: "git pull --rebase" please to not create merge commits.

Right. Point taken. Actually the merge was not wrong or horrible in the
end, I was just scared by the very bg diffstat I was seeing. Still, I
should have rebased before pushing. My apologies.

spaetz


