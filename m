Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NWRjs-00068E-57
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 10:48:11 +0100
Received: (qmail 30619 invoked by uid 813007); 17 Jan 2010 09:45:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO ?192.168.1.144?)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jan 2010 09:45:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Modest 3.1
References: <alpine.LFD.2.00.1001161439340.13406@localhost>
In-Reply-To: <alpine.LFD.2.00.1001161439340.13406@localhost>
X-MSMail-Priority: Normal
X-Priority: 3
Date: Sun, 17 Jan 2010 10:45:06 +0100
Message-Id: <1263721506.1889.2.camel@Nokia-N900-42-11>
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Odp.: what's the purpose of tarballs in the OE repo?
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
X-List-Received-Date: Sun, 17 Jan 2010 09:48:11 -0000
Content-Type: text/plain; charset=utf-8
Content-ID: <1263721505.1889.1.camel@Nokia-N900-42-11>
Content-Transfer-Encoding: 8bit


>    following up on a thread from the bitbake dev ML, what is the
> purpose of actual tarballs in the OE dev repository?

> ./recipes/firmwares/marvell-gspi-fw/9.70.3-p37.tar.gz
> ./recipes/firmwares/marvell-sdio-fw/9.70.3-p37.tar.gz

Marvell firmware for 8686 wifi/bt module. Available only in their intranet. Redistributable if license is also provided.

> ./recipes/sgalib/sgalib-0.1.0/sgalib-0.1.0.tar.gz

ST-Ericsson Nomadik 8815 platform stuff. Available only on CD added to board, required to build Xserver.

> ./recipes/qpealarmclock/qpealarmclockapplet-1.0.9/missing-files.tar.gz

This is for old software for platform which nearly no one uses now.

> ./recipes/zaurus-utils/files/gnu-tar.gz

ARM OABI tar required by Zaurus updater.






