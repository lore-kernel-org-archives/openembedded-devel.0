Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NXwJ8-0007zq-OO
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:38:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id CEC61A2C393
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 13:36:28 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id kmooeAg-+DEr
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 13:36:28 +0100 (CET)
Received: from tomboy.localnet (pD9E166E2.dip.t-dialin.net [217.225.102.226])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 08BA2A2C390
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 13:36:28 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2010 13:36:27 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-4.slh.2-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<4B584559.1090704@balister.org>
In-Reply-To: <4B584559.1090704@balister.org>
MIME-Version: 1.0
Message-Id: <201001211336.27857.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 12:38:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Donnerstag 21 Januar 2010 13:15:21 schrieb Philip Balister:
> On 01/21/2010 05:20 AM, Dr. Michael Lauer wrote:
> > Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:
> >>> 2. Is there a way to have a staging branch where all patches are
> >>> committed to, which have not been reviewed for let us say one week, to
> >>> get more testing and before they go into the dev branch? Maybe it is
> >>> easier for people to at least test build such a branch?
> >>
> >> Would you be interested in creating such a branch for us? I assume it is
> >> certainly easier to git cherry-pick a patch than to download the mbox
> >> and use git am..
> >
> > I fully agree. I'm neither using patchwork nor do I find patches on the
> > list a good idea. I'd welcome for-oe-upstream trees that would contain
> > patches that -- if good -- we could just pull from.
> 
> I actually like patches on the list, because it makes me aware of how is
> doing work and keeps me aware of the kinds of things people without
> commit access are interested in. Also, it gives people with commit
> access a forum for changes they would like reviewed.
> 
> I am not opposed to someone creating a git branch or branches created
> from list patches, but do not want to see the patches disappear from the
> list.
> 
> If the patch that was sent to the list comes from git-send-patch (I hope
> I hve that correct) there is a script contrib/patchwork/git-am.sh that
> makes it really easy to apply the patch.
> 
> Philip

I'm one of those without commit rights :)
And i think the problem is, that nobody feels responsible for the patches on 
patchwork. I know this situation from SHR patchwork, when you don't ask 
someone directly to commit a patch from patchwork, nobody will do it.
That's the only way it really works currently.
I have 4 people with commit rights i can ask, so i have no problems but others 
probably doesn't know someone...

I think a sort of moderator for patchwork is needed, that assosiats patches to 
the maintainer.

Thomas


