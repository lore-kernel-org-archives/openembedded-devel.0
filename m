Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OR1cd-0001CH-Lw
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 13:27:13 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C043B166058E; Tue, 22 Jun 2010 05:21:54 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8520E1660565;
	Tue, 22 Jun 2010 05:21:54 -0600 (MDT)
Message-ID: <4C209CD2.4080208@mlbassoc.com>
Date: Tue, 22 Jun 2010 05:21:54 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Updated recipe for chrome
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
X-List-Received-Date: Tue, 22 Jun 2010 11:27:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone have an updated recipe for Google chrome?  The
one in org.openembedded.dev is really old - SVN revision
34027 - mainline is at 50359!

I looked at the recipe and it seems to be full of magic
(subpackages with specific SVN revisions, etc).  I doubt
that just updating the main SVN revision number will work.

Any ideas/pointers?  I'd really like to try some of the
latest features on my embedded systems :-)

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


