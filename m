Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1JEM3k-00009I-Eb
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2008 10:56:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id ED71F95B5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:56:18 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 09737-01-2 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:56:18 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id D08CE95B42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:56:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id E5AC21D946C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:56:18 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 10327-01-4 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:56:18 +0100 (CET)
Received: from [192.168.1.163]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id D4B2B1D9488
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 10:55:54 +0100 (CET)
Message-ID: <478B31AB.2010000@spesonline.com>
Date: Mon, 14 Jan 2008 10:55:55 +0100
From: ohviey1 <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <fm86ci$o6r$1@ger.gmane.org> <fm89sl$51l$1@ger.gmane.org>
In-Reply-To: <fm89sl$51l$1@ger.gmane.org>
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: don't find this packed in the ftp server
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
X-List-Received-Date: Mon, 14 Jan 2008 09:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

NOTE: Task failed: Fetch failed: 
http://download.gnome.org/sources/glib/2.12/glib-2.14.5.tar.bz2
NOTE: package glib-2.0-native-2.14.5-r2: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glib-2.0-native-2.14.5: failed
ERROR: Build of 
/home/stefano/poky/meta/packages/glib-2.0/glib-2.0-native_2.14.5.bb 
do_fetch failed
ERROR: Task 1169 
(/home/stefano/poky/meta/packages/glib-2.0/glib-2.0-native_2.14.5.bb, 
do_fetch) failed
NOTE: Tasks Summary: Attempted 202 tasks of which 202 didn't need to be 
rerun and 1 failed.
ERROR: 
'/home/stefano/poky/meta/packages/glib-2.0/glib-2.0-native_2.14.5.bb' failed



