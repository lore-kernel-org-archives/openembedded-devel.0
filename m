Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KzVKt-0007Xw-S8
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 12:53:40 +0100
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 45FB132C008
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 09:51:48 -0200 (BRST)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 4C9C632C007
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 09:51:46 -0200 (BRST)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 10 Nov 2008 09:51:46 -0200
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 4F3A78E5FD6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 09:51:46 -0200 (BRST)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 1FF8E8E1D76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 09:51:46 -0200 (BRST)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 10 Nov 2008 09:51:46 -0200
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 8530DC1AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 09:51:45 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E437FC48C77; Mon, 10 Nov 2008 09:48:02 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <1226054458.7175.3.camel@aquilonia>
	<87mygarid7.fsf@neumann.lab.ossystems.com.br>
	<1226256825.6785.0.camel@aquilonia>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 10 Nov 2008 09:48:02 -0200
In-Reply-To: <1226256825.6785.0.camel@aquilonia> (Graeme Gregory's message of
	"Sun\, 09 Nov 2008 18\:53\:45 +0000")
Message-ID: <87wsfbhkel.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Xorg X11R7.4 updates
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
X-List-Received-Date: Mon, 10 Nov 2008 11:53:40 -0000
Content-Type: text/plain; charset=us-ascii

Graeme Gregory <dp@xora.org.uk> writes:

> On Sat, 2008-11-08 at 01:45 -0200, Otavio Salvador wrote:
>
>> I've gave it a try and xserver fails to build here with:
>> 
>> | checking for XLIB... yes
>> | checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
>> | 
>> | No package 'gl' found
>> | 
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> | 
>> | Alternatively, you may set the environment variables GL_CFLAGS
>> | and GL_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> | 
>> | FATAL: oe_runconf failed
>> NOTE: Task failed: /home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/xserver-xorg-1_1.5.1-r0/temp/log.do_configure.21623
>> NOTE: package xserver-xorg-1_1.5.1-r0: task do_configure: failed
>> ERROR: TaskFailed event exception, aborting
>> NOTE: package xserver-xorg-1.5.1: failed
>> 
> Hi, I tried a build from scatch of xserver-xorg, found 2 missing
> dependencies in the tree, but I am unable to repeat this problem.

Build it using a x86 processor ;-)

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


