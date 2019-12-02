Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id E711D7BD72
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:07:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m8so9972158edi.13
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 08:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K95funaNolkKZchjhcVXK8c2oEUQbskjdbZ2faV5i5U=;
	b=qt1qC7rD+Hwgp+bRezhpn1bxBL57sZFy6B4brMcK0AMAjPZyMtDOYVxvXgBTt7hsy+
	1aUCzgZLpipDOb3gtV+UFuH/1dx9ApurU0/zQ0aaMQ3SIbmiJV6jJtXM8wnvECe3ygXl
	uO7T2naJLN6Sh1DS3fizWA8X953M6Ek9pdqlNie60wn/BRGPDZvSxyUqjVc++3N3/BOs
	SeQmopfp6L3FAmn0yFrBacFCBYn1QgnDmBz+5mO865GshxSFylZcN6FSN756YzX2kvD3
	zLHtAmly+ROKsl+HUFOnXD4QBBfBoCroX3cqANsbkb9naMEud+K5PKoSe9EXcH+S/RgO
	/jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K95funaNolkKZchjhcVXK8c2oEUQbskjdbZ2faV5i5U=;
	b=igvBVbzHh9A5ohFrNHhmR2dtLRxirmu0Gc+kUYPEfwmotvnKpP8ma5Q9wA8AJeiop4
	axqtY5/UgL5tLbc5LYVBzyzxzr1C4zr0ATb5lWcxSLT6/50l0VslsG+MWoAGzTJPyqo9
	ewCwz32UgRMQPqovwPjiZ4o/HvHpQ2Rn8+0MG4m5zE5EPV4AZfQSS1u+B9pGOxtVzisQ
	VMFaOsCq95guJ4sQHQV/WHjvbvbMxWHykCmVEfsC7616+ENtn3dV6Ih0fnaVz2sb8xX0
	rNyo55xCkOe5d87Wztvcq7yJCR9UyvPUBAlJkIUZLvQaaT2mY3tgZf+bYb7TK7OZCenY
	koXA==
X-Gm-Message-State: APjAAAVCJr32+U6AOvsXcVAsPVV0AD39f+3ydervv/eu8saUsoBmIi9N
	5DmMztIDkZMhVVUoePhqzjMnzNin1DIJZOLOeOo=
X-Google-Smtp-Source: APXvYqw1OePHEcUQS6IIZ8sJaKutskKqEZmRy++pai4NRFh0sYZYhb4aN/caHY3RmMNfLfDx0QOlrDbJPcW/GQZ5RIw=
X-Received: by 2002:a17:906:1f94:: with SMTP id
	t20mr12171210ejr.5.1575302847549; 
	Mon, 02 Dec 2019 08:07:27 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
In-Reply-To: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Dec 2019 17:07:15 +0100
Message-ID: <CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Dec 2019 16:07:27 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks

It would be nice to delete all branches except master. Only master branch
makes sense now for meta-python2, right?

On Mon, Dec 2, 2019 at 4:57 PM Tim Orling <ticotimo@gmail.com> wrote:

> Why?
> ====
> With the pending EOL (end-of-life) of Python 2 in a month [1], it is time
> to move python2 recipes to a new home. For that reason, meta-python2 [2]
> has been created as the home for legacy python2 recipes.
>
> How?
> ====
> It was a design goal to keep the original history of meta-python, but only
> the python2 parts. In order to accomplish this git-filter-repo was used
> [3]. The exact steps used can be seen in a gist [4]. After that script was
> run, manual merging of *.inc and *.bb files was performed to make recipe
> maintenance with AUH (auto upgrade helper) and devtool easier. Since this
> layer does not have to support two python versions, the reason for the *.bb
> and *.inc split has been eliminated. Commits that upgraded recipes to
> python2-incompatible versions were reverted. Changes to make the recipes
> build and ptests be runnable were also made (to master branch). The stable
> branches were also kept, to make it easier to refer back to prior history
> and allow developers to use meta-python2 only in their workflow. NOTE: The
> stable branches may require work to make them usable, this was outside the
> scope of the immediate effort.
>
> What next?
> =========
> Python2 recipes from meta-python will be dropped via patches sent to the
> mailing list. Python2 recipes from meta-oe and meta-networking, which have
> already been added to meta-python2, will be dropped via patches to the
> mailing list. Other layers are welcome to do the same.
>
> Recipe upgrades to meta-python2 will also be coming, for instance Django
> 1.11.x LTS is the last version to support Python 2, but we are not at the
> latest release of that series.
>
> The original meta-python will become Python3-only and patches for python2
> support will be nacked and redirected to meta-python2.
>
> python2 itself will likely be moved from oe-core into meta-python2
>
> [1] https://www.python.org/doc/sunset-python-2/
> [2] https://git.openembedded.org/meta-python2/
> [3] https://github.com/newren/git-filter-repo
> [4] https://gist.github.com/moto-timo/ab70ab96ddbaf5fd1226bd21dbbfec9b
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

