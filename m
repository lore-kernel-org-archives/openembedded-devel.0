Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>)
	id 1NGV3Q-0000Ke-CQ; Fri, 04 Dec 2009 11:06:27 +0100
Received: by bwz9 with SMTP id 9so1743802bwz.12
	for <multiple recipients>; Fri, 04 Dec 2009 02:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Gxh7t54mtRoag+0w0qYk9wxwdKVqLBwkz5C4seLjSPI=;
	b=CMK5zulzHyAPEmu5fWwKPLAzLfaSNtpapAElYn9wrtJK4GSsDt47Mr/FqnfSDcpGxT
	L/SQWAyX92SqVp9t+7ZSC1Ag4e35zTPT4bUXx0/Sky0IkkLm+qoN/crq3R1nKqrIGrFM
	hVpWCab12LHQXp/qAuBxpT9sjw2IC5TpGI+v4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cRFC02SqMDV9DVsba+bDRe6dCSbbsNbWllb7XFszOmIRacN+03Pv8+7RhSXHLYllS/
	SmAXa7RI2fE7yx5Y21+Mx+0d4U20BQxhExfHzKQtouRF9PYHJ/2wm46ftD6NLXDIbqS9
	fxLuFwiap9858WtUVmlanMLilRiTAOMz8eUZE=
Received: by 10.204.13.212 with SMTP id d20mr1294989bka.63.1259921087501;
	Fri, 04 Dec 2009 02:04:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1028053fxm.14.2009.12.04.02.04.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Dec 2009 02:04:47 -0800 (PST)
Date: Fri, 4 Dec 2009 11:04:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091204100443.GA13717@jama>
References: <E1NGUiP-00061U-6s@melo.openembedded.org>
	<141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>
	<20091204095951.6846190d@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20091204095951.6846190d@xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Fri, 04 Dec 2009 10:06:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2009 at 09:59:51AM +0000, Graeme Gregory wrote:
> On Fri, 4 Dec 2009 10:51:18 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > On Fri, Dec 4, 2009 at 10:44 AM, git version control <
> > git@git.openembedded.org> wrote:
> > 
> > > Module: openembedded.git
> > > Branch: org.openembedded.dev
> > > Commit: a0fb85891d24df07bd140f0b9f277e9ebb3768d7
> > > URL:
> > > http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=a0fb85891d24df07bd140f0b9f277e9ebb3768d7
> > >
> > > Author: David-John Willis <John.Willis@Distant-earth.com>
> > > Date:   Thu Dec  3 09:30:27 2009 +0000
> > >
> > > font-util: Add 1.1.1 target and native.
> > >
> > 
> > http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=martin_jansa/xorg-7.5&id=c465d9fcf16a6e42afc2f984978ddeaacd9568d3
> > 
> > 
> > You still probably need this patch.
> > 
> > Would be great to merge it from that branch first, I like INC_PR but
> > now I'll get lots of conflicts in all font packages and I'll have to
> > update font recipes in that branch to INC_PR too :/.
> > 
> > BTW: as I don't have all angstrom/OE supported devices to test
> > xorg-7.5 there, I won't merge that branch to oe.dev myself, I need
> > help from device/distro maintainers, please...
> > 
> We have the preferred-x11R6 versions files so people can lock
> themselves to 7.4 if they wish.
> 
> You'll be waiting approximately for infinity if you wait to test on all
> devices. I'd say merge it.
> 
> Graeme

But ie angstrom has no include for xorg versions, so I need to test it
at least on angstrom supported devices or include preferred-X11R6 in
angstrom config which is maybe not so good idea (at least pixman,
xserver and now font recipes needs to be higher than what was in X11R6.

I have only spitz and freerunner for test on real device...

Should I merge oe.dev to that "short lived" xorg-7.5 branch? (lots of
commits but better to resolve conflicts once there than in every
distribution tester who merge that branch as shr do).

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


