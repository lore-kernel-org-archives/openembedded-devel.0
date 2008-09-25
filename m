Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Kiwg6-00087v-Eu
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 21:39:06 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5B3FD8400AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:35:24 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7208D8400A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178074016.adsl.alicedsl.de
	[85.178.74.16]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 21:35:23 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 12C013C1D7; Thu, 25 Sep 2008 21:35:23 +0200 (CEST)
Date: Thu, 25 Sep 2008 21:35:23 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080925193522.GA19302@rhein.zuhause.netz>
References: <20080922205525.GA23908@rhein.zuhause.netz>
	<48D8B75D.7030302@gmx.net>
MIME-Version: 1.0
In-Reply-To: <48D8B75D.7030302@gmx.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Finer granularity for RSUGGEST
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
X-List-Received-Date: Thu, 25 Sep 2008 19:39:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 23, 2008 at 11:31:09AM +0200, Robert Schuster wrote:
> RSUGGEST_${PN} = "mooo"
> 
> Regards
> Robert
> 


Ah,

thanks this is what I did not know. So forget the patch and maybee time
to add this to the oe manual.

Bye Henning


