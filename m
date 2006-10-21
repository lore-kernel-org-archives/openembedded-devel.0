Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Gb5QX-0006eF-51
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Oct 2006 03:13:29 +0200
Received: by py-out-1112.google.com with SMTP id i75so11049pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 18:06:16 -0700 (PDT)
Received: by 10.35.17.8 with SMTP id u8mr1666072pyi;
	Fri, 20 Oct 2006 17:41:23 -0700 (PDT)
Received: by 10.35.118.16 with HTTP; Fri, 20 Oct 2006 17:41:23 -0700 (PDT)
Message-ID: <432beae0610201741t6bb6120dr7e7fabd23e56b432@mail.gmail.com>
Date: Fri, 20 Oct 2006 17:41:23 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1161383956.6639.84.camel@localhost.localdomain>
MIME-Version: 1.0
References: <595433076.20061021003331@gmail.com>
	<432beae0610201458l1bde9ca8v7877a6964e94e710@mail.gmail.com>
	<1161383956.6639.84.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 01:13:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/20/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2006-10-20 at 14:58 -0700, Justin Patrin wrote:
> > What exactly are you referring to? Which distributed files? OE doesn't
> > really distribute anything but an OE db and that's one-time downloaded
> > when starting.
> >
> > If you mean the images distributed from OE, that's a distribution
> > choice and OZ in particular can't just make the choice to switch
> > without adding a static binary of bzip2 (for flashing) and changing
> > its flashing script.
>
> I think Paul means things other people distribute i.e. packages
> referenced in SRC_URIs. He's suggesting we prefer bz2 over gz given a
> choice which seems like a good idea.
>

Oh, is *that* what he meant... Yeah, that's a good idea. ;-)

-- 
Justin Patrin


