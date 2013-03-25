Received: from mail-la0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UK6x0-0004mL-2H
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 13:56:38 +0100
Received: by mail-la0-f44.google.com with SMTP id eb20so11295509lab.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 05:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XZIumHiI3nsuw28uw9XqYA289jYgQqhtLCQLoZa4PL8=;
	b=f18CTkv3o1ySLtnj4waGC95pHygEFLw1BNUiWraN1OIE4+ehbW80wci9+soI8n94BM
	bxhY2h4lRMqIrPun6KnEgmOCG2o2JTy4bhIjJMvAoyihLY3sKmxHF7gsfcD1lhDX5KKY
	wUDhULcSWLk4rZ6GTx+tmVjx0dsE1dulqKjAazfsS6+XhW6GEusBfZemtfoA9wlsJzwU
	a8bDY4WyKZz7h6fguVAfpsRC3HbTdaBI+/fmbUL5y8WSkKzigSiVXgzy+r31lWyhGp5e
	+mcRfbbv5T+2MRq6rG0T2qwboETbu6jID8FgdzOyAJuLJkrF546PCaVR4oJgCiQJtLRl
	+klg==
X-Received: by 10.112.150.101 with SMTP id uh5mr2976195lbb.92.1364215175364;
	Mon, 25 Mar 2013 05:39:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Mon, 25 Mar 2013 05:39:15 -0700 (PDT)
In-Reply-To: <20130322220037.GW3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
	<20130322220037.GW3219@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2013 12:39:15 +0000
Message-ID: <CAJTo0LbpOM6ZfBxQ-jOwWW91nMHDe6rFbpQBNXHNtkj-aXsgMA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmexfsTvxI0Njw+vJQoO6DqtYdFq4vIuggfuiNS+ORajwK9RH6F75Tb02wQvdsoVRMYQslq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/22] hybrid systemd/sysvinit, and systemd fixes
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
X-List-Received-Date: Mon, 25 Mar 2013 12:57:01 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2013 22:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> Do you have one for oe-core?

Whoops, forgot to split it out that one commit.

ross/systemd just touches oe-core files now.

Ross


