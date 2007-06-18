Received: from [65.54.246.150] (helo=bay0-omc2-s14.bay0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pelle2004@hotmail.com>) id 1I0F74-0002bY-6x
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2007 13:09:38 +0200
Received: from hotmail.com ([65.55.154.104]) by bay0-omc2-s14.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.2668); 
	Mon, 18 Jun 2007 04:06:06 -0700
Received: from mail pickup service by hotmail.com with Microsoft SMTPSVC;
	Mon, 18 Jun 2007 04:06:06 -0700
Message-ID: <BAY143-F24A7882AECEEB415CE95A8B9130@phx.gbl>
Received: from 65.55.154.123 by by143fd.bay143.hotmail.msn.com with HTTP;
	Mon, 18 Jun 2007 11:06:02 GMT
X-Originating-IP: [194.236.6.194]
X-Originating-Email: [pelle2004@hotmail.com]
X-Sender: pelle2004@hotmail.com
From: "Pelle Svensson" <pelle2004@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Bcc: 
Date: Mon, 18 Jun 2007 13:06:02 +0200
Mime-Version: 1.0
X-OriginalArrivalTime: 18 Jun 2007 11:06:06.0866 (UTC)
	FILETIME=[AB31C720:01C7B198]
Subject: Some help on building a new dist.
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
X-List-Received-Date: Mon, 18 Jun 2007 11:09:38 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed

Hi all,

I have playing around with OE and builded some packages ect.
I have a project that I would like to build with OE.
Where and how should I start.

I have a fully working system with rootfs, bootloader, kernel and 
applications
builded with outside OE with crosstools and some scripts.

Have I understand OE correctly if it has fully dependency from a the point
where I issue 'bitbake mysystem'.

My questions are:

1. What 'packages/*/*.bb' file do I need to create.
Do I need one for putting the rootfs/jffs2 toghether, one for tasks, and one 
for the kernel.
Where should they be located.

2. What is the relation beetween packages files.
Looking at opie it seems that
.../images/opie-image.bb <- .../tasks/task-opie.bb <- a huge set of 
'opie-..' pkg

I have read this section and the manual for creating new targets
http://www.openembedded.info/wiki/New_targets#Fileystem_image

Should I start doing a copy of opie or?
Have I forgotten anything beside 'local.conf'

/Pelle






Kernel

_________________________________________________________________
Kolla in coola trailern till Die Hard 4 
http://specials.se.msn.com/diehard4/default.aspx



