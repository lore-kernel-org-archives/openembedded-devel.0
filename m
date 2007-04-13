Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HcIOS-0000Ti-Ci
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 11:48:36 +0200
Received: (qmail 29489 invoked by uid 813007); 13 Apr 2007 09:48:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Apr 2007 09:48:35 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Apr 2007 11:48:31 +0200
User-Agent: KMail/1.9.6
References: <461F4C4A.7010401@whitby.id.au>
In-Reply-To: <461F4C4A.7010401@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200704131148.32947.openembedded@hrw.one.pl>
Subject: Re: Where should MACHINE_TASK_PROVIDER be defined?
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
X-List-Received-Date: Fri, 13 Apr 2007 09:48:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 13 kwietnia 2007, Rod Whitby napisa=B3:
> There seems to be significant inconsistency in the way that
> MACHINE_TASK_PROVIDER is defined in OE (see the output of a recursive
> grep command in .../conf at the end of this message).
>
> It's defaulted to "task-base" in bitbake.conf, and then every man and
> his dog forcibly defines it to the same thing in a variety of
> machine.conf files and distro.conf files.
>
> Should all of these instances simply be deleted

Yes - most of them are from time when we had task-bootstrap as default.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Packrat's Credo:
         	I have no use for it, but I hate to see it go to waste.




