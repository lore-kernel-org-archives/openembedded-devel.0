Received: from [212.18.0.10] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MXYGx-0006ej-CS
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 12:26:36 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 2A9821C000A7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Aug 2009 12:11:16 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id D570C9042A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Aug 2009 12:11:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024) with ESMTP id RYaeJUeLAlGf
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Aug 2009 12:11:15 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-93-104-102-209.dynamic.mnet-online.de
	[93.104.102.209])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Aug 2009 12:11:15 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 Aug 2009 12:11:13 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.29.6-213.fc11.x86_64; KDE/4.2.4; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200908021211.14793.mok@mnet-online.de>
Subject: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Sun, 02 Aug 2009 10:26:36 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

I have problems building correct SHR images since some time now. Don't know 
when this started exactly, but it might have been around the bitbake switch 
from svn to git...

The problem is, that a whole bunch of packages does not get installed into the 
image. As far as I can see all the packages are either RRECOMMENDS or 
RDEPENDS. This was working fine.

Anybody got some idea where to look at to debug it or is experiencing the 
same?

Thanks
-- 

Klaus 'mrmoku' Kurzmann


