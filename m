Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1xUG-0006zo-JN
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:02:48 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A3AE211000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:55 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C4B4B11000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:53 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 299EE3C0BF; Tue, 22 Mar 2011 10:00:05 +0100 (CET)
Date: Tue, 22 Mar 2011 10:00:05 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322090004.GA13738@rhein.zuhause.netz>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-2-git-send-email-heinold@inf.fu-berlin.de>
	<im9m2q$pse$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <im9m2q$pse$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 1/3] libatomic-ops: switch to own directroy and use cvs version
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
X-List-Received-Date: Tue, 22 Mar 2011 09:02:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 22, 2011 at 09:19:38AM +0100, Koen Kooi wrote:
> Where are you setting SRCDATE for this recipe?

Ah sorry,

I left this over for discussion and forget to mentioned it.

Is it better in inside the recipe now or per the sane-revdate.inc?

Bye Henning


