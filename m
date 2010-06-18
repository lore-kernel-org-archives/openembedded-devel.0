Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OPTJy-0002FZ-6Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 06:37:00 +0200
Received: by vws19 with SMTP id 19so1131861vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 21:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=mI5RODy9YtkImVYNJeo95Jxp0sjX71uf0cjuTVF48tI=;
	b=M/IMmtwYbb1IOSyiJUyNRhN/TetwucuqjBzQ+uI0GW/YOKygFVkXjG2sH2/aqe7w08
	yxkWpUYh2hsfq2IrotspcbvZAyyXTdp9l29IjtA12ehrYiRcGFKtXTRgsqXSIfDZSVEz
	0Lp6HFy9H/PPj687z1sAxf5TdzjFOL3RUUHCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=X2BCXK0X9RpqR9d4FBJ78BaqzaoLLraAfRTkAtgqLW2b9LjrsPMThV6b8lyUVKWzgz
	lEVpXCLmX4fQH58tJIJtKdEBU1nxpAQ1r+rAsDgTYQIpQmR4glcZ8vIZdGKHXvCUtW8o
	06X6TjIuMiNoIHB8YxyrZ7nK7t/blrmzDbcOU=
Received: by 10.229.188.72 with SMTP id cz8mr222313qcb.75.1276835538264; Thu, 
	17 Jun 2010 21:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Thu, 17 Jun 2010 21:31:58 -0700 (PDT)
In-Reply-To: <AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com> 
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com> 
	<AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com> 
	<AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Fri, 18 Jun 2010 10:01:58 +0530
Message-ID: <AANLkTil_0hvO6IEEdDETdTY9DKU_sdq5qIPsHl1H00Pr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Fri, 18 Jun 2010 04:37:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Khem,
Yes , It exists and has the following contents:
*
[          comm       du         head       md5sum     od         rm
shuf       tail       uname      yes
base64     cp         echo       hostid     mkdir      paste      rmdir
sleep      tee        unexpand
basename   csplit     env        id         mkfifo     pathchk    runcon
sort       test       uniq
cat        cut        expand     install    mknod      pinky      seq
split      timeout    unlink
chcon      date       expr       join       mktemp     pr         sha1sum
stat       touch      uptime
chgrp      dd         factor     kill       mv         printenv   sha224sum
stdbuf     tr         users
chmod      df         false      link       nice       printf     sha256sum
stty       true       vdir
chown      dir        fmt        ln         nl         ptx        sha384sum
sum        truncate   wc
chroot     dircolors  fold       logname    nohup      pwd        sha512sum
sync       tsort      who
cksum      dirname    groups     ls         nproc      readlink   shred
tac        tty        whoami*



Nikunj Badjatya
BTech




On Fri, Jun 18, 2010 at 12:41 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jun 17, 2010 at 5:39 AM, nikunj badjatya
> <nikunjbadjatya@gmail.com> wrote:
> > /home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
> > do_populate_sysroot)
> > NOTE: Testing
> >
> /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> > for relocatability
> > ERROR: Error in executing:
> /home/nikunj/ope/openembedded/recipes/coreutils/
> > coreutils-native_8.5.bb
> > ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
> > directory
> > ERROR: Printing the environment of the function
> > ERROR: Error in executing:
> /home/nikunj/ope/openembedded/recipes/coreutils/
> > coreutils-native_8.5.bb
> > ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
> > directory
> > ERROR: Printing the environment of the function
> > ERROR: Build of /home/nikunj/ope/openembedded/recipes/coreutils/
> > coreutils-native_8.5.bb do_populate_sysroot failed
>
> Does
>  /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> exist ?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

