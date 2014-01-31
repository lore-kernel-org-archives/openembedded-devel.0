Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8236E996
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:10:05 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id e16so7548883qcx.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=TI205meMByctC5sNnW4gsvboqh6ECwiO5vLv8RyBXrA=;
	b=eosT2eI5pxvJwNahuQPra/xeFzIISUE1ze/ZauItkaAaSnSNa6/lb02DDQmROE57+d
	1x51QXjVM8uM0xnwtFFD5HMIZCYZkAh9meWza+cR07YO9H9JR20cz1GKswkuUGmtZYeS
	ZfQNC32mcNX4aXnuHa7LhQY8yimdmZXab8navNXr4JyhPf7lK0n08BYe2x9hY8CDFeEf
	JPc609NYCAPQNrgyNXA0bCPJwFAaXELKvzK46qcClGn23Sa5yxtRlrgfwmaLmw7NdQ27
	mxzpyj7/teQ5fcDvb0NtsjSTAkcTTqhFABm6DUQ/LUDjD8L8TWoQvXMkaC+FavD7w9KT
	C3Cw==
X-Received: by 10.140.46.119 with SMTP id j110mr32461902qga.32.1391191805683; 
	Fri, 31 Jan 2014 10:10:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Fri, 31 Jan 2014 10:09:45 -0800 (PST)
In-Reply-To: <CAP9ODKr+PSfPthrzi+khaFKVUU4FFNYY-Dop03mhjmFphBSnDw@mail.gmail.com>
References: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
	<CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
	<CAMCfZKFg-39ZX0hpWxbYLQSz0eo-6NW9This3Kcg6D600-w9Yg@mail.gmail.com>
	<CAP9ODKr+PSfPthrzi+khaFKVUU4FFNYY-Dop03mhjmFphBSnDw@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 31 Jan 2014 16:09:45 -0200
Message-ID: <CAMCfZKFfbiwPcUoVAwKXYfFLosXHDBwKbV9F9vw0h3jZBU9KHg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Systemd journald (206) storage issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 18:10:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 31, 2014 at 3:47 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Yes, properly document it in commit log and tag the recipe as
> 'for-dora' so Martin and Koen follow it.
>

Thanks.

This is going to be my first contribution and maybe I'm going to do it
wrong.
When you say "tag the recipe as for-dora", this should be done in the
commit log, recipe name, or a git tag?


Regards,


--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

