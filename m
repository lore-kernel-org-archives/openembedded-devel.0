Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OBDvp-0004Vi-4t
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 23:21:03 +0200
Received: by bwz20 with SMTP id 20so1407394bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 May 2010 14:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=r22Odnf9FkygLoWvdqjeePv5E3fgLEBZb1aqiU3xq6I=;
	b=WoOHyJlHo0MsAUo5PIONiev8V8D4HQ5hQ7pnXaABgI91ZhBRrJkq1KHMA9n7UOBMr1
	zyJtPaQ9+VsMXJmaqaD5yTJJNDzovscfd2Dz4GIQcXM0+pR0oRYF6kaS3mZG0CLlBqIw
	rajXULqLv0auPgnkdS9w18wffxuNeoCurtzEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=HchSV7uzK7o0nlp1VGShOt+Mtox6nAP7hccR/jdY/hHOragl3ZGtuvKm+WXQXudB2c
	NozSVm7Kq3Ic8MIFfkfEwmq/Sa9mmmiqn+pSzVZIybCi6WtEBvCqvdsON0y9tXqyZJxP
	56oTWLITFtMhCTOzjplzqZeVSmb+5eTEj8fEM=
Received: by 10.204.15.23 with SMTP id i23mr1900215bka.106.1273439829580;
	Sun, 09 May 2010 14:17:09 -0700 (PDT)
Received: from [192.168.178.115] (85-127-149-111.dynamic.xdsl-line.inode.at
	[85.127.149.111])
	by mx.google.com with ESMTPS id 14sm1356120bwz.10.2010.05.09.14.17.08
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 May 2010 14:17:09 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 09 May 2010 23:17:48 +0200
Message-ID: <1273439868.4164.5.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Merge 41350cf87ff1bec340823fb7fdf417461523704b
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
X-List-Received-Date: Sun, 09 May 2010 21:21:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sorry for that. Tried to amend a commit note before realizing that I've
no chance to get that change online (unnoticed).

I am currently getting bugged by a guy wanting me to remove a thanks
note. (He doesn't understand that these changes are actually permanent.)

Again, sorry.

Regards,
Michael



