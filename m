Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QwJY7-0007DI-Hg
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 21:55:43 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AEA2C110011B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 21:50:58 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E0A751100118
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 21:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052239047.adsl.alicedsl.de
	[78.52.239.47]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 21:50:57 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 356663C158; Wed, 24 Aug 2011 21:49:24 +0200 (CEST)
Date: Wed, 24 Aug 2011 21:49:24 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110824194923.GC4258@rhein.zuhause.netz>
References: <4E554AD9.90607@balister.org>
MIME-Version: 1.0
In-Reply-To: <4E554AD9.90607@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Build failure for openjade in dev
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
X-List-Received-Date: Wed, 24 Aug 2011 19:55:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 24, 2011 at 12:02:49PM -0700, Philip Balister wrote:
> I am seeing this building openjade. As near as I can see, there
> haven't been any changes to cause this. It does build in
> release-2011.3-maintenance.
> 
> Anyone have any clues?
> 
> Philip
> | + install-catalog --add /home/balister/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat /home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/catalog
> | install-catalog: unable to write in /etc/sgml.

hm maybee you need to traint install-catalog not to write at /etc/sgml

Bye Henning


