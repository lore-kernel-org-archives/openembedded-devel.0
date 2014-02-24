Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1D76BD13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:54:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,534,1389740400"; d="scan'208";a="41652589"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 24 Feb 2014 11:54:51 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 24 Feb 2014 11:54:51 +0100
Thread-Index: Ac8xTtenel4/566aQXSflzkhlIYs4A==
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.3168
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Mon, 24 Feb 2014 11:54:51 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Feb 2014 11:49:40 +0100
Message-ID: <1393238980-18471-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
X-OriginalArrivalTime: 24 Feb 2014 10:54:51.0110 (UTC)
	FILETIME=[D794D860:01CF314E]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: add (custom) license file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 10:54:53 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain

This is will delete this message:
WARNING: vim: No generic license file exists for: vim in any provider

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/licenses/vim | 81 
++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta-oe/licenses/vim

diff --git a/meta-oe/licenses/vim b/meta-oe/licenses/vim
new file mode 100644
index 0000000..4aa818e
--- /dev/null
+++ b/meta-oe/licenses/vim
@@ -0,0 +1,81 @@
+VIM LICENSE
+
+I)  There are no restrictions on distributing unmodified copies of Vim 
except
+    that they must include this license text.  You can also distribute
+    unmodified parts of Vim, likewise unrestricted except that they must
+    include this license text.  You are also allowed to include 
executables
+    that you made from the unmodified Vim sources, plus your own usage
+    examples and Vim scripts.
+
+II) It is allowed to distribute a modified (or extended) version of Vim,
+    including executables and/or source code, when the following four
+    conditions are met:
+    1) This license text must be included unmodified.
+    2) The modified Vim must be distributed in one of the following five 
ways:
+       a) If you make changes to Vim yourself, you must clearly describe 
in
+	  the distribution how to contact you.  When the maintainer asks you
+	  (in any way) for a copy of the modified Vim you distributed, you
+	  must make your changes, including source code, available to the
+	  maintainer without fee.  The maintainer reserves the right to
+	  include your changes in the official version of Vim.  What the
+	  maintainer will do with your changes and under what license they
+	  will be distributed is negotiable.  If there has been no negotiation
+	  then this license, or a later version, also applies to your changes.
+	  The current maintainer is Bram Moolenaar <Bram@vim.org>.  If this
+	  changes it will be announced in appropriate places (most likely
+	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
+	  impossible to contact the maintainer, the obligation to send him
+	  your changes ceases.  Once the maintainer has confirmed that he has
+	  received your changes they will not have to be sent again.
+       b) If you have received a modified Vim that was distributed as
+	  mentioned under a) you are allowed to further distribute it
+	  unmodified, as mentioned at I).  If you make additional changes the
+	  text under a) applies to those changes.
+       c) Provide all the changes, including source code, with every copy 
of
+	  the modified Vim you distribute.  This may be done in the form of a
+	  context diff.  You can choose what license to use for new code you
+	  add.  The changes and their license must not restrict others from
+	  making their own changes to the official version of Vim.
+       d) When you have a modified Vim which includes changes as 
mentioned
+	  under c), you can distribute it without the source code for the
+	  changes if the following three conditions are met:
+	  - The license that applies to the changes permits you to distribute
+	    the changes to the Vim maintainer without fee or restriction, and
+	    permits the Vim maintainer to include the changes in the official
+	    version of Vim without fee or restriction.
+	  - You keep the changes for at least three years after last
+	    distributing the corresponding modified Vim.  When the maintainer
+	    or someone who you distributed the modified Vim to asks you (in
+	    any way) for the changes within this period, you must make them
+	    available to him.
+	  - You clearly describe in the distribution how to contact you.  This
+	    contact information must remain valid for at least three years
+	    after last distributing the corresponding modified Vim, or as long
+	    as possible.
+       e) When the GNU General Public License (GPL) applies to the 
changes,
+	  you can distribute the modified Vim under the GNU GPL version 2 or
+	  any later version.
+    3) A message must be added, at least in the output of the ":version"
+       command and in the intro screen, such that the user of the 
modified Vim
+       is able to see that it was modified.  When distributing as 
mentioned
+       under 2)e) adding the message is only required for as far as this 
does
+       not conflict with the license used for the changes.
+    4) The contact information as required under 2)a) and 2)d) must not 
be
+       removed or changed, except that the person himself can make
+       corrections.
+
+III) If you distribute a modified version of Vim, you are encouraged to 
use
+     the Vim license for your changes and make them available to the
+     maintainer, including the source code.  The preferred way to do this 
is
+     by e-mail or by uploading the files to a server and e-mailing the 
URL.
+     If the number of changes is small (e.g., a modified Makefile) 
e-mailing a
+     context diff will do.  The e-mail address to be used is
+     <maintainer@vim.org>
+
+IV)  It is not allowed to remove this license from the distribution of 
the Vim
+     sources, parts of it or from a modified version.  You may use this
+     license for previous Vim releases instead of the license that they 
came
+     with, at your option.
+
+===
+Read more about this license at 
http://vimdoc.sourceforge.net/htmldoc/uganda.html#license
-- 
1.8.5.4



About Ingenico (Euronext: FR0000125346 – ING)
Ingenico is a leading provider of payment solutions, with over 20 million 
terminals deployed in more than 125 countries. Its 4,000 employees 
worldwide support retailers, banks and service providers to optimize and 
secure their electronic payments solutions, develop their offer of 
services and increase their point of sales revenue. More information on 
http://www.ingenico.com/ | http://twitter.com/Ingenico.
This message may contain confidential and/or privileged information. If 
you are not the addressee or authorized to receive this for the addressee, 
you must not use, copy, disclose or take any action based on this message 
or any information herein. If you have received this message in error, 
please advise the sender immediately by reply e-mail and delete this 
message. Thank you for your cooperation.
P Please consider the environment before printing this e-mail




