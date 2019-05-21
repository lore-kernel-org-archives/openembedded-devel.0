Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A81487D589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 09:33:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457VtZ0XKgz6p;
	Tue, 21 May 2019 11:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558431190;
	bh=DVNCZdSVpui+AMegvZOT8+JgYTfMorBbJaXd3LawQls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEQpHmb/Igi27QgyZarFJGUwbJ5e0pxhCQg7alswV0hLyzbY6bLT0iy/SrwCxspkn
	fOJ852S4dh54NMhzF3cK2I7gJJoG9OHtOb2yU2tCFZ2oJQwrnD9QSU/OvU9prMINSA
	jBxSk8vaExHj4A3TyYS6CUFt1t649SIyNrJQ+WWMCkqW0Vb1QTSBGmrDiRDsR0koIg
	SxFixdyQUlywQzLR43ENasSnTgJ7sDYTX7LvSVDjsJcbOjz9V7JFEp7Yw8LlFYo9dl
	gaAxlhYWQI15ZgS6mSgNMZPaezdiGG3l4Q+FzxCxCho4A8w6/A9VqlH+UwnBa4qF+3
	5zoGY7TBKcd8ggeIhpKR18bsrRjwkXKzAuyY8Sub8XXJpNuMTf37RnOvq1TIm7+TZc
	E/lL1cxlbLByERFWpjK6AuL2GL6wRRNDkGcEh8LfCgpMxkHxD3BdLzZpbmSW5Eii/O
	GPIt175Ys54Vy7NMFDJZnQH8l75z/g7406u9eXz9yzA1DuTaS/A5+ktQQBHJUvENe4
	jDEyDv/6qJl+ZRSlytPMb1RfP7n3RKkSbxShkqlUs5llrIxzDoV0Jy1otECyG52WXN
	/owRwdRJVlFHq2end1tooX3SfuwCyEOkqPbyxM7ZpN+iz9XSsfIIMnbm4cBPjXR+Yt
	3yWQ+XufmF/qqpRjzYpgcSM8=
Date: Tue, 21 May 2019 12:33:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521093308.GE15108@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<8af1b3526defb5b604a7edb096d594e81cd2a72a.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8af1b3526defb5b604a7edb096d594e81cd2a72a.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 17/34] evince: add patch to fix build with recent gobject-introspection
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
X-List-Received-Date: Tue, 21 May 2019 09:33:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

"recent" is post-warrior in this case.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


