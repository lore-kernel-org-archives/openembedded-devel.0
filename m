Return-Path: <athoik@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 70F2B60621
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2017 07:48:59 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id z195so3194850ywz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2017 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wKaPKd2W3NWIDBe25HsymO+To4cG21MKXYKplBEI/vk=;
	b=G/Jjo/85onfbLdQMzkeGjfxSTa8cjrL2wbXUOtGf4gGpqDVOpRMAS0GvGlMnRyKQqz
	HBwupl2PecCT6JAuwfDmwxkRrEtWA3Y9aA6+4B7Y2iQQJvQR/afxRXRGn/BYLZfTBJow
	atH4XkeNaxZH7h6QaUw1R5v/NXSNW4C8kxTfPwZMNrpf4aMuEVYhH36PEiTX1sLcl8eL
	C9BJt9RYFbAS/OWWI8mfk1mJY8INrxNjdTzjtHEcyWqGpILO0M9e9nE0NTVclGeyOwzb
	C61QB7zpiWKeuPKtUbICgZPRrJrbD+6wgPqgMocN8nfRwkl20Kmj/S5Nj+0UbhRb7m8X
	FWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wKaPKd2W3NWIDBe25HsymO+To4cG21MKXYKplBEI/vk=;
	b=LaFH0gb+4LdeHdH1/LNr5pOLnm4wBXryJHuL+flCvZNkAQOvtNerrUBD6V97e9LjW1
	2n0a0BzNID+jgzlqBUN+FGhNTmuGCF4/6qfwCoNdFyilrUzjbCQWilDuhJnCphQlTBHu
	eL7Bn731IheLpXCEUKNANsiBPIcI/xKsmFPd9THXoPhKux7JYFVKYPHpnvm7KIYNwww+
	Y3wqFi/4ZffNeCGiUMj0nPb3H0HVeZNIp30tWkVcmx7g1q//55g+qA6Gbexx2EWk8fat
	+DgiUXwHH8WijZYuZpD7Y4I1w7Edlikppdm3tCwti1r12ctfsWb22Zb53oiH9JbatNzn
	jHhA==
X-Gm-Message-State: AMCzsaWfWNZiqmhqoowdz/+h5igO782rVdeEMn0c4Xsn5RCbhRVHwQpK
	xPVjnnHVdtIHSMKzedmP4laZVVLosYmT90WF3Q==
X-Google-Smtp-Source: ABhQp+Sf2Id/gv16QwKUWjbAqFYK5IBQLsrTdw7/WYMr0oiUbY4hyt0dDtS9GFVawBLnZ7q/Gr/k2hLJWDVTiygrpI8=
X-Received: by 10.37.209.200 with SMTP id i191mr6094255ybg.225.1508658540493; 
	Sun, 22 Oct 2017 00:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.203.21 with HTTP; Sun, 22 Oct 2017 00:48:59 -0700 (PDT)
In-Reply-To: <CAMKF1sqe0QA+pBO3K22ww6NML4Qnv8up86_rCM_jH1MxfxzkOw@mail.gmail.com>
References: <1508274082-5871-1-git-send-email-athoik@gmail.com>
	<1508274082-5871-2-git-send-email-athoik@gmail.com>
	<CAMKF1sqe0QA+pBO3K22ww6NML4Qnv8up86_rCM_jH1MxfxzkOw@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Sun, 22 Oct 2017 10:48:59 +0300
Message-ID: <CANDbA3coqHx=fEXZrVNyBSsPeTHM5pYNN46LNwXeoheqbOdsCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] smbnetfs: update update 0.5.3a -> 0.6.0
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
X-List-Received-Date: Sun, 22 Oct 2017 07:48:59 -0000
Content-Type: text/plain; charset="UTF-8"

2017-10-21 18:29 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>
> This fails to build for musl
>
> | ../../git/src/common.c:7:10: fatal error: execinfo.h: No such file
> or directory
> |  #include <execinfo.h>
> |           ^~~~~~~~~~~~
> | compilation terminated.
> | make[2]: *** [Makefile:429: smbnetfs-common.o] Error 1
>
> you might want to add dependency DEPENDS_append_libc-musl = "
> libexecinfo" and also make sure that -lexecinfo is added to linker
> cmdline
>

Hi,

I created a newer revision of the patches with the extra DEPENDS and
LDFLAGS for execinfo. Tested with musl using instructions from here:
https://github.com/kraj/meta-musl and build doesn't produce the error
any more.

If that's fine please cherry-pick also the commit into pyro if
possible (the revert not required).

Thanks,
Athanasios

