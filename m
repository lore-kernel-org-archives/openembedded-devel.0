Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF287CEE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 17:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Fct36kSMz82;
	Thu,  7 Mar 2019 18:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551979420;
	bh=lX/mCKRMmvMh7SvKLz4du0bZonQO8B6j7J7CXv4cRbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqKUAeuqxbBsrL9awW0hbRo2UzJN9AFC6/CYTbJeFn60sPwPLH21wph5wKkkLUvqm
	xHkuWbfpgH0ikZ0B71ZeU4RxDz8P2L+fXpBa2hkbZXro4ktDnABOPybiQskGSjBdbJ
	pKBCrzaFpmaCupb0MkkhrmydqNAzdsdT0+Qa4ZHhuEo7aGZVweybJpTagrd34KAUPi
	/A7cA7VKebeOVD3jakZc5upFUl+RF1eSFQACGZxZWQrwLJNCquJCjVFfQYgTQy0/F7
	D8N3pYrBl+g1TPnRKVNuD2Pas2jzxlKxHOpX99zmhl8N8D4+ATSEMiPFTzMcnrK/VV
	GTG6CXPbkDC7EsJU5vjDHEHpx1u9w8z3cdLjri1paYvkO8TN2Ogq7Oft9bEsbAMuTI
	0hyPR7NxlQJ/FXQzDvVvPGXxzAlZDo/cmktiwvZ7u5DKApEgvBxN2yMfkv/Mtg8/9l
	OGCSLI7M0k1tXOFbVTzfq5xtJosxvptPhAPnsykJqgQ4vfGzN1LlUOTSILb1u/BjUj
	rbFhJojK9kgzLeJmRTtfWww2hyRoY+Cj5UFq3OtxMj1UyW6DDVQyi+Om79McsuTyAv
	rwYmGM/WsbKYMxvRPgZLYP2VRlGiO1OaIv/UBGFVV8nQ6/Y8YcgafSX9EG0ULE3Jgk
	85U7+IqiHMKj6W/iFDMf8u6w=
Date: Thu, 7 Mar 2019 19:23:33 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190307172333.GA1278@localhost>
References: <20190306054548.16430-1-raj.khem@gmail.com>
	<20190306054548.16430-6-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190306054548.16430-6-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Thu, 07 Mar 2019 17:23:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 05, 2019 at 09:45:42PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 ++
>...

This recipe moved to OE-core.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


