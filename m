Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GXKFM-0007hY-CW
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 18:14:24 +0200
Received: by wx-out-0506.google.com with SMTP id h30so2076097wxd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2006 09:08:13 -0700 (PDT)
Received: by 10.70.83.8 with SMTP id g8mr13732638wxb;
	Tue, 10 Oct 2006 09:08:12 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.google.com with ESMTP id i5sm496145nzi.2006.10.10.09.08.10;
	Tue, 10 Oct 2006 09:08:11 -0700 (PDT)
Date: Tue, 10 Oct 2006 19:08:14 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1646477210.20061010190814@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20061010153918.GD2541@stygia.hyboria>
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
	<20061010153918.GD2541@stygia.hyboria>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 16:14:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Graeme,

Tuesday, October 10, 2006, 6:39:18 PM, you wrote:

> A suggestion as to a possible format for MAINTAINERS file.

> I tried to be machine parsable and human parsable.

> DEVELOPER {
> NAME="Koen Kooi"
> NICK="koen"
> EMAIL="Koen Kooi <koen@openembedded.org>
> MACHINE="h2200 ipaq-pxa270"
> DISTRO="angstrom.*"
> RECPIPES="gnome/.* gnumeric/.*"
> }

  Well, just a note: this seems just like *too much machine* parsable
;-). As far as got from idea of removing the var, intention of the
list to be machine parsable was simple things, like sorting it
in some order or rendering in HTML. Not being able to write
a script which, for any given package, will return a maintainer for
it. In other words, I understood that intention was that maintainer
list's contents were intended for human consumption, and only syntax
of it should be machine-readable.

  Because otherwise, MAINTAINER field could have stayed the way it
was.

  Please correct me if I'm wrong.


Marcin Juszkiewicz wrote:

> Person:     Koen Kooi
> Mail:       koen@openembedded.org
> Website:    http://dominion.kabel.utwente.nl/koen/cms
> Machines:   h2200, ipaq-pxa270, efika, ep93xx, netbook-pro
> Distros:    Angstrom
> Recipes:    OpenSync,, GNOME, GPE, Matchbox
> Recipes:    abiword, bootchart, dia, farsight, freeciv, fuse, galago, geda,
> Recipes:    gimp, gnumeric, (g)obby, imposter, inkscape
> Recipes:    telepathy, tilibs, xchat, xournal. 


> Cheers

> G


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



