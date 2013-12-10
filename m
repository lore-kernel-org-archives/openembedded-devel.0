Return-Path: <eu@felipetonello.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB11E6E242
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:18:37 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so4206665wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 17:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ZuyouTmnhYnkF0PJ0N7ydSZoeTDKbjxdYsHl0hIc8fY=;
	b=bfvtoXBGSyuVcOovWrDMtUm7MEvNbVlf7VwPk3nNrDZf6BRYlpqAxE+wFxaIXmpNf3
	vHk1EeggmhFg3K/EDqBwaL4jHRroiCaGR4sjiarzwTSVCY7pzQb6B/lVLsaALqoa5vGU
	4Q8Xa42l7ODt9X88OO6EdYR3DUk4QUYL4z7kbEvh47CbbKgfXY+TbxwtXnIJq9MgMng4
	7GuVqCTb6Z5BvQlVg59KLpew3RZz7fl9TT1hkraU64MEPz4jE6M1zwlMp32ViqYSH4Jz
	z5JaL1NyLnxmIgrTmOdi44OZafAXuPCRBxe5tyfNDl3dgaSnPwHPdMjUmCqXY+zSYeYB
	j5+Q==
X-Gm-Message-State: ALoCoQm+FMLMkiI+mfiMRvznERS3jwrGfgdbi1KmNytwyEgq/HA9gkV0+L8w0QU0z3YefqOnPE/E
MIME-Version: 1.0
X-Received: by 10.194.1.139 with SMTP id 11mr18370298wjm.33.1386638317003;
	Mon, 09 Dec 2013 17:18:37 -0800 (PST)
Received: by 10.194.240.201 with HTTP; Mon, 9 Dec 2013 17:18:36 -0800 (PST)
In-Reply-To: <CAGrhNMxmYUKdgcH9kgSxqkF8nDqNrEpxZbqm9WewDem5zkAtSQ@mail.gmail.com>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>
	<14902072.IG3b8o4YqW@helios> <l77732$ggi$1@ger.gmane.org>
	<1825979.KGUos5WM3r@helios> <l777t2$pcq$1@ger.gmane.org>
	<CAGrhNMxmYUKdgcH9kgSxqkF8nDqNrEpxZbqm9WewDem5zkAtSQ@mail.gmail.com>
Date: Mon, 9 Dec 2013 17:18:36 -0800
Message-ID: <CAGrhNMy-kEvdj2E+NKdcZmVkdS7YxQcRfnndsbAA1YGDWSz+ew@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Tue, 10 Dec 2013 01:18:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 5:15 PM, Felipe Tonello <eu@felipetonello.com> wrote:
> I just found a typo in the patch, I will have to fix it.
>

Actually, let me know if this patch will be approved, then I fix the
typo and resend a v2.

Felipe

