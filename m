Received: from firebug.buglabs.net ([66.80.197.243] helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@buglabs.net>) id 1OCGsf-0001uO-SO
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:42:10 +0200
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id ADFEF34049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:38:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id EC92528E006
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:38:07 -0400 (EDT)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qk+TDoRwINRd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:38:07 -0400 (EDT)
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by aphid.buglabs.net (Postfix) with ESMTP id 3875128E005
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:38:07 -0400 (EDT)
Date: Wed, 12 May 2010 13:38:07 -0500 (GMT-05:00)
From: John Connolly <john@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <750868473.3341273689487145.JavaMail.root@aphid.buglabs.net>
In-Reply-To: <alpine.DEB.2.00.1005121257070.3272@lynx>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.104]
X-Mailer: Zimbra 5.0.18_GA_3011.UBUNTU8_64 (ZimbraWebClient - SAF3
	(Linux)/5.0.18_GA_3011.UBUNTU8_64)
X-SA-Exim-Connect-IP: 66.80.197.243
X-SA-Exim-Mail-From: john@buglabs.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: on ubuntu 10.04, how to reset /bin/sh to refer to bash?
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
X-List-Received-Date: Wed, 12 May 2010 18:42:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:

> my first time setting up to build OE on ubuntu 10.04, and trying to
> "bitbake fetch" complains that it's a bad idea for /bin/sh to refer
> to
> dash.  fair enough, so since /bin/sh -> dash, do i just reset the
> symlink manually?  or is there something more elegant? 

Elegant: Sudo dpkg-reconfigure dash.  Choose no.

 thanks.
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario,
> CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                         
> http://crashcourse.ca
> Twitter:                                      
> http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





_________________________
John Connolly
Software Developer
Bug Labs
598 Broadway, 4th Floor
New York, NY 10012-3206
646.723.9258
jconnolly @ irc.freenode.net/#buglabs


