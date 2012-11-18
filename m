Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ta9pm-00031F-6c
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Nov 2012 19:43:10 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2611352pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2012 10:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=pw6yQnW1RIf4F5Itq4qJng3nIQJzPhGUrfNJ4XcC/B4=;
	b=gjVaeUnhE1OkkxiybBRY6xh69qgFvQeyZwLSd4Zr+I2B4lX7i50qxmo9C8Xw0Cq22n
	sAfwfZTfeTrczfzjgTmFovNX/ySOvp8vqPRUwUeA1X5Xq/AQX8Esztg0JlNvF0DNDFMM
	DaPSNV0aUhwABSNf9mUFTs0Ow0Ayu5Ei9egmgB8UTMoMt8MtQkNHl+qRbc14zLeYaSTx
	n4B+NFdSgBv+6IeJLGsF1TAIjfK4rXoQVSWTUmCoG/1bq520r2FBapmXDrcMysBqNp61
	EqAMNoSrqPshLF+3oCD8yAn8g73e1Q6OrfBZNVZLwdzp2Hy61lYaoLsSC8b5Z2R+gP9K
	FPkg==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr27146223pbc.136.1353263348266;
	Sun, 18 Nov 2012 10:29:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sun, 18 Nov 2012 10:29:08 -0800 (PST)
In-Reply-To: <1353193382-4019-1-git-send-email-andrei@gherzan.ro>
References: <1353193382-4019-1-git-send-email-andrei@gherzan.ro>
Date: Sun, 18 Nov 2012 16:29:08 -0200
X-Google-Sender-Auth: J-EVkgUp63PRpf2xOGaQ99UJNc8
Message-ID: <CAP9ODKrVEHH0GfbqsP6nZsA5diCYWAGJU3m0kU2GtnTwgk72tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] samba: Add rdepends to perl as perl scripts are packaged
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
X-List-Received-Date: Sun, 18 Nov 2012 18:43:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 17, 2012 at 9:03 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>

What about moving the perl stuff to another package.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

