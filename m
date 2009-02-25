Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LcQPP-0005ce-NK
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 21:31:11 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3E757DB15C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 21:27:59 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 88200DB1238
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 21:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_40
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e179039149.adsl.alicedsl.de
	[85.179.39.149]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 21:27:58 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DF37C3C151; Wed, 25 Feb 2009 21:27:57 +0100 (CET)
Date: Wed, 25 Feb 2009 21:27:57 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090225202757.GA10629@rhein.zuhause.netz>
References: <go498c$bqq$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <go498c$bqq$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 25 Feb 2009 20:31:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2009 at 09:21:32PM +0100, Koen Kooi wrote:
> Hi,
>
> I keep trying to teach people the difference between recipes (what's in  
> OE) and packages (what you install on the target) and keep getting  
> reactions like "ok, but why is the dir called packages?", which are  
> completely valid.
>
> Proposal:
>
> mv packages recipes ; git commit .
>
> While it would make setting up OE more intuitive, it does mean that  
> people have to adjust local.conf and distro people need to update their  
> installation instructions.
>
> I have some other intrusive proposals about shuffling things around in  
> TMP a bit (and out of TMP as well), standardizing on source locations  
> for source_distribute and sourcepkg, etc, but let's start with this easy  
> one.
>
> The main motivation for all this is to make the next stable branch  
> easier to grasp for newbies than the current OE structure.
>
> regards,
>
> Koen

+1 from me.

Bye Henning


