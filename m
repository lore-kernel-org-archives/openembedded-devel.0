Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MQmIJ-0004pO-7v
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 20:00:07 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 91EDC220012A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:46:40 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 219F6220011A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (unknown [78.52.225.201])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:46:40 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A1C343C0A0; Tue, 14 Jul 2009 19:46:39 +0200 (CEST)
Date: Tue, 14 Jul 2009 19:46:39 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090714174639.GA24978@rhein.zuhause.netz>
References: <20090714170415.GA24919@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20090714170415.GA24919@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Broken git-native in dev
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
X-List-Received-Date: Tue, 14 Jul 2009 18:00:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi again,

okay seems the problem is rather angstroem related which set BUILD_OPTIMIZATION = "-O2 -ggdb3" and
so the native packages suffer from it too.

Bye Henning


