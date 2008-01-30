Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKMaT-0001Ej-9P
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2008 00:43:25 +0100
Received: by ug-out-1314.google.com with SMTP id i24so451667ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 15:43:32 -0800 (PST)
Received: by 10.67.100.12 with SMTP id c12mr3382170ugm.28.1201736612847;
	Wed, 30 Jan 2008 15:43:32 -0800 (PST)
Received: from widy.localdomain ( [88.231.64.33])
	by mx.google.com with ESMTPS id 5sm2366897ugc.25.2008.01.30.15.43.31
	(version=SSLv3 cipher=OTHER); Wed, 30 Jan 2008 15:43:31 -0800 (PST)
Date: Thu, 31 Jan 2008 01:56:06 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080131015606.481c0eb7@widy.localdomain>
In-Reply-To: <fnqqtt$e5o$1@ger.gmane.org>
References: <fnqakr$ffa$1@ger.gmane.org>
	<20080130203832.31fd5919@widy.localdomain>
	<fnqqtt$e5o$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Wed, 30 Jan 2008 23:43:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Jan 2008 22:41:18 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Paul Sokolovsky schrieb:
> > Let's descend a bit into past then.
> 
> No.  Please don't do that.  And certainly not at this length.  It does
> not bring us one step closer to a solution.
> 
> And as koen has already pointed out, several distros using the same
> bug tracker creates problems of its own.  Let's try to solve them
> this time.
> 
> No use arguing about the past.  Let's argue about the future.

One good solution we worked towards for a long time was to have a common
distro which saved us from all this headache. Now you have
another distro and special needs due to it, way to you to settle them.
Otherwise, I'm, as an Ansgtrom core team members, interested in
providing users actual status of support and list of known issues which
are currently done via tracker, using dependencies to link issues
together. And I do this not because I like that, but because it must be
done and noone else yet stepped for that. To keep the list clean,
there're special procedures, for example, bug first triaged and
confirmed, and only then associated to the meta-bug, not the other way
around.

Machine bugs are indeed vague matter and the way it was RFCed (sic!)
assumed that there's one common distro and that machine mentors
maintain the list well. After all, bugs are there for not to be, even
well organized, but to be maintained and resolved.



