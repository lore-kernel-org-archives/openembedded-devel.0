Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 901267E150
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 16:51:49 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c70so4582076qkg.7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=sEK3Kc2fLZxyUf1Q4x548z4+4XZlwp3uZfdq2oNBW+Q=;
	b=MY+7xJEW6brgsz9D9GG4g9G8fM+3AWgxjAPtZrlJu4ty1scGj5qmApB8hbhf3LPP6/
	5Ows2MvwFDxKhIK3OAmoyF2W0vBak1EHUpTf3JKxy4VpbKXVebQ8+FwLn2qPtWOOWSuw
	hb+1KP1tOmkRZM3Y+pbIErykS9nsO4lNYVOuJLkyYxkWA/bZ5tQQn1qMhF3aZdtywVxt
	rErhRUL4VnMZa1HPEGNZQ4zfSvnshmQPe7j8Wm1rgQDtFfs67fjwORyxEEx7KduglaCG
	dDWWhuLiCnEVpWt+fZBdXwXJHWy+NHAxTst6wqSFTXzrLwHeRiTEesmhukR0dg3I7lhi
	UVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sEK3Kc2fLZxyUf1Q4x548z4+4XZlwp3uZfdq2oNBW+Q=;
	b=T4pz5AlhXQPS79hSYkIJ5NAsoHRaRVJ3+d3rCx8/Qw9Se26ldNqOSnd+kRK873VoZV
	83+ak2LJul5HAaa4PF27eqA7wFPBTD3IGsBmOv6hYn4QuV77wjs2W1SVQLDMfXNqwTHj
	+IwxPKwE5hLW7ExYdCZEBCZ/MHzg7yaGm46ZBUuBdoBmLuOJIjB2jAWU/uJQYN5WUfyE
	rCj/5cA1qILCY48Nbs9Vr/7Vwl1WqgTncNcpKAtsaxOfuNfJUba4gpJEEoLVq0SDB3nW
	6zI/Ne9eO4DOq4fXtPeo3/Eb9EDf2zYSBZPIcHiCUizkGtsqMO3sKGOk13szn0jMG/4F
	/e9g==
X-Gm-Message-State: APjAAAUmKRJL+OuQXvwuMIS9l2s/zwXngnW1gRPK0J5go9omNZIQu6+c
	5XfWg78CJBjZOHDLFLorsMneQaJnNx5eC3QUFN9fEOT6
X-Google-Smtp-Source: APXvYqwDJKKhDUE9kQcv3wXRvGgw53kf+F2XjTs/T3CGTMzw77vOsuLkRs5jc5eBnwAIhA+tY0d0v+cfMNGikdyQAnQ=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr12152059qtp.88.1558975909987; 
	Mon, 27 May 2019 09:51:49 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 09:51:24 -0700
Message-ID: <CAMKF1sr9T0K71M5K4Qh+K-PrFv1dn5L0aNpn2hkN4usLY5hDpg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Delays in patch merges
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
X-List-Received-Date: Mon, 27 May 2019 16:51:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All

I will be on vacation and traveling for next two weeks in places where
I might not have internet, therefore upstream patch integration for
meta-openembedded layers upstream will be a bit slow.

Thanks
-Khem

