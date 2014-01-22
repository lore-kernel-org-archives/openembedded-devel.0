Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 923A860017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:25:06 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so492526oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=AWWnSwTrTC6K4+B3wUwrO1lM8H5C/Si5QgoJU/h7ukE=;
	b=YSgu0gZ55JXC7NqlOWQf4b7pMmdkRiyeFOZMW0S2uxE2RstURlIC0o4j49vzgIT/LQ
	5g/w3L0Elq0qF/dxdSn9Gu8rkgGqWeKZ5WqJ1SfSSDlGSJ3YPqqE/rN1rucfNKDMRRv7
	vo1p4On64Oqw094+GJNCNsRM1Nj6u7gsTpSm+V+SHyYUXYRFDHxxyQz7AUvdLf7FJ5c6
	O8U2XgNMl6urtjJxrLwUuDropNgHcmdbrpPaQ+CNobnIqup44oRIJXhFHboDdEwORf6M
	Oc9piTPH5gEbGoSoDPX/fzoZwZ2G2KxW2u2LId5G8WPN1ZmMilHbpu8ueaovErN516Ua
	+0tw==
MIME-Version: 1.0
X-Received: by 10.60.99.8 with SMTP id em8mr1562045oeb.8.1390400706895; Wed,
	22 Jan 2014 06:25:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:25:06 -0800 (PST)
In-Reply-To: <1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 22 Jan 2014 12:25:06 -0200
X-Google-Sender-Auth: SJIln-PRBvUdAIVCdfotwvcXF8I
Message-ID: <CAP9ODKqr+ZTUVT4tAxow9GQB62PT+7S0vLAdBrHmV6eMFFFCBQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/4] elementary: Add PACKAGECONFIG for ewebkit and disable it by default
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
X-List-Received-Date: Wed, 22 Jan 2014 14:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 3:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * with floating dependency some packages can fail to detect elementary:
>   Package 'ewebkit', required by 'elementary', not found
> * webkit-efl isn't in very good shape, so I don't want to force using
>   it on everybody -> disable ewebkit by default
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

