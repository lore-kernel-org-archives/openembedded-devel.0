Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HPJ7W-0008Ux-M6
	for openembedded-devel@openembedded.org; Thu, 08 Mar 2007 14:57:26 +0100
Received: (qmail 31651 invoked by uid 813007); 8 Mar 2007 13:57:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 8 Mar 2007 13:57:25 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Mar 2007 14:57:20 +0100
User-Agent: KMail/1.9.6
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200703050904.53588.openembedded@hrw.one.pl>
	<45EEF1C3.9030402@dominion.kabel.utwente.nl>
In-Reply-To: <45EEF1C3.9030402@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200703081457.21687.openembedded@hrw.one.pl>
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Thu, 08 Mar 2007 13:57:27 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 7 marca 2007, Koen Kooi napisa=C5=82:

> OK, I see no objections from people, commit it tonight?

It is not ready for commit. It need testing, improving and then commiting.=
=20
Now it does not even work fully:

ERROR: No providers of runtime build target task-base-usbhost-bluetooth=20
(for=20
['/home/hrw/devel/oe/org.openembedded/packages/tasks/task-base-new.bb'])
NOTE: Removing failed runtime build target task-base-usbhost-bluetooth
NOTE: Removing failed runtime build target task-base-machine
NOTE: Removing failed runtime build target task-base-bluetooth
NOTE: Removing failed runtime build target task-distro-base
NOTE: Removing failed runtime build target task-base-kernel26
NOTE: Removing failed runtime build target task-distro-nfs
NOTE: Removing failed runtime build target task-base-usbhost
NOTE: Removing failed runtime build target task-base-apm
NOTE: Removing failed runtime build target task-distro-ppp
NOTE: Removing failed runtime build target task-base-alsa
ERROR: No providers of runtime build target task-base-usbhost-irda (for=20
['/home/hrw/devel/oe/org.openembedded/packages/tasks/task-base-new.bb'])
NOTE: Removing failed runtime build target task-base-usbhost-irda
ERROR: No providers of runtime build target task-base-kernel26-extras (for=
=20
['/home/hrw/devel/oe/org.openembedded/packages/tasks/task-base-new.bb'])
NOTE: Removing failed runtime build target task-base-kernel26-extras
ERROR: No providers of runtime build target task-distro-extras after=20
filtering (for=20
['/home/hrw/devel/oe/org.openembedded/packages/tasks/task-base-new.bb'])
NOTE: Removing failed runtime build target task-distro-extras
ERROR: No providers of runtime build target task-base-machine-extras after=
=20
filtering (for=20
['/home/hrw/devel/oe/org.openembedded/packages/tasks/task-base-new.bb'])
NOTE: Removing failed runtime build target task-base-machine-extras


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

             It might look like I'm doing nothing,
             but at the cellular level I'm really quite busy!




