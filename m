Received: from [193.252.22.31] (helo=smtp20.orange.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.romain@laposte.net>) id 1MYZdU-0007m4-5p
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 08:06:06 +0200
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2023.orange.fr (SMTP Server) with ESMTP id 9A7FB20000A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2009 07:50:25 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2023.orange.fr (SMTP Server) with ESMTP id 8B6E220000AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2009 07:50:25 +0200 (CEST)
Received: from [192.168.2.2] (AToulouse-554-1-77-238.w90-50.abo.wanadoo.fr
	[90.50.220.238])
	by mwinf2023.orange.fr (SMTP Server) with ESMTP id 517D820000A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2009 07:50:25 +0200 (CEST)
X-ME-UUID: 20090805055025333.517D820000A4@mwinf2023.orange.fr
Message-ID: <4A791000.3060304@laposte.net>
Date: Wed, 05 Aug 2009 06:52:16 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 2.0.0.22 (X11/20090719)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <91283b620908042134h67b41257s2754633a771bf6ca@mail.gmail.com>
In-Reply-To: <91283b620908042134h67b41257s2754633a771bf6ca@mail.gmail.com>
Subject: Re: Error compiling qt4-embedded-gles-4.5.2-r13.1
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
X-List-Received-Date: Wed, 05 Aug 2009 06:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stuart Gray wrote:
> pvrqwswsegl.c:53: error: 'WSEGL_CAP_WINDOWS_USE_MBX_SYNC' undeclared here
> (not in a function)
> pvrqwswsegl.c:54: error: 'WSEGL_CAP_PIXMAPS_USE_MBX_SYNC' undeclared here
> (not in a function

There is some information in the following thread: see [1].
Another guy did a similar patch [2], as well as some other omap3-support 
patches for Qt that you might need.

Regards,

      Cyril

[1] http://markmail.org/thread/jpl6btzqehnwehb4
[2] 
http://qt.gitorious.org/~rambo83/qt/rambo83s-clone/commit/15fa3b0fb140af9a1ae5e51a95fe3cf97cfa69eb
[3] http://qt.gitorious.org/~rambo83/qt/rambo83s-clone




