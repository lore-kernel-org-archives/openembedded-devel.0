Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NDLcs-0000ud-GD
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 18:26:01 +0100
Received: by bwz9 with SMTP id 9so6866545bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 09:24:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.162.210 with SMTP id w18mr1097277bkx.174.1259169868732; 
	Wed, 25 Nov 2009 09:24:28 -0800 (PST)
In-Reply-To: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
References: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
Date: Wed, 25 Nov 2009 14:24:28 -0300
Message-ID: <ae9c9a1c0911250924x3ae0a610n3b15b06fee0ad8b7@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCHES] Fixing Mamona-related packages.
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
X-List-Received-Date: Wed, 25 Nov 2009 17:26:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Anyone?

Or should I ask for commit access to push the modifications we're
creating for mamona?

Cheers,

On Mon, Nov 23, 2009 at 3:06 PM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> Patches:
> [PATCH 1/2] mamonaim-e-applet-git: bumping rev, fixing PV and using oe-stylize
> [PATCH 2/2] mamona-input-methods-git: bumping rev, fixing PV and using oe-stylize
>
> Both patches are basically to fix broken Mamona-related packages at current OE. When Rodrigo Vivi started
> to merge some Mamona commits, he actually got the wrong ones for these recipes, so this basically fix
> something that didn't actually work.
>
> As current Rodrigo Vivi is not working at Mamona and OE anymore (at least not directly related as before),
> I'm basically maintaining it with Alecrim and Willer, but as none of us have commit access, I'm asking
> for anyone to please apply both pathes at OE tree.
>
> We are currently working at Mamona Overlay and probably until the end of this week I'll submit many other
> commits for review and merge.
>
> Thanks,
>
> Ricardo
>
>



-- 
Ricardo Salveti de Araujo


