Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KzFxg-0005Db-58
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 20:28:40 +0100
Received: by qw-out-1920.google.com with SMTP id 5so1172669qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 11:26:53 -0800 (PST)
Received: by 10.214.216.7 with SMTP id o7mr5809756qag.155.1226256829721;
	Sun, 09 Nov 2008 10:53:49 -0800 (PST)
Received: from ?192.168.1.10? ([78.86.128.56])
	by mx.google.com with ESMTPS id 4sm3357505qyk.90.2008.11.09.10.53.47
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 10:53:48 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87mygarid7.fsf@neumann.lab.ossystems.com.br>
References: <1226054458.7175.3.camel@aquilonia>
	<87mygarid7.fsf@neumann.lab.ossystems.com.br>
Date: Sun, 09 Nov 2008 18:53:45 +0000
Message-Id: <1226256825.6785.0.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
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
X-List-Received-Date: Sun, 09 Nov 2008 19:28:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-11-08 at 01:45 -0200, Otavio Salvador wrote:

> I've gave it a try and xserver fails to build here with:
> 
> | checking for XLIB... yes
> | checking for GL... configure: error: Package requirements (glproto >= 1.4.9 gl >= 7.1.0) were not met:
> | 
> | No package 'gl' found
> | 
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> | 
> | Alternatively, you may set the environment variables GL_CFLAGS
> | and GL_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | 
> | FATAL: oe_runconf failed
> NOTE: Task failed: /home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/xserver-xorg-1_1.5.1-r0/temp/log.do_configure.21623
> NOTE: package xserver-xorg-1_1.5.1-r0: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package xserver-xorg-1.5.1: failed
> 
Hi, I tried a build from scatch of xserver-xorg, found 2 missing
dependencies in the tree, but I am unable to repeat this problem.

Graeme




