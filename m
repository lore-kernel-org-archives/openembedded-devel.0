Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HpncE-0003rX-F2
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2007 17:46:38 +0200
Received: by wx-out-0506.google.com with SMTP id s14so1284214wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2007 08:45:56 -0700 (PDT)
Received: by 10.90.72.10 with SMTP id u10mr2917554aga.1179675956560;
	Sun, 20 May 2007 08:45:56 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sun, 20 May 2007 08:45:56 -0700 (PDT)
Message-ID: <c384c5ea0705200845w36cf4274x6b22f03cdf01506d@mail.gmail.com>
Date: Sun, 20 May 2007 17:45:56 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1179605582.5852.9.camel@localhost.localdomain>
MIME-Version: 1.0
References: <463C9EA9.2060302@dominion.kabel.utwente.nl>
	<464F3AC8.5000804@dominion.kabel.utwente.nl>
	<1179605582.5852.9.camel@localhost.localdomain>
Subject: Re: RFC: make do_install and do_deploy a PACKAGE_FUNC
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
X-List-Received-Date: Sun, 20 May 2007 15:46:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 5/19/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> An alternative is we stop populate_packages() moving files around,
> copying them instead. This means deploy can run after install, install
> can be a separate task and builds should continue where they left of if
> interrupted during the packaging phase.
>
> Opinions?
>
Looks sane to me.

Leon.


