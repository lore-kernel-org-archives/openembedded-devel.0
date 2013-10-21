Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 235D66D073
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 14:13:58 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id gq1so1997697obb.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ovaxhcnnk70VBgh/Gl6F0shB+p0sn4zFCaQjiozQCTQ=;
	b=aBj8mBWUfAB++kpI0LpHlLxu3I5CzAlB7hQen0QQj+/WsFx6YBSHkS2TXIipc/ZNTD
	qWzpk1oH093W/wuHwZ/R27YeXc8EKStd8T+MJw0DPZg2pwwQLpa0/b27JmgBMDF0Ih/I
	Ux7FMEMLF6GRenxr4fzMD6NuR5dlV2ncIvyj57Xa+NSrt4EVMioGOXRUS/0xjpThtSJU
	S69irKrW0a1jkFDDjBVBMQONGuFDOAdSxYb0NUuqxpyYIDPF2qd+0O9Mz/tqvXnY0/hV
	fQQtiUMGE7wJ9j1nWSISvOZ6yP/YcDw72qjk/+BKV5RbuQb2fhJhAxIrIt8Xu3Vszh0B
	V0+A==
MIME-Version: 1.0
X-Received: by 10.182.121.137 with SMTP id lk9mr20704823obb.32.1382364837285; 
	Mon, 21 Oct 2013 07:13:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 21 Oct 2013 07:13:57 -0700 (PDT)
In-Reply-To: <1382273632-10984-2-git-send-email-Martin.Jansa@gmail.com>
References: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
	<1382273632-10984-2-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 21 Oct 2013 12:13:57 -0200
X-Google-Sender-Auth: jJV6pjZqk_0H1X291NTWZbQAObY
Message-ID: <CAP9ODKoOWUCa3zz_MfvRQyTcLeNfFZQysHj_ypSpprFteOjKmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-multimedia][PATCH 2/2] bigbuckbunny: Don't use whole avi in LIC_FILES_CHKSUM and add version
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
X-List-Received-Date: Mon, 21 Oct 2013 14:13:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 20, 2013 at 10:53 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * it's causing huge deploy/licenses files:
>   211M    deploy/licenses/bigbuckbunny-480p
>   317M    deploy/licenses/bigbuckbunny-720p
>   886M    deploy/licenses/bigbuckbunny-1080p
>   and avi checksum is already verified by SRC_URI checksums
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Agreed!

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

