Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IRq5N-00086S-6y
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Sep 2007 16:05:57 +0200
Received: by wx-out-0506.google.com with SMTP id h27so1222755wxd
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2007 07:03:47 -0700 (PDT)
Received: by 10.90.83.14 with SMTP id g14mr3310790agb.1188741826951;
	Sun, 02 Sep 2007 07:03:46 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Sun, 2 Sep 2007 07:03:46 -0700 (PDT)
Message-ID: <c384c5ea0709020703w45e490au5b7b088f624b30e8@mail.gmail.com>
Date: Sun, 2 Sep 2007 16:03:46 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1188693418.5722.19.camel@localhost.localdomain>
MIME-Version: 1.0
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
	<1188653475.5722.1.camel@localhost.localdomain>
	<46D9A492.5090601@dominion.kabel.utwente.nl>
	<1188693418.5722.19.camel@localhost.localdomain>
Subject: Re: [RFC][PATCH] Merging classes with poky
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
X-List-Received-Date: Sun, 02 Sep 2007 14:05:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 9/2/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Another quick things I've noticed is the empty /dev directories in some
> peoples images were caused because the PR on makedevs hadn't been bumped
> meaning some autobuilders hadn't see that change and were not using up
> to date code.
>
Apologies, not bumping RP was my big mistake on an otherwise very small commit.

Regards,
-- 
Leon


