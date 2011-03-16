Received: from gate.tarent.de
	([212.79.178.249] helo=ugs.tarent.de ident=daemon)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <henning@tarent.de>) id 1PzoPH-0002vm-SZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:56:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 3188F400014D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 292854005161C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvkRWw41wGfl
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 0ABD7400014D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>) id 1PzoNe-0006KJ-LN
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:55:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:54:40 +0100
Message-Id: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
Subject: updating java
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
X-List-Received-Date: Wed, 16 Mar 2011 10:56:48 -0000

Hi,

the following patches updates icedtea6-native to 1.7.10, 
switches execution of the awt sizer binary to QEMU and
uses cacao-native as java-native for a stable build
of java recipes.

Bye Henning




