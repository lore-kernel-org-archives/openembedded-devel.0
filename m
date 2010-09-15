Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ka6sox@gmail.com>) id 1Ovyf5-0008DM-6W
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 22:33:00 +0200
Received: by gya6 with SMTP id 6so213256gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=EW205D2/PSgw+8xBXF+McGHAy8ePPSMkiAbYZMqi9Xg=;
	b=tXA7CDax0gTJ0mMbcIbUrzTpa+6MD+doIg/iLL6TxmnCX0c2VwdfxnUvxC7Q82sGTd
	wpX7lubrL5g7G3OlsbIRKgZqFPU/2/Uyyc+SDd2Z8n57lMr3njmGElqlQhHiK5ovgu+3
	dabHLE0shPckyPvb5AOTtxr+0+aApL9kINGYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MnxJz52RLLIoFvqc7yV2osDTQ1E5GkhA++5BX4RUXD+GXqdhzciZGLvbFzoUeG1pMo
	G+yCOD5CYlhyy6PPDw5Hlv0B/g2Jrt//A+z65GNSX1kVx1GRl2udiFo+98d8PFztfeIJ
	1q2hPhx6BRfoCFUNnUgd4Hg15bhf8mL9ssoIA=
MIME-Version: 1.0
Received: by 10.151.82.6 with SMTP id j6mr2826758ybl.73.1284582728831; Wed, 15
	Sep 2010 13:32:08 -0700 (PDT)
Received: by 10.231.208.1 with HTTP; Wed, 15 Sep 2010 13:32:08 -0700 (PDT)
Date: Wed, 15 Sep 2010 13:32:08 -0700
Message-ID: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: ka6sox@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: melo git outage
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
X-List-Received-Date: Wed, 15 Sep 2010 20:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

In approximately 1hr 21:30UTC I need to rsync the server to create a backup
and perform an upgrade to the melo server so that we can add some additional
functionality.

I suspect that the rsync and upgrad will take approx 2-3hrs (to fix things
that break)

Thanks,

ka6sox
(for the oe infrastructure team)

