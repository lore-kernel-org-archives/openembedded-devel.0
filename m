Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TQkOS-0007Si-9S
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 21:44:04 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so610486pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=XVhXhtY42zbJ2SVeEsr3XVE5dVz8JChLJolpFyudGds=;
	b=Kx0gDu+sbZP7hOeIMNK4/a5aYRV0BLsA9O35vZcozb5gWl48a/NA6RiMrurHpQxkm0
	ggUc684jzdlqJtNi31GngWYS9asP3aap5fiQxTRUWqwLJkxk60FEeOFdJS/HTM6rXUss
	7TMeAbS2Qu808+9rFjXqZqOYYhWdvGJlNXcLBSWmQQE3TK18MRAx6qzk61paJ1WnTSP7
	HTWBCd+X9iI0XLiM6ooO9rWZafeEm8uhZ29H4ZcfG6miBY+JcG9bAKmpGHlwD0t9VGPB
	5/WuR9k7qvDNGo5jn3GnkEOm7j5W1m1pKkTPoelCARtx3vh//WYuAO8Y+ilx6yak318t
	L/kQ==
MIME-Version: 1.0
Received: by 10.66.87.133 with SMTP id ay5mr37784759pab.59.1351020637111; Tue,
	23 Oct 2012 12:30:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Tue, 23 Oct 2012 12:30:37 -0700 (PDT)
In-Reply-To: <20121023192909.GU3269@jama.jama.net>
References: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
	<20121023192909.GU3269@jama.jama.net>
Date: Tue, 23 Oct 2012 17:30:37 -0200
X-Google-Sender-Auth: MVVk90C-x_HDRYA8OVpxzlwL6Os
Message-ID: <CAP9ODKqzXCGD-W6fpMg1MTcyWCGKigXR5JUykOTwgzOZZjK78w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] epdfview: Sync with Debian 0.1.8-3 patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 19:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 23, 2012 at 5:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Oct 23, 2012 at 05:22:02PM -0200, Otavio Salvador wrote:
>> This includes the patches in use in Debian package to fix color
>> inversion and other minor issues.
>
> Looks good, will test it when I have efl 1.7.1 ready.

I built and tested it; In fact I did the checking in the Debian
package to check for the color fix and found some a small and nice set
of patches; thus this change.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


