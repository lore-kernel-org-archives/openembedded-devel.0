Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1xWX-0007Kr-BK
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:05:09 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B2E6511000BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:07 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7467111000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:03:06 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 97EF83C0BF; Tue, 22 Mar 2011 10:02:19 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 10:02:10 +0100
Message-Id: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 09:05:09 -0000

Hi,

maybee I am wrong but my host lzma and the lzma build with oe angstroem-2010 has no -e option
for compression. So even its a weak define in bitbake.conf it should be correct.

Bye Henning


