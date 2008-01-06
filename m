Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JBdsz-0006G9-MA
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2008 23:22:29 +0100
Received: by fg-out-1718.google.com with SMTP id 22so3728201fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2008 14:15:40 -0800 (PST)
Received: by 10.86.99.9 with SMTP id w9mr19388221fgb.58.1199656219653;
	Sun, 06 Jan 2008 13:50:19 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id p38sm27242888fke.13.2008.01.06.13.50.17
	(version=SSLv3 cipher=OTHER); Sun, 06 Jan 2008 13:50:18 -0800 (PST)
Date: Sun, 6 Jan 2008 23:56:11 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1824361960.20080106235611@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Sun, 06 Jan 2008 22:22:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  I've prepared a patch to make GtkFileChooser, a
contemporary gtk's file open/save widget, to suite small, PDA-like
screens (including QVGA) better.

  The patch is available at
http://bugs.openembedded.org/show_bug.cgi?id=3634 , with extensive
description at
http://pfalcon-oe.blogspot.com/2008/01/smallscreen-mod-for-gtkfilechooser.html
. I'm glad I've written it in high detail, because Koen quickly
pointed me to similar patches in Poky:

http://svn.o-hand.com/view/poky?rev=3408&view=rev
http://svn.o-hand.com/view/poky?rev=2596&view=rev

  I didn't try them, but they appear to make more invasive changes to
gtk+, though apparently add more features (for good, bad, or for
vendor's requirements).

  So I'd like to ask for discussion of this situation, and deciding on
what version it would be better to import.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



