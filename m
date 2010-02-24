Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NkHok-0002BL-3L
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 15:02:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B17D02CA11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 13:55:26 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At3d0ckvXDat
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 13:55:22 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id B8AF62C81E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 13:55:21 +0000 (UTC)
Message-ID: <4B8530C2.20708@gmail.com>
Date: Wed, 24 Feb 2010 14:59:30 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201002241118467818011@tom.com>
In-Reply-To: <201002241118467818011@tom.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dbus postinst failed.
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
X-List-Received-Date: Wed, 24 Feb 2010 14:02:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Readon Shaw ha scritto, Il 24/02/2010 04:18:
> it report that messagebox is not a regular user while my image is booting. 
> after tracing, i found that dbus package's postinst script was not executed.
> the log shows that "offline root mode: not running dbus-1.postinst"
> in order that adduser command in the .postinst file have no effect.
> 
> how to solve that? is it a bug?
> 

Please post error log to clarify the problem.
BTW this problem should has been solved last night by 'denix'

Cheers
/marco


