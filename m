Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTWNC-0002hf-HW
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 12:22:14 +0100
Received: by mail-gg0-f175.google.com with SMTP id p1so233049ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PEs39Y81FP7MdyGOd55Q8EbNOMqKOg56dsKNXkGTJGM=;
	b=POaTRgTJNE50EVrRGcr+vBZCaryeUqH57HU9T4NHHM51JqeW3sn/lBwQ1RSRpkKcdp
	Tp/ssTlXTMqC8OQ6V4so46YqP/F28BlBZDluadYW2A2Dch/ns3HR2JWGn6MqJLEYEUaN
	rwsMXrpBAubIO5v+oHjgwB4f8Rfoj4QykNM+/lQ/2yYIW6BPwlqPo52dZRjY0iAZFlt2
	6Ty3u6KIVyhFT8LeW5bPoD1ZUE/QouEnGzJW+wa+ZxesJaExaQ+6K/FUgcezohyKg11E
	759QwJ0+30n3L+EyZTxmMRKAN7WEqZ3SPx6xUn444KzrgBpaWl+UJXWmI//98XWnUoxx
	Z9eg==
Received: by 10.236.131.239 with SMTP id m75mr36447562yhi.2.1351681717334;
	Wed, 31 Oct 2012 04:08:37 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u49sm3307372yhd.18.2012.10.31.04.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 04:08:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 09:08:25 -0200
Message-Id: <1351681706-12778-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 2/3] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
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
X-List-Received-Date: Wed, 31 Oct 2012 11:22:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} (100%)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
-- 
1.7.2.5



