Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NB5d3-0003x3-KJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 12:56:53 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NB5bd-0008Dx-Kh
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 11:55:21 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NB5bb-0002LU-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 11:55:19 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
Date: Thu, 19 Nov 2009 11:55:15 +0000
Message-Id: <1258631715.23826.63.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 11:56:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-18 at 20:21 -0200, Otavio Salvador wrote:
> Hello Phil,
> 
> On Wed, Nov 18, 2009 at 6:42 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2009-11-18 at 18:11 -0200, Otavio Salvador wrote:
> >> From my POV the best alternative is, before we start changing a lot of
> >> stuff in dev we do a merge of stable/2009 into dev to allow easy
> >> merging from outside "forks" made by users.
> >
> > I don't quite understand what you mean by merging stable/2009 into dev.
> > Isn't it the case that all the changesets in stable/2009 were
> > cherry-picked from .dev in the first place, and hence are already there?
> >
> > Can you give a bit more detail on what exactly you are proposing?
> 
> Please try it:
> 
> git checkout -b merge-try origin/org.openembedded.dev
> git merge stable/2009
> 
> You'll notice how many conflicts it produces.

Right, but I think these conflicts are a result of attempting what seems
like a nonsensical merge. 

Which specific changesets from stable/2009 do you feel are missing
in .dev?

p.




