Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUO4-0007Da-TD
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:01 +0100
Received: by ywl41 with SMTP id 41so337920ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=bVhfRQWY41hY0zlcnMjdFdKr5C3WH51X2ooERTxQGYQ=;
	b=c5Jf/gkCzUuS7j3lKK6VFkMzotLVZsJamgEPwy2D6UvmXYxK3ObxoJeLE2xvr1VIRv
	PJLvJFtVv6OATXZw7vuN/MhtYSDRl4wn758WPH1CAXRifi/n6+O0HhgLL3v4qxaA4tLf
	YPAvJPk7J4W2LCNNVUDriTtZ+UlD++8ox6hoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=tLgpZNDPYx2kKLbebX5ItDejceUtLICl7KfhnPNPf21oCqqMBTuqWi8W35OXm+FRJ3
	yjdjy2W5iodt/gzpjjDXIaVM7mhbtbvDARxCcbL4fLXB7UX83n8V/0D+YYljgkkKjWc6
	kJcQAZzKsYrt+rvMkQ9uiV+FhjEpJiQto1WSw=
Received: by 10.150.203.21 with SMTP id a21mr1373529ybg.412.1298051026225;
	Fri, 18 Feb 2011 09:43:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.43.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:43:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:15 +0000
Message-Id: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Subject: Patchset pending for merging from O.S. Systems tree
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:01 -0000


Hello,

Those patches are the ones I sent some days ago, with the requested
fixes and also with the acked-bys already given plus some new ones
that have been cooked here afterwards.

I've done a full build from scratch using those and it seems safe to
get those in. Please ack/nack and push according.

TIA,


