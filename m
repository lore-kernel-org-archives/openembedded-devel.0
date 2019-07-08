Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E32B76D6DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 19:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jFG16lSxz5p;
	Mon,  8 Jul 2019 21:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562612586;
	bh=bYnaKx+MSeXp1zG7iZW6A1VKwZQbANlQHh0yzuMKIHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moZ6+dWuN9C1h9FQhEmGrk2t+0C8DhXKRB/2iw6fZwtq1TX0/O2jq04Rnvs8wWI2A
	RHP7IRq90gcpwB/WwIKhTVxY35SxjFuCwaf+sz0x1xwcIbc/3PHNvLm/+wQd7T21nR
	VEztsMqSo2WbJauCrP7yfTeelY6BiPLpepgPZJFgmxtKN99e2x2LScsk0gu73yjidh
	/0INts8liEQrSd8sqJ2A8sHu8uIx2hxgyeP6To89ENP+h1mjbvjlPGCeR+jWNIwL3i
	y78oYY0vIdOfK9aIA/BXkFu8RTuW1FAtS7HmyazUALoXsXgpHKiRKLPQdZTu4ydHFx
	58PyiJroeUkD9GBOa7MUoFdayOTuXkEt9MS1ZcsaPke8VwCh7v9T6PyLjraCo6x5Ti
	/yrX1qwUpMkmxx2svaJycM/1mnphSD7EHE7T6WtVmHt6g8VMF+V+bPYfnhtx/QcYAo
	D2yhS/x7khcku0FJ4NdUBHkmQU29sBD+GAKRN3iuJjr6kMI44VEertR/bgNZi7eGua
	+OT68WdWBRVyH2pT91HvASxoPsxBMI2na+YAqtRGvk2E33D3+uH7SIdlz5O+jZLTeS
	Njnha3TohoVjE9xDNULOocT1qmQi0Biii3+ouaTiGLfPd9JcAKWLU3YVUT7eA0zE+M
	BxD7mO+cry+pYxhf/EVSu27o=
Date: Mon, 8 Jul 2019 22:03:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190708190303.GA26276@localhost>
References: <20190708052411.28158-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190708052411.28158-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-mako: upgrade 1.0.12 -> 1.0.13
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
X-List-Received-Date: Mon, 08 Jul 2019 19:03:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 08, 2019 at 01:24:11PM +0800, Zang Ruochen wrote:
>...
> -Add python3-mako_1.0.13.bb.
>...

That's already in oe-core.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


