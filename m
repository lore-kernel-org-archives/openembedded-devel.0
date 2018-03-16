Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id BB230786EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 22:46:01 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id m15so4642147pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0tBICuuUylGHa10J/ru/7JZf2ifl9cygA4ftJk1hAeg=;
	b=iqbTFvB40eCYzrtNF1elVTG8xK3HnNkHn20jmDK+6wQ1wz3WkAWDuP4VdJ2N3ZZL8g
	Y/nbs4MBRpLVh7kOU5iRdrWJ/iMUPK2PaS24N/pWVL5DRCwj9SqP7qeFjkrfJjFajALC
	gOg6MBBy8F4LVauqP1cVaDZK/ZqKkiRlcgwzNHe/5RjMRF5O4gnrl89qOJjCn+tHl0Pg
	mSs0nHzF7Dg+VM8J7qa9lhVPstRVFHWDDDI+uCek8I3un5Bbeh3vYafn4/Uc7PhsfbX+
	4ebtxwANQiRkwPZvWULY+U+ltpQWMvUl7zkPoZDG4DqSKr5fgwFiR6Vg4JPD9mGISEvT
	fZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0tBICuuUylGHa10J/ru/7JZf2ifl9cygA4ftJk1hAeg=;
	b=JCao8bhWLAC7ITbSlEf8M88dxXT/oJIzQqQC78yB9pL3b8+/b4q68umbPMH8aFGZeZ
	q6kxGvad+L54NDcLgf82ya/RI481ogkcB90N1U216OVOAoLYiM9qUCX42CLIj2g9zt4Z
	E5LIsMkJaCwJBWhAYXN3bfric5MkSf3l0wX4Nem9LE44st10iz7vQLhRfiJ2/E6oYkUh
	Y/kzosaZ8ffaT0gUZofHXVvaLfE/DHJVu3w/bjvJyWjJyPv2YLovGHDmTieUwtB5Ej8S
	UzQjs4YWgVgCDe7L64Drp0j7vfGWRkrT3b7qWP0+dQKMTfFPeG8hAvzZ7uR/Lvrt/1/t
	118w==
X-Gm-Message-State: AElRT7GKQCF5AQIUcRyTpa9Gm4cb9jSthCiOKJZtfrjkNKa/VfRQytBc
	WUZP6u20lFwyjJMtlsI0nSRvMqHJA5qvfBi3Ifw=
X-Google-Smtp-Source: AG47ELv4K0ibR8+wNqjWyx43VUzgQg1e6p931Tu3LNio2sLlbURAMiHv8Gne8/D2r4Ft282E3KNEyFhbOFhyj0CzZhA=
X-Received: by 10.101.99.66 with SMTP id p2mr2701610pgv.384.1521240362543;
	Fri, 16 Mar 2018 15:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <608c81f2-6c48-a68d-aee9-d85f8eae65f0@linuxfoundation.org>
In-Reply-To: <608c81f2-6c48-a68d-aee9-d85f8eae65f0@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Mar 2018 22:45:51 +0000
Message-ID: <CAMKF1spQHF9KNfr3_Q1oNZauzwjcxZ6_eE=Ay6DCQObk51dsrQ@mail.gmail.com>
To: MIchael Halstead <mhalstead@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	yocto-infrastructure@yoctoproject.org
Subject: Re: [Infra] 1 minute unplanned outage http://layers.openembedded.org
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
X-List-Received-Date: Fri, 16 Mar 2018 22:46:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 10:56 AM MIchael Halstead <
mhalstead@linuxfoundation.org> wrote:

> The layerindex was offline between the following times:
> Fri Mar 16 17:40:17 UTC 2018
> Fri Mar 16 17:40:57 UTC 2018
>

Thanks for being so vigilant and keeping the community informed much
appreciated

Thank you

Khem

>
> The webserver failed to come back up after renewing the SSL cert and
> routine updates due to failing pre-launch configuration checks. We will
> avoid this in the future by running configuration checks in a test
> container before restarting the webserver.
>
> --
> Michael Halstead
> Linux Foundation / SysAdmin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

