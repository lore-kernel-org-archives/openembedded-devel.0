Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id A5F9F6EB0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:01:53 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so15731796yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=x86Q3GwsSwtd6qfEfZ1jBzm3sSycVjifw/KCwakMB4w=;
	b=z+iWiw56hwmymGhR2psC49CnSp94JB7CxVxFjChXSAZpfcIjeY2frvzHFawwEMIi7Y
	s2b8hhkqb/v/QMepIIpd2ZrGaISyTgS7ondiiZ3dswdDopoeWRWZxmI5k23icWcz5muk
	vkvhM9WzxUvkFdaVlcEcfh9m8Yr95eftFqXNwf9A70n6PlcSmxxkC80yy8I45M0zYLhY
	jeJ2lEgYDJ8xboUyMhHcHINV3CKRuQPQ6UgLehCY+HBlNmjyBDfptE9xepUaK5v4f6NA
	jCL7+5G9Hv8rht4v/N5TVy4TildxWxMIzT8e/TeNvgD99Wws1Luu0Hl9SxcsCu1cXWGO
	/SEg==
MIME-Version: 1.0
X-Received: by 10.236.98.39 with SMTP id u27mr36240916yhf.27.1392742914155;
	Tue, 18 Feb 2014 09:01:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 18 Feb 2014 09:01:53 -0800 (PST)
In-Reply-To: <1392737825-11241-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392737825-11241-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 18 Feb 2014 14:01:53 -0300
X-Google-Sender-Auth: kxzQrrnmduOOj7Wza26TIMHEAmY
Message-ID: <CAP9ODKpd-pW2pJoDMw65w2=XYh_KGKhU-jpoj1psD3s=X8S4oQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase-native: explicitly disable icu
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
X-List-Received-Date: Tue, 18 Feb 2014 17:01:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 12:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * Jonathan Liu reported that qtbase-native was failing to build for him
>   and it looks like qtbase-native was trying to link against icu from his
>   host (instead of icu-native because it isn't in DEPENDS)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

