Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1Q0Wc6-0000dv-Nj
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:08:58 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4BAA7110022E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:54:00 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3C92111000B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225072129.adsl.alicedsl.de
	[92.225.72.129]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:53:59 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 41BFA3C0BB; Fri, 18 Mar 2011 10:53:14 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 10:53:09 +0100
Message-Id: <1300441991-30490-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: uClibc fixes for TI recipes
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
X-List-Received-Date: Fri, 18 Mar 2011 10:08:58 -0000

Hi,

the first patch fixes uclibc by refactoring variables name and
the second patch let us rebuild the codec-engine itself not only
the examples.

Bye Henning


