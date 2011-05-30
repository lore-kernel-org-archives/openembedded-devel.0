Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3uc-0007ud-Ds
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:57:46 +0200
Received: by gwb11 with SMTP id 11so1569218gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=EwfMp8BxxwGV4gkRkMAeVqsxO2jmt4UnSUCNcdpD+4E=;
	b=mUwpjI4Ws/mU3Dj4miDAT5tIo8rDC3oH1ChpCI9CZxZ7dM5spsRIWIpK9jNk5f/2E1
	5R+/Xht/w2PfL8cYTPoBW5m2ROOHaNvi76bA7a7QtY/ryTQdhCDreZx/86XHLon6s7hA
	wzPwJQSXNIgS2mC0Y4IKxi2dWvdkLSbfN2R30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=efHzrQFq4jp8rCXMZ91EkP25SehVjQhubAHv6mBsJGPJZie3So5Fi6cjEBHDajb22k
	vEOQHY+j+LhYkW0wQg1Ts/V9JRQ0hny/bNVe9AUJvUaSgJNT0RZ5ARzF35A4OjsLyZbp
	58yKpx7kcCF/fE25hrzkK3GFukBgq0iEOig0U=
Received: by 10.236.176.230 with SMTP id b66mr6043434yhm.247.1306767275370;
	Mon, 30 May 2011 07:54:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:06 +0000
Message-Id: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: Pending patches done by O.S. Systems before using oe-core
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
X-List-Received-Date: Mon, 30 May 2011 14:57:46 -0000

Hello,

I do believe those patches are useful and then I am resending them up
to date against current dev tip. Please review and merge them as you
wish.



