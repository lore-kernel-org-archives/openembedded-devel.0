Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1Ptr03-0005Dy-0L
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 01:30:07 +0100
Received: by pzk12 with SMTP id 12so522194pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 16:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=cK7ygivO3JMxdynQiKh2J1gTFyJyW/QFjdhjkQ1f7iM=;
	b=SFmxGhhw5UDD/XFp8ZG2qRm7oDoEGIVVKXhRfKips1Jb4EslEp2yW4GS5Nf4FXC/do
	55cMEz1fOJEyvv63j2GFIDOB+ssWiCR/8poGuYMQidXRp0yrCiyPrRBSjjJ0okaGepSR
	ULohkBGtWcjnCXWXzfNSrC4wSbwkR8DxWKsGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=n3sdGmLSwhLgLRotQjeXw1WPD0EMdjo5ZJNVJIp9XqOlbv1fAZMLoSzJWzGuQXGrKe
	+FX8UHjC+HwB7zL4YC/k8+Nv+caNYOGSV/m0y4QYSt7sXU5LRuw8Jw4D/NLxn0k68uhY
	NJcPS8LHqzH9dtxH5TFi+PIyckfu9JxPDZR4I=
Received: by 10.142.75.6 with SMTP id x6mr3827006wfa.229.1298852918344;
	Sun, 27 Feb 2011 16:28:38 -0800 (PST)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au
	[220.244.174.13])
	by mx.google.com with ESMTPS id w32sm5135372wfh.7.2011.02.27.16.28.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 16:28:37 -0800 (PST)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 10:27:56 +1100
Message-Id: <1298849277-29164-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.1
Subject: qt-4.7.1 phonon/gstreamer RGB fix
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
X-List-Received-Date: Mon, 28 Feb 2011 00:30:07 -0000

Hi,

This fixes a colour issue with video playback via phonon on ARM system.

Cheers
Marc



