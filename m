Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IuW5P-0003ga-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 17:36:31 +0100
Received: by ug-out-1314.google.com with SMTP id m3so1333266ugc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 08:34:21 -0800 (PST)
Received: by 10.78.159.7 with SMTP id h7mr6763143hue.1195569566855;
	Tue, 20 Nov 2007 06:39:26 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id z34sm219910ikz.2007.11.20.06.39.24
	(version=SSLv3 cipher=OTHER); Tue, 20 Nov 2007 06:39:25 -0800 (PST)
Date: Tue, 20 Nov 2007 16:39:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <674744232.20071120163921@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4742C0FB.1010101@whitby.id.au>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<4742AFCC.1060000@student.utwente.nl>
	<4742C0FB.1010101@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 16:36:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Tuesday, November 20, 2007, 1:11:55 PM, you wrote:

> Koen Kooi wrote:
>> Rod Whitby schreef:
>>> Show how you can use bitbake such that you can cd into a build area, and
>>> type a *single* bitbake command to do a build, then cd into a different
>>> build area (with a different distro and machine)
>> 
>> Why are you using a different build area for that? That's unnecessary.

> Um, when the MokoMakefile was created, it *was* necessary to have a
> different build area.  Direct your statements to the maintainers of the
> distributions in question, not to those who are trying to help the
> end-users use those build systems.

> Isn't the creator of the OpenMoko build environment an OE core team
> member?  Does the OpenMoko build environment setup documentation follow
> your prescription for TMPDIR and multimachine?

  Well, I see the root of problem exactly here: a typical developer
produces personal/one-off scripts in huge quantities. Few of those
personal/one-off scripts even evolve into something used as multi-shot
and community-local scripts, sometimes.

  But if I'd post my local hack-scripts to the list as something opening
a whole new world, I'd be laughed at. And if I'd use a slightly
different language in the post, I'd be flamed for forcing my crap upon
other people. And that's exactly what happens in this thread.


> Physician, heal thyself.



> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



