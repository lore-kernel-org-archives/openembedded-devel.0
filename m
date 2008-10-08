Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KnW3j-00018o-NP
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 12:14:23 +0200
Received: (qmail 18479 invoked by uid 813007); 8 Oct 2008 10:09:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Oct 2008 10:09:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Oct 2008 12:10:00 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27-rc7; KDE/4.1.2; x86_64; ; )
References: <200810080751.15817.zecke@selfish.org>
In-Reply-To: <200810080751.15817.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810081210.00494.openembedded@haerwu.biz>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 10:14:24 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Wednesday 08 of October 2008 07:51:15 Holger Freyther napisa=C5=82(a):

> we would like to switch to git by next wednesday. Jan L=C3=BCbbe went
> through the hassle to fix two issues in my mtn2git.py and we are
> happy with the metadata and can even unite it with the data exported
> from bitkeeper.

> The plans would be:
> 	- Send your public ssh keys if you have not done so

Send them to who? Mickeyl, Koen, Holger, Richard or someone other?

> Tuesday:
> 	- Set monotone readonly 16h german time
> 	- merge the multiple heads (if they exist)
> 	- Try to add the revs from now to tuesday to git

> Wednesday:
> 	- Be back up with git and use that as primary system.
> 	- Disable monotone completely

I would suggest leaving monotone read-only for two weeks so people will=20
have a time to switch. Also adding file like README-THIS-IS-NOT-UPDATED-
SINCE-WE-SWITCHED-TO-GIT with some info would be nice.

> Thanks to Jan for wrestling with monotone, git, the script and the
> data and we will keep you informed about how the migration is going.

Thanks to all people envolved into this switch. My contributions to OE=20
were smaller last time due to my work on Poky but now, when we will be=20
using git I plan to merge some interesting stuff to the OE (my monotone=20
knowledge is smaller then it was year ago).

=2D-=20
JID: hrw@jabber.org




