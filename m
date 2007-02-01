Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <janjans321@gmail.com>) id 1HCeOR-0005Vw-FO
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Feb 2007 17:02:35 +0100
Received: by py-out-1112.google.com with SMTP id n39so264153pyh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2007 08:02:34 -0800 (PST)
Received: by 10.35.102.1 with SMTP id e1mr4454723pym.1170345754440;
	Thu, 01 Feb 2007 08:02:34 -0800 (PST)
Received: by 10.35.11.14 with HTTP; Thu, 1 Feb 2007 08:02:34 -0800 (PST)
Message-ID: <7c8eac300702010802p4e1db287p6c533be5850d7422@mail.gmail.com>
Date: Thu, 1 Feb 2007 17:02:34 +0100
From: "Jan Janssens" <janjans321@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Can I do SRC_DIST_LOCAL without a recompile?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2007 16:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have an existing (quite static) OE.org compiled distribution that
I'm not particularly keen on recompiling from scratch. Is there any
smart automated way to distribute the sources without a recompile?

How does the source distribution work anyway? I imagine it exports
both the source archive and the local patches?

Any help much appreciated,

Jan.


