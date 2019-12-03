Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id DDE487E71B
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 04:10:27 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id k24so2141079ioc.4
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 20:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0j+t1BprPhr+gICACafa7JlyO7GwKnCOkL3Um++yjV0=;
	b=UUUc67rWOJREcxfcGV6RtofyP+Efzqq8xrcXxeA+cZhhSV5tniYEt7dcwMXQRwgB+8
	+a1AAJ+lAINE7sID2x68BYlnqBkPiDnIJ1oFXkW6fX85eDI/oYdliaeQmfDQ0tbKfJL+
	vECifQgp5fF9iz18RadHUUoMTfacsGgkJueMdzNwETh3gsipt1oXdqLIed2osAvYjXnP
	xiuuK9z/7IlwbXUW4EKuV2vJXjrqN0H/LwTc+4pne5gIylZ2njUQwAN1K1GwoBRJgkzs
	/ejY6wNdIb8qZwlvD1iAojBm02WZnAN8BMkY99DEqXiCp8Ctk4Q+yD9YnG4Z4AdMy7wC
	mLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0j+t1BprPhr+gICACafa7JlyO7GwKnCOkL3Um++yjV0=;
	b=dVu0Jpa5wwSh1NNSmxvj+XdMphKlqrHhaamDYMUwsA0Ab9H70+RIleM7vKpQxnL0Oy
	ZgTi61to6h+ud91ehD34rc6akeEJlw7jJ6t89QzU1BNvRdv9vPLYZ6wOpF3y2DCDPJG8
	FppWfOqJWsYjpqrcJDEswc5Dv4xK3djav8mPWeexT/b26Lk4d3fCYzM+LQgu7OJ6L3vE
	KM7KGZb1LbyI22sUoPYwj3jc9r3qbffa4gB/xoe5xxY34U9/sHVFHnqOUIfRhOXTXNOO
	4U4WH2DqyREaLncksGx4VliVR/ePmu/lUqSjEi2qrYt2uHTi6vtFI387lhBLb+rmVMLZ
	tYZg==
X-Gm-Message-State: APjAAAXb0zI0dkLq2iRpOPJqo3g+DfeCAwFo61nnuvKTvTlXIQqWtvSO
	lXJxifq2CtBa5eh/KV6ESLD8aPnJq6YgICvoSns=
X-Google-Smtp-Source: APXvYqygGvEp3Q3qxPbsKhyaQgRRGYPcMbWgarx00ECFOmCeVkCy8A8O2Jiy/H42FvaX1wlZOSQXjLtRBNrw9QPrfgI=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr803304iob.122.1575346228824; 
	Mon, 02 Dec 2019 20:10:28 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
	<CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
In-Reply-To: <CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 2 Dec 2019 20:10:17 -0800
Message-ID: <CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 03 Dec 2019 04:10:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 2, 2019 at 8:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Thanks
>
> It would be nice to delete all branches except master. Only master branch
> makes sense now for meta-python2, right?
>
> " The stable branches were also kept, to make it easier to refer back to
prior history
and allow developers to use meta-python2 only in their workflow."

I can see use cases where a developer may want to replace meta-python with
meta-python2 and still be on a "stable" release. It also makes reviewing
what existed in which release much easier with cgit or git log --oneline,
which I do VERY frequently. If this is contentious then the OE-TSC will
make the decision.


> On Mon, Dec 2, 2019 at 4:57 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>> Why?
>> ====
>> With the pending EOL (end-of-life) of Python 2 in a month [1], it is time
>> to move python2 recipes to a new home. For that reason, meta-python2 [2]
>> has been created as the home for legacy python2 recipes.
>>
>> How?
>> ====
>> It was a design goal to keep the original history of meta-python, but only
>> the python2 parts. In order to accomplish this git-filter-repo was used
>> [3]. The exact steps used can be seen in a gist [4]. After that script was
>> run, manual merging of *.inc and *.bb files was performed to make recipe
>> maintenance with AUH (auto upgrade helper) and devtool easier. Since this
>> layer does not have to support two python versions, the reason for the
>> *.bb
>> and *.inc split has been eliminated. Commits that upgraded recipes to
>> python2-incompatible versions were reverted. Changes to make the recipes
>> build and ptests be runnable were also made (to master branch). The stable
>> branches were also kept, to make it easier to refer back to prior history
>> and allow developers to use meta-python2 only in their workflow. NOTE: The
>> stable branches may require work to make them usable, this was outside the
>> scope of the immediate effort.
>>
>> What next?
>> =========
>> Python2 recipes from meta-python will be dropped via patches sent to the
>> mailing list. Python2 recipes from meta-oe and meta-networking, which have
>> already been added to meta-python2, will be dropped via patches to the
>> mailing list. Other layers are welcome to do the same.
>>
>> Recipe upgrades to meta-python2 will also be coming, for instance Django
>> 1.11.x LTS is the last version to support Python 2, but we are not at the
>> latest release of that series.
>>
>> The original meta-python will become Python3-only and patches for python2
>> support will be nacked and redirected to meta-python2.
>>
>> python2 itself will likely be moved from oe-core into meta-python2
>>
>> [1] https://www.python.org/doc/sunset-python-2/
>> [2] https://git.openembedded.org/meta-python2/
>> [3] https://github.com/newren/git-filter-repo
>> [4] https://gist.github.com/moto-timo/ab70ab96ddbaf5fd1226bd21dbbfec9b
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

