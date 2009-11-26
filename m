Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NDSqx-0002bV-P8
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 02:09:02 +0100
Received: by bwz9 with SMTP id 9so211209bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 17:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.162.142 with SMTP id v14mr1495393bkx.166.1259197649640; 
	Wed, 25 Nov 2009 17:07:29 -0800 (PST)
In-Reply-To: <be7a9f3d0911251630o2c6d2cc8x3e43720dd562657c@mail.gmail.com>
References: <ae9c9a1c0911251102x3e727255l94dcb5f75e36a158@mail.gmail.com>
	<be7a9f3d0911251630o2c6d2cc8x3e43720dd562657c@mail.gmail.com>
Date: Wed, 25 Nov 2009 22:07:29 -0300
Message-ID: <ae9c9a1c0911251707w790ecb33t11242e60215087b@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit access to rsalveti
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
X-List-Received-Date: Thu, 26 Nov 2009 01:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 25, 2009 at 9:30 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Ricardo,
>
> On Wed, Nov 25, 2009 at 5:02 PM, Ricardo Salveti de Araujo
> <ricardo.salveti@openbossa.org> wrote:
>> Currently the plan is to merge Mamona commits into the repo and keep
>> using the main OE repository for development, avoiding working as we
>> did before.
>
> This is not up to me however I'd be better post the branch with
> initial changes for review in the mailing list. This is specially for
> changes that could affect other distributions.

Sure, the patches I sent were just fixes on current recipes that break
the build and mamona-only fixes, like both recipes that weren't even
building in OE.

Before actually merging the core stuff for sure I'm going to post a
separate branch, with recipes and another branch with classes +
configs.

> I do support your commit access but after few review cycles to avoid
> possible mistakes.

Sure, that's why we moved into an overlay and until the end of this
week I'm going to rebase into different branches to propose a review.

Our current overlay: http://gitorious.org/mamona/mamona

Thanks,
-- 
Ricardo Salveti de Araujo


