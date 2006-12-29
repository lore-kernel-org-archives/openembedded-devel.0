Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <robert@linuxdevelopment.de>) id 1H05Th-0003L8-4c
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 01:20:05 +0100
Received: from [85.212.157.146] (helo=[10.0.0.7])
	by mrelayeu.kundenserver.de (node=mrelayeu1) with ESMTP (Nemesis),
	id 0MKwpI-1H05T31YNa-0000ME; Fri, 29 Dec 2006 01:19:28 +0100
Message-ID: <45945F36.30304@linuxdevelopment.de>
Date: Fri, 29 Dec 2006 01:20:06 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 1.5.0.8 (X11/20060911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20061229001129.GA5501@hezmatt.org>
In-Reply-To: <20061229001129.GA5501@hezmatt.org>
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:3a738c603c23670681f156cc7e748d26
Subject: Re: What's with the symlinks?
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
X-List-Received-Date: Fri, 29 Dec 2006 00:20:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dear Matthew

I cant answer your question but i can say ,, it works for me like a charm...

I have a partition where the whole oe stuff is residing ( tree , tmp`s
for various builds ) but i symlinked it inot my /home folder and also
use it in there
so i dont have any problem ( but i remmeber having problems at least a
year ago with symlinking the tree )

Maybe that faq is outdated and not "valid" anymore

Regards
rob_w

Matthew Palmer schrieb:
> Everywhere I go while assembling my OE build tree, I see admonishments not
> to use a path that has symlinks in it.  For such a major problem, the only
> real information on the actual problem is a fairly cryptic entry in the FAQ,
> about a failure to build libtool-native.
>
> Being an intensely curious kind of person, and not enjoying arbitrary
> limits, I'm very interested to know what the *real* reason behind being so
> strongly against the much-maligned symlink.  Can anyone enlighten me?
>
> - Matt
>
>   


