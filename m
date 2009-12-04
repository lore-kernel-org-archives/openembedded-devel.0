Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>)
	id 1NGUye-0008VG-7Z; Fri, 04 Dec 2009 11:01:31 +0100
Received: by bwz9 with SMTP id 9so1740839bwz.12
	for <multiple recipients>; Fri, 04 Dec 2009 01:59:51 -0800 (PST)
Received: by 10.204.156.28 with SMTP id u28mr2991012bkw.74.1259920791095;
	Fri, 04 Dec 2009 01:59:51 -0800 (PST)
Received: from localhost (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 15sm803657bwz.4.2009.12.04.01.59.50
	(version=SSLv3 cipher=RC4-MD5); Fri, 04 Dec 2009 01:59:50 -0800 (PST)
Date: Fri, 4 Dec 2009 09:59:51 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20091204095951.6846190d@xora.org.uk>
In-Reply-To: <141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>
References: <E1NGUiP-00061U-6s@melo.openembedded.org>
	<141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] David-John Willis : font-util: Add 1.1.1 target and native.
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
X-List-Received-Date: Fri, 04 Dec 2009 10:01:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Dec 2009 10:51:18 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Dec 4, 2009 at 10:44 AM, git version control <
> git@git.openembedded.org> wrote:
> 
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: a0fb85891d24df07bd140f0b9f277e9ebb3768d7
> > URL:
> > http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=a0fb85891d24df07bd140f0b9f277e9ebb3768d7
> >
> > Author: David-John Willis <John.Willis@Distant-earth.com>
> > Date:   Thu Dec  3 09:30:27 2009 +0000
> >
> > font-util: Add 1.1.1 target and native.
> >
> 
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=martin_jansa/xorg-7.5&id=c465d9fcf16a6e42afc2f984978ddeaacd9568d3
> 
> 
> You still probably need this patch.
> 
> Would be great to merge it from that branch first, I like INC_PR but
> now I'll get lots of conflicts in all font packages and I'll have to
> update font recipes in that branch to INC_PR too :/.
> 
> BTW: as I don't have all angstrom/OE supported devices to test
> xorg-7.5 there, I won't merge that branch to oe.dev myself, I need
> help from device/distro maintainers, please...
> 
We have the preferred-x11R6 versions files so people can lock
themselves to 7.4 if they wish.

You'll be waiting approximately for infinity if you wait to test on all
devices. I'd say merge it.

Graeme


