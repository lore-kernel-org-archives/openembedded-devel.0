Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PARTF-0006Tx-2i
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:08:33 +0200
Received: by gwaa11 with SMTP id a11so2779573gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=5uH2OYYD3kuBf5s6JMKdZfUT3kwKb33kNriHFi3GyBY=;
	b=OPkj4RMm4Kfne3DprreX0wcVPQ9bpM13BClq0E4LbbrzL1F9NjHhGvwZSv9bl1uERl
	0lafAJCWS5WCDYoqL/kZ34yUNowsVa8hyRv3qu30NOOnqFp0F3extfm0AkVxAgP6ksBx
	Wd18scAz07+4SNLefZJZYonjTrUBV58pSutxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=upGezH+GfiniEgxAUXR2p68/jVO6kZqAX+RiwIZMxWFLcvkTMrxGz/DHkfp6T3KpHz
	al1TdIk5L1dzRBWBcwpZof9RVPe6YqH3YR+M6v0uVobt0UVjkR4UwSFKYC+2AINTPurX
	WS5NUfOAn3U7YunaF7VskZhpyEOYAFoorQRmw=
MIME-Version: 1.0
Received: by 10.216.16.85 with SMTP id g63mr658275weg.114.1288030060363; Mon,
	25 Oct 2010 11:07:40 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Mon, 25 Oct 2010 11:07:40 -0700 (PDT)
Date: Mon, 25 Oct 2010 14:07:40 -0400
Message-ID: <AANLkTimztx6DMH76DrzVaY6oXEb1GF2HA5Us5r+1aDVb@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-10-25
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
X-List-Received-Date: Mon, 25 Oct 2010 18:08:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

I apologize the testing-next branch did not get created last Thurs.
I'll try to create a cron job so this happens automatically in the
future.

The master branch has been merged to testing-next branch, and
testing-next is ready for clean builds.

Last testing cycle:
http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-10-14

For more information on the OE testing effort:
http://wiki.openembedded.org/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


