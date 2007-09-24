Received: from [64.233.162.237] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IZqeK-0002fd-MC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 18:19:08 +0200
Received: by nz-out-0506.google.com with SMTP id i11so915788nzh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 09:14:48 -0700 (PDT)
Received: by 10.115.17.1 with SMTP id u1mr762084wai.1190650487319;
	Mon, 24 Sep 2007 09:14:47 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Mon, 24 Sep 2007 09:14:47 -0700 (PDT)
Message-ID: <f96d234e0709240914p29fd2fb5n87e7d32b206f082d@mail.gmail.com>
Date: Mon, 24 Sep 2007 12:14:47 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46F587F7.4060501@balister.org>
MIME-Version: 1.0
References: <46F587F7.4060501@balister.org>
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 16:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/22/07, Philip Balister <philip@balister.org> wrote:
> For now, I'd like to focus on working out how people use OE and what
> issues they have. Once we understand what problems exist, if any, we can
> discuss solutions.

I use OE in much the same way as Leon.  I find a OE/Bitbake snapshot
that is stable and lock it down for project work.   I generally don't
upgrade until I need a new feature, or I have some time to work
through issues.  I have several dev boards that I use to track the
HEAD that I use for contributing to OE, and keeping up with what is
going on.

For me, this works fine, but then I keep up with what is going on, so
I have a pretty good feel for when it is a good time to upgrade
projects, etc.  The occasional OE user would probably have a much more
difficult time.  I'm not sure a stable branch would help a lot, as it
would consume a lot of developer time that is probably better spent
moving things forward  Perhaps something more like kernel release
process would work where we shoot for stable releases (perhaps
quarterly) where the focus right before the release is to get things
stable for a number of architectures.  But, then I'm not sure there is
a big advantage of this over just doing more/better autobuilds and
testing.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


