Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PqmYj-0001ym-No
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 14:09:13 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1CB0511001BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 14:07:54 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 831C21100104
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 14:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052066069.adsl.alicedsl.de
	[78.52.66.69]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 14:07:53 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1F6673C34C; Sat, 19 Feb 2011 14:07:12 +0100 (CET)
Date: Sat, 19 Feb 2011 14:07:12 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110219130711.GA23069@rhein.zuhause.netz>
References: <SNT125-W513CCBD0BD604EFC3F9B4CBAD40@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <SNT125-W513CCBD0BD604EFC3F9B4CBAD40@phx.gbl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: bitbake unifdef quilt-native failing
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
X-List-Received-Date: Sat, 19 Feb 2011 13:09:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

either your local package is corrupt or upstream changed the package
with the same version.

Bye Henning


