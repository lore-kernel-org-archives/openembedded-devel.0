Received: from [93.186.196.80] (helo=mis07.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailings@hardware-datenbank.de>) id 1Mg0Hk-0002LI-MI
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 19:58:22 +0200
Received: by mis07.de (Postfix, from userid 65534)
	id 100E9144E021; Tue, 25 Aug 2009 19:40:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on mis07.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=ALL_TRUSTED,AWL,
	STOX_REPLY_TYPE autolearn=disabled version=3.2.5
Received: from pcvirus (p5DC8F7CA.dip.t-dialin.net [93.200.247.202])
	by mis07.de (Postfix) with ESMTPA id D768F144E01C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 19:40:26 +0200 (CEST)
Message-ID: <17EB92EC37534805AA9639B72BDB7947@pcvirus>
From: "Rath" <mailings@hardware-datenbank.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2009 19:40:06 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5843
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Recipe for libv4l
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
X-List-Received-Date: Tue, 25 Aug 2009 17:58:31 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi,

I've tried to write a  recipe for libv4l, but I get a file not found error 
and the kernel version is identified as 2.6.29 but I have 2.6.29-omap1.
Here is the recipe: http://pastie.org/592125 and the compile log: 
http://pastie.org/592124

What's wrong with the recipe?

Regards, Joern 



