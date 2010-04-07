Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1NzXjA-0006EQ-Ue
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 18:03:41 +0200
Received: by ewy3 with SMTP id 3so475125ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=VA2hez9TglCN+3kpecL1K/3fRTY+lOrkPeV4AvwmPVU=;
	b=gNv3C8NLs+O0PQetB9UrTlg/gS8QSAARGNMbEQIm5YpV+uOrIz7Xxndn9u6oWvZMZV
	uLcDQdyJZfAKl5YazG0QYOzIpOp3E4ZK1fWfUbKxsikjlXlYSCyKV0F2BpIzJ5wS3Ik/
	EE0eyyWvKh2Ka6+EpV3K8d+TVjqJUCT80DljA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=DUM3RXGSCWerw8KcDrj9ovXgxqEpiYp2FWqSPwwexNL9Wx/2OsQI8htpkZsfFQVNDw
	fT/wx8FnM1DLVXun7tOtQ5/hglGQhaGPTocbt77o93Nmgz1Izvp3IWvpNSa+9oh9L92S
	s1olePxacbrqxpzzF4k6ODPDGxPONUVsyteRA=
Received: by 10.102.226.1 with SMTP id y1mr4978419mug.0.1270656018590;
	Wed, 07 Apr 2010 09:00:18 -0700 (PDT)
Received: from merkur.sol.de (p4FD73444.dip0.t-ipconnect.de [79.215.52.68])
	by mx.google.com with ESMTPS id 23sm5380587mun.37.2010.04.07.09.00.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Apr 2010 09:00:15 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NzXQs-0002Yj-L9
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 17:44:47 +0200
Date: Wed, 7 Apr 2010 17:44:46 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100407154445.GA9625@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<1270237489.3714.11.camel@mattotaupa>
	<1270293620.3692.33.camel@mattotaupa>
	<20100403135105.GA6475@merkur.sol.de>
	<1270305838.4237.23.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1270305838.4237.23.camel@mattotaupa>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00, SPF_PASS, WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autopoint || touch config.rpath
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
X-List-Received-Date: Wed, 07 Apr 2010 16:03:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

I'm sorry for replying so late.

Originally you wrote
(http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018796.html):

> Now I am getting the following error message during `configure`.
> configure.ac:35: required file `./config.rpath' not found

To be honest I had trouble reproducing it without bitbake. Probably I should
take the time to learn it ...

Nevertheless according to my autotools knowledge this comes from ommitting
autopoint, which installs this file and is by default called from
autoreconf.
Have you tried removing the line EXTRA_AUTORECONF = "--exclude=autopoint"
in [2]?

But --exclude=autopoint is no valid option for version 2.65. Mhm ...

Try also to use the option -v of autoreconf, some warnings are only visible
in verbose mode (such as sometimes:
"autoreconf: configure.ac: not running autopoint: --install not given").

> So `autogen.sh` needs to be run and I just found the following
> hint.
>
>        do_configure_prepend() {
>               sh autogen.sh
>        }
>
> But this fails with the error that C programs cannot be executed.

This fails because this already starts configure without crosscompiling
options. Set the environment variable "NOCONFIGURE=yes" before calling
autogen.sh. Does it help?

On Sat, Apr 03, 2010 at 04:43:58PM +0200, Paul Menzel wrote:
> Am Samstag, den 03.04.2010, 15:51 +0200 schrieb Jens Seidel:
> > On Sat, Apr 03, 2010 at 01:20:20PM +0200, Paul Menzel wrote:
> > > Am Freitag, den 02.04.2010, 21:44 +0200 schrieb Paul Menzel:
> > > > Am Freitag, den 02.04.2010, 11:28 -0700 schrieb Khem Raj:
> > > > > On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> > Let me short summarize:
> > 
> > automake is a tool to generate Makefile templates (called Makefile.in) from
> > Makefile.am files. Normally a tgz ball ships already these generated files
> > (that's dictated by GNU). Nevertheless these files are often not committed
> > into version control systems and a script autogen.sh or better autoreconf is
> > used to generate Makefile.in by calling automake. But autoreconf calls even
> > more: e.g. autoconf (which generated configure) and now also autopoint.
> > autopoint generated the gettext infrastructure (the translation system to

s/generated/generates/

> > support foreign languages) by copying all non config dependent gettext files
> > (such as Makefile.in.in, some scripts, ...) into po and m4 macros. That's

should be (sorry):
(such as Makefile.in.in, some scripts, m4 macros, ...) into the directory po/.

> > also a good thing as this avoids committing generated files.
 
> Thank you for this great summary. I am still clueless about
> `config.rpath` though.

Yep, try the hints above.
 
> Correct. Though as far as I understood it using `inherit autotools` OE
> is using its own commands to set up the environment using
> `autotools.bbclass` and there you will find the following line [2]
> causing problems [3].
> 
>     EXTRA_AUTORECONF = "--exclude=autopoint"
> 
> Nobody knows why this was added in the first place, but if you try to

What about git? Try git blame, git log.

I suggest to just remove it if it works without!

autopoint has dependance to cvs: it requires the client as it
ships a local CVS repository to handle various gettext versions (if a
package mentions it needs only version x.y of gettext, autopoint copies only
this version (no newer one) into the directory to verify that x.y. is indeed
sufficient). Maybe autopoint was excluded to avoid this dependence, there
were some similar problems in Debian (http://bugs.debian.org/432270) and
Gentoo, where CVS was not added as requirement for gettext (which ships
autopoint).

> configure Enna [4] for example it will fail as I reported [5]. Other
> packages seem to be affected too.
> 
> The argument is called in this line [6].
> 
>     oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
>     autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
> 
> I cannot reproduce this using the provided files by Enna in my local
> environment.
 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotools.bbclass
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotools.bbclass#n38
> [3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018818.html
> [4] http://enna.geexbox.org/
> [5] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018796.html
> [6] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotools.bbclass#n136



