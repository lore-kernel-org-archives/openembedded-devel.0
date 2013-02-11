Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U4xeu-0007Q0-CS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 18:59:18 +0100
Received: by mail-ob0-f172.google.com with SMTP id tb18so6347631obb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=e6wMEpfNoCpfnDTZzqQndclTuRhlcQdq7iMjXPPODFY=;
	b=s3V2r+xpuI2tGOxEQHPTsY2VrpZhgOu3P4OwYup6JqJkQ8J48013diZoJO2YqilkpW
	cNK2Bgys2IiZszXLVekFJvUhsejQERId63BAKl9J0JrLSM4gt+R1qawHcNPRnHe91iUF
	lzv2/0YhthX6VyHH8/9Nx8UnXnF+Yg6Zu1z5cWM4CgFApaVmhkIJI/MYoA1+tcZqzGkb
	BkBA4yvwIgBSeadPgVOzcr5PK8+iS3Pj5CEYGnfJjxgh0HW5rof3nV7/Hx5Lvy4cK3an
	Y6cijPxDqZRnL3cr1TVZM9tcwQGKiURsdJgeeuAHZWUDAaPq/BcZCl4rYUcdsKSu6od/
	Fjng==
MIME-Version: 1.0
X-Received: by 10.60.13.65 with SMTP id f1mr11140958oec.87.1360604597606; Mon,
	11 Feb 2013 09:43:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 11 Feb 2013 09:43:17 -0800 (PST)
In-Reply-To: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
Date: Mon, 11 Feb 2013 15:43:17 -0200
X-Google-Sender-Auth: g3Mvneeo15JWEtA4esA0FEz1XKQ
Message-ID: <CAP9ODKoeYTJsUCYLm2xb9QCGi5GumVdQcKLeehu4q82VV2FCEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Mon, 11 Feb 2013 17:59:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 11, 2013 at 3:25 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> This recipe provides the Qt library and QML plugins for connman.
>
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


