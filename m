Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NpIZc-0005Y4-0v
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 10:51:29 +0100
Received: from homiemail-a13.g.dreamhost.com (mailbigip.dreamhost.com
	[208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 1CD8617E634
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 01:48:30 -0800 (PST)
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPA id ACC2C6A805F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 01:48:25 -0800 (PST)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Wed, 10 Mar 2010 10:48:03 +0100
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268167320.5437.2037.camel@lenovo.internal.reciva.com>
References: <20100309075331.GL31945@jama>  <hn5k9o$3vc$2@dough.gmane.org>
	<1268167320.5437.2037.camel@lenovo.internal.reciva.com>
Date: Wed, 10 Mar 2010 10:48:03 +0100
Message-ID: <87tysozewc.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Wed, 10 Mar 2010 09:51:29 -0000
Content-Type: text/plain; charset=us-ascii

On Tue, 09 Mar 2010 20:41:59 +0000, Phil Blundell <philb@gnu.org> wrote:
> That does rather sound like a further argument for just not using the
> local count variables at all and just figuring out a monotonic count
> from the SCM (using git-rev-list or whatever) at packaging time.

That sounds rather nice, however I am not sure if git easily gives you
such a number. I know that mercurial does.

spaetz


