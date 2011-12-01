Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RW8EW-0001tr-O9
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 16:07:32 +0100
Received: by qaea17 with SMTP id a17so4592343qae.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CK7wGH0Bj5G/flNNIuQ6Ojondh3ekKzwhlKRAAFN720=;
	b=aDnTYYDwqvA2FX/ahxcvtQlkRlv8fyl2/vNwcYgqSr2coODLP/vgSdYdrRoAyCoahN
	33TTJIbSceI3akvNWLZ3kWMEiSt0/oPl5OwIvn4s1t27ScWlwXInjO1BtNA7wom1qwhF
	cxhtnrSB7GNNv1pROmFqyQYBeTblwtAtRJ5WQ=
MIME-Version: 1.0
Received: by 10.229.63.36 with SMTP id z36mr1420608qch.150.1322751650474; Thu,
	01 Dec 2011 07:00:50 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 1 Dec 2011 07:00:50 -0800 (PST)
In-Reply-To: <cover.1322643070.git.sledz@dresearch-fe.de>
References: <cover.1322643070.git.sledz@dresearch-fe.de>
Date: Thu, 1 Dec 2011 08:00:50 -0700
Message-ID: <CA+M6bXm6M=04Ej2LoLHrWneXcmyDX+xJCFKvCv1JkPNyRxWU5g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/4] pull request: rsyslog,gypsy
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
X-List-Received-Date: Thu, 01 Dec 2011 15:07:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 30, 2011 at 1:57 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> Hi Tom,
>
> Please pull these 4 commits cherry-picked from oe.dev.
> The first one fixes the path for additional rsyslog config files.
> The other ones fix bugs in gypsy application and installation.
> All of them are well tested in our own environment.

Applied, thanks!

-- 
Tom


