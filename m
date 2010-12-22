Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1PVFjL-0002LR-F7
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 04:51:11 +0100
Received: by iyj18 with SMTP id 18so3899808iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 19:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject:date
	:message-id:x-mailer;
	bh=GxnZOU3SM+TEfvlNBunI+iw7mhOmRHEGkKSEvdtMv2o=;
	b=Twjl/cMrUPkSv943lsrpHmVPvORKGjs/o8VVvf//355Jj3cDOorGxCDO2Kl4+DQNVg
	xZL0q3aNfhgt/rjcUfLAB+r9VGWYDLPXPT6NRPj5E2Q9gzboiYke26xnzIrzCRuvyUIV
	QF5s/gghyeSSxNp0IfTcBQx9gfjmeqP/x2m3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=izbmH3NGlvQCzTuFr5hSY53Ubzw+WOPCt5W5P4qF2NSTy+nsE4uyljI0KC2xiMnCAu
	oM+8B1d1ESgPQihnmUvpMW2Q6hGZYc3YYqWWzem668n2zsW8MujkuVvNgm90mgigkhJb
	QVWfxcrH/LTNwsiG+aywdvnTdB6p/zaJcJry0=
Received: by 10.42.176.202 with SMTP id bf10mr6550474icb.104.1292989863548;
	Tue, 21 Dec 2010 19:51:03 -0800 (PST)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au
	[220.244.174.13])
	by mx.google.com with ESMTPS id z4sm5132165ibg.7.2010.12.21.19.50.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 19:51:02 -0800 (PST)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Dec 2010 13:50:53 +1100
Message-Id: <1292986254-24531-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.1
Subject: qextserialport - new recipe
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
X-List-Received-Date: Wed, 22 Dec 2010 03:51:11 -0000

Hi,

This is first attempt at a recipe to add qextserialport. I used the qwt recipe as a reference.

Is there anything I've missed/ done wrong? I'm not sure I got the PV and PR right.
The next step will be to add it to an SDK.

Comments much appreciated.

Cheers
Marc



