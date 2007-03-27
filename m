Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HWIKq-0001DY-D4
	for openembedded-devel@openembedded.org; Tue, 27 Mar 2007 22:32:04 +0200
Received: (qmail 5895 invoked by uid 813007); 27 Mar 2007 20:32:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 Mar 2007 20:32:02 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2007 22:31:55 +0200
User-Agent: KMail/1.9.6
References: <46097B18.3050901@trolltech.com>
In-Reply-To: <46097B18.3050901@trolltech.com>
MIME-Version: 1.0
Message-Id: <200703272231.55842.openembedded@hrw.one.pl>
Subject: Re: org.openembedded.dev fixes
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
X-List-Received-Date: Tue, 27 Mar 2007 20:32:05 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 27 marca 2007, Lorn Potter napisa=B3:
> * file needs a version update to 4.19 (4.17 doesn't exist)

We updated to 4.20 some time ago.

> * tslib needs url update and svn.bb as well

=46or tslib we use 1.0 release tarball. SVN version is nice addon but pleas=
e=20
split common stuff into tslib.inc and make both recipe use it.

Linux-hotplug probably need "install -d" first.

=46or future: please update first to check does work was done and send=20
updates as 'diff -up' patches (or "mtn diff").

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Someday I'm gonna die but it won't be from boredom [Pink]




