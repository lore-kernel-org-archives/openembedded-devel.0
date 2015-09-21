Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id C0E9F73243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:20:22 +0000 (UTC)
Received: by vkao3 with SMTP id o3so60814579vka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aZXbUJuLqbz1JYS29QJjw0Jivhh2EFZ+CJ6UFeC9ovE=;
	b=P7m9pympQ6VCIioNHEh1jxoB14uRlYXAIX3xepeVNLdyJZeprHmBIM9JjrHaC/cH28
	mTeFEgMMLaNiOvyVg7nSBejef1ZciYUuX5ek3Orn6yBInWST0IRY+C7nywd5FdX+C1kk
	/DDOCGjYvRImsNxZTD+9+Aa5AhVMcaG450TK+elVDQe+f6M2TO3Vdzs0JGNntvLXCpwS
	9edeo6VLL6DdYSnuYpcB/KY0/Np8HhAnZ8v+HPpZ1h8P5EJA5fZA+iXnCjbGfvRgYhMw
	HV4CmNXO5NB0NboX+rXnDCo/lxNwp4LGEooDOiP6ceyb7/aVZYDqreyy4Y9IcZPpY+a/
	iyDw==
X-Received: by 10.31.54.141 with SMTP id d135mr12166818vka.140.1442827222580; 
	Mon, 21 Sep 2015 02:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.95.86 with HTTP; Mon, 21 Sep 2015 02:20:03 -0700 (PDT)
In-Reply-To: <CAEGpDua0yjiMYz9K=qxF=K4n=NvjLwej6F5s1PJQPRYRdC4coA@mail.gmail.com>
References: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
	<1442687436-29326-2-git-send-email-andrei.kholodnyi@gmail.com>
	<CALbNGRQLGvYmdsxTGMPMeyQ8Edj-9Buvzz6cpr4gT9JS1DhgYA@mail.gmail.com>
	<CAEGpDua0yjiMYz9K=qxF=K4n=NvjLwej6F5s1PJQPRYRdC4coA@mail.gmail.com>
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
Date: Mon, 21 Sep 2015 11:20:03 +0200
Message-ID: <CABYVMoTGsVR3iPFPP013rA1bv_N=xNLymdqEZ+h_5qxhkCeP_w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] add --with-systemdsystemunitdir in configuration
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
X-List-Received-Date: Mon, 21 Sep 2015 09:20:23 -0000
Content-Type: text/plain; charset=UTF-8

fine with me, I just fixed an installation issue with this package on my
machine.
I'll resubmit the patch.

