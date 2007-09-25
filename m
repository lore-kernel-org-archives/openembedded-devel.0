Received: from [85.214.48.103] (helo=mail.familie-heinold.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ia6dh-0007lF-CF
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2007 11:23:33 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 295FE840052
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 11:19:13 +0200 (CEST)
Received: from rhein.familie-heinold.de (e178116007.adsl.alicedsl.de
	[85.178.116.7])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0ACC784004E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 11:19:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 90EA2210F; Tue, 25 Sep 2007 11:19:08 +0200 (CEST)
Date: Tue, 25 Sep 2007 11:19:08 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070925091907.GA5283@rhein.zuhause.netz>
References: <46F8A596.7080508@compulab.co.il>
MIME-Version: 1.0
In-Reply-To: <46F8A596.7080508@compulab.co.il>
User-Agent: Mutt/1.5.16 (2007-06-11)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: New machine support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2007 09:23:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 25, 2007 at 08:07:18AM +0200, Mike Rapoport wrote:
> Hi all,
> I would like to add a machine configuration and kernel patches to OE tree. What
> do I need to do for it?
> 
> -- 
> Sincerely yours,
> Mike.
> 
> 

Hi,

provide the all patches in the bugtracker http://bugs.openembedded.org

Take a look at mtn-dir/conf/machine, mtn-dir/conf/machine/include
and mtn-dir/packages/linux/linux-2.6.22 linux_2.6.22.bb or linux-2.6.21 
linux_2.6.21.bb

Bye Henning



