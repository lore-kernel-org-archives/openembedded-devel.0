Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 23E8A7FD16
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:35:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m24so15599469wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IefkceMEZvMcdaDQv1yVbj4Uv+eUSM0XRUbRIwR+qu4=;
	b=pYRfHQ3UbnuSREoPIBnl38PkMww6QYd1a6ILY7l6lrCf/vU4LzcDCxq4UmFxELPvTW
	a2LO7yAyL+qOv1cD3lJ88bGsnBzyZpl43aZRpP1FhUwVINuPWF1a/LjenFKpSExq9JyE
	qtiVxH0vJPxMPLWmPvNcknYf2emBPpwlMhPRlt3invM/xa1n/dkelbiQNGrNy8H4zFpM
	fAI9nzRKU4sUmKXFbTZNspbifYyNilyjO+nzDHgECxZbfZ3w4FLoxoARz1WiLSUNQfvy
	hUp78IXUYKp1OX6Q4EQW1DQIjoQlIxSxRGVoEJSokNM3eVonmRpupTuBXu/G/6241MYy
	SS8w==
X-Gm-Message-State: APjAAAVK9lUWypZgECRMvyZm5bNunjQvBm2fayfCcrrJJUzyZxmkULhx
	n+DWV7EAnJGaJ6GN7KkYtknKVjXI
X-Google-Smtp-Source: APXvYqwPFbXW7gN33MDMGrDOa+6RbuqoEGoSRSBMHtb0f0UL+qU5BKqn+cSbyF7xVIS8V/bbDZIoVQ==
X-Received: by 2002:a05:600c:409:: with SMTP id
	q9mr35207319wmb.19.1578328528709; 
	Mon, 06 Jan 2020 08:35:28 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i5sm23341894wml.31.2020.01.06.08.35.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:35:28 -0800 (PST)
Message-ID: <d1ef5ae378781428111ed9474e4c1ee55055d871.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 06 Jan 2020 16:35:27 +0000
In-Reply-To: <20200106154718.6095-1-nick83ola@gmail.com>
References: <20200106154718.6095-1-nick83ola@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-python][PATCH] python3-jsonrpcserver: update to 4.1.0
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
X-List-Received-Date: Mon, 06 Jan 2020 16:35:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Already done here
http://lists.openembedded.org/pipermail/openembedded-devel/2020-January/203992.html

Cheers,
Andre'

On Mon, 2020-01-06 at 15:47 +0000, Nicola Lunghi wrote:
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  ...-jsonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} (71%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb b/meta-python/recipes-
> devtools/python/python3-jsonrpcserver_4.1.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
> index bf9eb0a1c..c0b06b316 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
>  
> -SRC_URI[md5sum] = "d41e9f6b310cb29b0d8f213ff9d57567"
> -SRC_URI[sha256sum] = "240c517f49b0fdd3bfa428c9a7cc581126a0c43eca60d29762da124017d9d9f4"
> +SRC_URI[md5sum] = "c1cc652bdeb04b8ce3ad962fbab34daf"
> +SRC_URI[sha256sum] = "3a35c0ef21174ca98f995f99688cebadda97053785833fbb31ec862d6b157f6d"
>  
>  inherit pypi setuptools3
>  
> -- 
> 2.20.1
> 


