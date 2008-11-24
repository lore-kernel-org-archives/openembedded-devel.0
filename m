Received: from [74.54.107.137] (helo=cathcart.site5.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1L4Zwt-0002zQ-6a
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 12:49:51 +0100
Received: from mail.linux-boards.com ([192.114.83.142])
	by cathcart.site5.com with esmtpsa (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.69) (envelope-from <mike@compulab.co.il>) id 1L4Zu1-0000XW-46
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 05:46:53 -0600
Received: from [10.1.1.95] (mike-pc.compulab.local [10.1.1.95])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id mAOBksUp016650
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 13:46:54 +0200
Message-ID: <492A942F.80309@compulab.co.il>
Date: Mon, 24 Nov 2008 13:46:55 +0200
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.16 (X11/20080907)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cathcart.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Using Bluetooth headset with Angstrom
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
X-List-Received-Date: Mon, 24 Nov 2008 11:49:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,
I was trying to enable Bluetooth headset in Angstrom and faced a complete fiasco.
I've installed bluez-utils and bluez-utils-alsa, updated configuration files,
and I see that pairing is successfull. Moreover, aplay/mplayer are able to use
bluetooth audio device, but there's no sound coming out...
Has anybody got a clue what am I missing?


-- 
Sincerely yours,
Mike.



