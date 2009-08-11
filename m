Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mavxt-0006RI-Ty
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 20:20:53 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE000FDAEC for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 20:04:33 +0200
Message-ID: <4A81B2B0.5080502@atmel.com>
Date: Tue, 11 Aug 2009 20:04:32 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A818C9F.7040604@atmel.com>
In-Reply-To: <4A818C9F.7040604@atmel.com>
Subject: Re: Checking out a branch?
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
X-List-Received-Date: Tue, 11 Aug 2009 18:20:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:
> I am a bit confused right now with the branches.
> 
> I got the tree using
> git clone git@git.openembedded.org:openembedded
> 
> I then want to create a local branch using
> "git checkout -b local origin/remote"
> 
> "git branch -a" tells me there is
> 
> * org.openembedded.dev
>   origin/HEAD
>   ...
>   origin/org.openembedded.angstrom-2007.12-stable
>   origin/org.openembedded.dev
>   origin/org.openembedded.documentation
>   origin/org.openembedded.stable
>   origin/origin/org.openembedded.dev
>   ...
> 
> which one should I use?
> 
> 

I found the explanation in the GitPhraseBook somewhat lacking
so I added a new, more complete example
"Example 3: Working with a private branch"

Feel free to comment!

-- 
Best Regards
Ulf Samuelsson



