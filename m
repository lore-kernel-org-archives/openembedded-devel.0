Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <lpotter@trolltech.com>) id 1IxEvq-000884-Pv
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 05:53:54 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 8FE3C74271
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 05:51:00 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id 30B6D7424A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 05:51:00 +0100 (CET)
Received: from [10.1.1.181] (polarbear-replace.trolltech.com.au [10.1.1.181])
	by mail.trolltech.com.au (Postfix) with ESMTP id DF6A83B060F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 14:50:58 +1000 (EST)
Message-ID: <474CF3AF.5010407@trolltech.com>
Date: Wed, 28 Nov 2007 14:50:55 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0.0.0 (X11/20070326)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: CROSS_DIR
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
X-List-Received-Date: Wed, 28 Nov 2007 04:53:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Was CROSS_DIR changed somewhat recently (last 2 months or so) to link 
the includes and lib dirs to staging?

If so, why? This means I cannot distribute this toolchain to other 
machines, and makes the entries in the pkgconfig files wrong.

CROSS_DIR should mean just that - this is where I want the toolchain to 
be - like it used to do.



